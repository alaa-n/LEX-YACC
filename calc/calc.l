%{
extern int yylval; 
extern int sym[];
extern int yyerror(char *s);
#include "y.tab.h"
#include "stdlib.h"  // to use strtol() for HEX
%}

%%

[a-z]   {
	   yylval = *yytext - 'a';
	   return VARIABLE;
        }

[0-9]+  {  
           yylval = atoi(yytext);
           return INTEGER;
        }

0x[0-9a-fA-f]   {
            yylval = strtol(yytext+2, NULL, 16);    // strtol(string, NULL, base)
            return HEX;
        }


":="    return ASSIGN;
"+"     return PLUS;
"*"     return TIMES;
"-"     return MINUS;       // Bsp 5.1
"/"	    return DIVIDE;      // Bsp 5.1
"%"	    return MOD;         // Bsp 5.1
"("     return LPAREN;      // Bsp 5.3
")"     return RPAREN;      // Bsp 5.3

">"     return GREATER;
">="    return GR_EQUAL;
"=="    return EQUAL;
"<="    return LESS_EQUAL;
"<"     return LESS;

"min"   return MIN;
"max"   return MAX;
"avg"   return AVG;
","     return COMMA;

"?"     return IF;          // Bsp 5.8
":"     return ELSE;        // Bsp 5.8

"\n"    return NEWLINE;

[ \t]   ;

.       yyerror("Invalid character");

%%

int yywrap() {
 return 1;
}
