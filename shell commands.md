- Print the inode of the most recently modified file (in terms of content) in the current directory or one of its subdirectories, that has more than one name. 

```console
find . -type f -exec stat -c "%y %i" {} \; \
  | sort -r \
  | uniq -d \
  | awk '{print $NF}' \
  | head -n 1
```

- Find the top 5 files in the current directory in terms of number of hardlinks. It is assumed(?) that all the hardlinks are in the current folder.

```console
find . -maxdepth 1 -type f -exec stat -c "%h %n" {} \; \
  | sort -rn \
  | awk '!seen[$1]++ {print $2}' \
  | head -n 5
```

Note: The above prints only one filename per inode. If all hardlink names are wanted, then the '!seen[$1]' part is to be removed.

- Given a text file, find the number of lines that contain at least one odd digit and do not contain any lowercase letter from `a` to `w`.

```console
cat filename.txt | grep [02468] | grep -v [a-w] | wc -l
```
