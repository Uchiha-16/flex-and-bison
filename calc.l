%{
#include <stdio.h>
#include "calc.tab.h"
#include <string.h>
int line = 1;
%}

digit [0-9]

%%
"println" { return(TOK_PRINTLN);}
{digit}+ { sscanf(yytext, "%d", &(yylval.int_val));
            return TOK_NUM; }
{digit}+"."{digit}+ { sscanf(yytext, "%f", &(yylval.float_val));
            return TOK_FLOATNUM; }

";" { return(TOK_SEMICOLON); }
"+" { return(TOK_ADD); }
"-" { return(TOK_SUB); }
"*" { return(TOK_MUL); }
"/" { return(TOK_DIV); }
"main()" { return(TOK_MAIN_FUN); }
"{" { return(TOK_OPEN_CURLY); }
"}" { return(TOK_CLOSE_CURLY); }
"printvar" { return(TOK_PRINT_VAR); }
"int" { return(TOK_INT); }
"float" { return(TOK_FLOAT); }

\n { line++; }
. {printf("Invalid character '%c‘\n", yytext[0]);}
%%

int yywrap(void){
    return 1;
}
