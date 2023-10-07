%{ 
  #include <stdio.h>
  #include "lex.yy.c"
  void yyerror();
%} 

%token NUMBER 
%left '+' '-'
%left '*' '/'
%left '%'
%left '(' ')'

%start G
%%
G: E  { $$ = $1;
        printf("\n*******************OUTPUT*****************\n"); 
        printf("\nanswer = %d\n", $$); 
        return 0; 
      };

E: E'+'T {$$ = $1 + $3;}
|  E'-'T {$$ = $1 - $3;}
|  T     {$$ = $1;};

T:  T'*'F {$$ = $1 * $3;}
|   T'/'F {
            if ($3 == 0) {
                printf("Division by zero, can't be performed, invalid");
                return -1;
            }
            $$ = $1 / $3;
            
          }
| T'%'F   {
            $$ = $1 % $3;
          }
|   F     {$$ = $1;}; 

F: NUMBER {$$ = $1;} 
| '('E')' {$$ = $2;};
%%


void main() 
{ 
   printf("Enter an expression with +, -, *, /, mod \n");  
   yyparse();
} 
  
void yyerror() 
{ 
   printf("invalid expression\n"); 
} 