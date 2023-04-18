# jotaalvim-tools
This is collection of homemade scrips made to experiment with different techniques and languages.


## ddl - Delete duplicated lines
Delete repeated lines in file, ignores empty lines and "empty" lines who have ````{ }``` in them. Similar to

```
sort | uniq
```
or
```
sort -u
```
using this tool you keep the same relative order in the file.


## ddf - Delete duplicated files
Deletes duplicated file in a directory, it uses md5 to hash the content and find the repeated files. 

