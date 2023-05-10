%{
#include <stdio.h>
extern int yylex(void);
void yyerror(const char *s) { printf("%s\n", s); }
int result;
%}

%token NUMBER
%token EOL

%%

calculation: /* empty */
| calculation line
;

line: EOL
| expr EOL { printf("%d\n", $1); }
;

expr: NUMBER
| expr '+' expr { $$ = $1 + $3; }
| expr '-' expr { $$ = $1 - $3; }
| expr '*' expr { $$ = $1 * $3; }
| expr '/' expr { if ($3 == 0) yyerror("divide by zero"); else $$ = $1 / $3; }
| '(' expr ')' { $$ = $2; }
;

%%

int main(void) {
    yyparse();
    return 0;
}
