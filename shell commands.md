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

- Given the text file planets.txt, output, separated by tab, the name and mass of the object, which is simultaneously:

* the closest to the local star
* of the same type as the furthest from the local star

Where the first line of the file is a header which describes the format of the file.

Example file:

name;type;distance;mass;volume;density;speed
earth;T;1.00000011;1;1;5.52;29.7859
mars;T;1.52366231;0.107;0.151;3.94;24.1309
saturn;G;9.53707032;95;763.62;0.7;9.6724
mercury;T;0.38709893;0.055;0.056;5.43;47.8725
venus;T;0.72333199;0.815;0.857;5.24;35.0214
jupiter;G;5.20336301;318;1321.3;1.33;13.0697
neptune;I;30.06896348;17;57.747;1.76;5.4778
uranus;I;19.19126393;14.5;63.102;1.3;6.8352


