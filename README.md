# How to run

```
# (Generate `lex.yy.c`)
$ flex calc.l

# (Generate `calc.tab.c` + `calc.tab.h`)
$ bison -d calc.y

$ gcc lex.yy.c calc.tab.c -o calc
$ ./calc
```
