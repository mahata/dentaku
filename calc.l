%option noyywrap
%{
#include "calc.tab.h"
%}

%%

[0-9]+    { yylval = atoi(yytext); return NUMBER; }
[+\-\*/]  { return yytext[0]; }
\n        { return EOL; }
[ \t]     { /* ignore whitespace */ }
.         { /* ignore everything else */ }

%%
