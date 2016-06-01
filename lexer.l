/************************************
* @subject 	: Advanced Programming Languages
* @auther  	: Sri Mounika Puvvada
* @project 	: 3
* @fileleName	: lexer.l
* @purpose  	: To generate the tokens for the given input file
************************************/


%{ 
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#define ROWS 50
#include "y.tab.h"
void yyerror(char *); 
%} 

%% 


"void"	     return VOID;
"main"       return MAIN;
"int"	     return INT;	
"if"         return IF;
"else"	     return ELSE;
"read"	     return READ;
"write"	     return WRITE;
"while"	     return WHILE;
">"	     return GREATERTHAN;
">="	     return GREATERTHANEQUAL;
"<"	     return LESSTHAN;
"<="	     return LESSTHANEQUAL;
"=="	     return EQUALTO;
"<>"	     return NOTEQUALTO;
[a-zA-Z](_?[a-zA-Z0-9]+)*       {  
			return VARIABLE; 
		} 

[0-9]+      {
			return INTEGER; 
		} 
"/*"([^*]|\*+[^*/])*\*+"/"	{
			/*do nothing*/
		}
[-()+*/;{}.,=_] { 
			return *yytext; 
		 } 

[ \t\n]+        ;       /* ignore whitespace */ 

.		{
			printf("%s:",yytext);  
			yyerror("Unknown character "); 
		} 
%% 


/***************************
* @purpose		: To take one input file
* @parameter		: takes void parameter
* @return 		: integer value one to indicate that stop taking input file 
****************************/
int yywrap(void) { 
			return 1; 
		}
