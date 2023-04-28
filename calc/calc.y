%{
#include <stdio.h>
int sym[26];
int yylex();
int yyerror(char *s);

int count = 1;
%}

%token VARIABLE ASSIGN INTEGER NEWLINE HEX
%token LPAREN RPAREN
%token MIN MAX AVG COMMA
%token IF ELSE

/* REIHENFOLGE WICHTIG!! SONST RECHENREGELN VERLETZT!! (Reiheinfolge: kleinste Prio zuerst) */
%left MOD
%left PLUS MINUS
%left TIMES DIVIDE
%left GREATER GR_EQUAL EQUAL LESS_EQUAL LESS // Bsp 5.5

%%

program: program statement
       | 
       ;

statement: expr NEWLINE 
	     { printf("%d\n", $1); }
         | VARIABLE ASSIGN expr NEWLINE
             { sym[$1] = $3; }
         ;

expr: INTEGER                   { $$ = $1; }
      | HEX                     { $$ = $1; }          // Bsp 5.9
      | VARIABLE                { $$ = sym[$1]; }
      | comparison	 	        { $$ = $1; }          // Bsp 5.5
      | LPAREN expr RPAREN      { $$ = $2; }          // Bsp 5.3
      | PLUS expr               { $$ = $2; }          // Bsp 5.4
      | MINUS expr              { $$ = - $2; }        // Bsp 5.4
      | expr MINUS expr         { $$ = $1 - $3; }     // Bsp 5.1
      | expr PLUS expr          { $$ = $1 + $3; }
      | expr TIMES expr         { $$ = $1 * $3; }
      | expr DIVIDE expr        { $$ = $1 / $3; }     // Bsp 5.1
      | expr MOD expr           { $$ = $1 % $3; }     // Bsp 5.1
      | function                { $$ = $1; }          // Bsp 5.6
      | condition               { $$ = $1; }          // Bsp 5.8
      ;

// Bsp 5.5:
comparison: expr GREATER expr   {$$ = $1 > $3? 1 : 0; }
      | expr GR_EQUAL expr      {$$ = $1 >= $3? 1 : 0; }
      | expr EQUAL expr         {$$ = $1 == $3? 1 : 0; }
      | expr LESS_EQUAL expr    {$$ = $1 <= $3? 1 : 0; }
      | expr LESS expr          {$$ = $1 < $3? 1 : 0; }
      ;

// Bsp 5.6 & 5.7:
function: MIN LPAREN min RPAREN {$$ = $3; }
      | MAX LPAREN max RPAREN   {$$ = $3; }
      | AVG LPAREN avg RPAREN   {$$ = $3; }
      ;
min: expr COMMA min {$$ = $1 < $3? $1: $3; }
      | expr        {$$ = $1;}
      ;
max: expr COMMA max {$$ = $1 > $3? $1: $3; }
      | expr        {$$ = $1;}
      ;
sum: expr COMMA sum {$$ = $1 + $3; count++;}
      | expr        {$$ = $1;}
      ;
avg: sum {$$ = $1/count; count = 1;}
      ;

// Bsp. 5.8:
condition: LPAREN expr RPAREN IF expr ELSE expr { $$ = $2 != 0 ? $5 : $7; }

%%

int yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
  return 0;
}

extern int yy_flex_debug;
int main() {
  yy_flex_debug = 0;
  yyparse();
  return 0;
}
