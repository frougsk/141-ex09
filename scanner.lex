%{
  #include <stdlib.h>
  #include "simple_calc.tab.h"
%}

%option noyywrap

NUM		([0-9]+\.?[0-9]*|\.[0-9]+)
LETTER	[a-zA-Z]

%%
"+"			{return ADD;}
"-"			{return SUB;}
"/"			{return DIV;}
"*"			{return MUL;}
"^"			{return POW;}
"="			{return ASSIGN;}
"("			{return LPAREN;}
")"			{return RPAREN;}
{NUM}		{yylval.dval = atof(yytext); return NUMBER;}
"exit"		{return QUIT;}
{LETTER}	{yylval.varName = *yytext; return VAR;}
\n			{return EOL;}
[[:space:]]	{/*ignore white space*/}
.			{printf("\nUnrecognized string %c\n", *yytext); return BADCHAR;}
%%
