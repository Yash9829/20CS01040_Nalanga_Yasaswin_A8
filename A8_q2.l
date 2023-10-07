%{ 
	#include "y.tab.h"
	extern int yylval; 
%}


digits 		[0-9]+
operators 	(\+|\*|\-|\/|\%)
parantheses [()]

%% 
{digits} 	  { 
				yylval=atoi(yytext); 
				return NUMBER; 
		 	  }  
{operators}   { return yytext[0]; } 
{parantheses} { return yytext[0]; } 
[\t\n ]       { return 0; }
 z
%% 
int yywrap() 
{ 
	return 1; 
}
