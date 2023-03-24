- testin 

```console
find . -type f -exec stat -c "%y %i" {} \; 
	| sort -r 
	| uniq -d 
	| awk '{print $NF}' 
	| head -n 1
```

- testin2

```sh
ls .
```

