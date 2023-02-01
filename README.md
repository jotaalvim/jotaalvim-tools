# jotaalvim-tool
a collection of small and simple scrips made by me

## ddl - Delete duplicated lines
Delete repeated lines in file, ignores empty lines and "empty" lines who have ``` `{ }``` in them. Similar to
```
sort | uniq
```
or
```
sort -u
```
however, using this tool you keep the same relative order in the file.

## ddf - Delete duplicated files
uses md5 hash to find and delete duplicates files

Avalibale options 
* -r, recursive mode 
* -h, help


## todo
sort teste | uniq -c | sort -n
