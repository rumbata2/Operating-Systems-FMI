- Print the inode of the most recently modified file (in terms of content) in the current directory or one of its subdirectories, that has more than one name. 

```console
find . -type f -exec stat -c "%y %i" {} \; \
  | sort -r \
  | uniq -d \
  | awk '{print $NF}' \
  | head -n 1
```

- Placeholder for Q2

```sh
ls .
```

