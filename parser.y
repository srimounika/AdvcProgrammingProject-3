/************************************
 * @subject 	: Advanced Programming Languages
 * @auther      : Sri Mounika Puvvada
 * @project 	: 3
 * @fileName	: parser.y
 * @purpose     : To parse the given input file by taking tokens form checking the syntax
 ************************************/

%{ 
#include <stdio.h> 
#include <stdlib.h> 
#include <string.h>
#include <stdarg.h> 
#define ROWS 50

/* prototypes */ 
int yylex(void); 
void yyerror(char *s); 
%} 



%union {
   int iValue;
   char sIndex[ROWS];
}; 
%token <iValue> INTEGER 
%token <sIndex> VARIABLE 
%token  VOID MAIN IF ELSE WHILE GREATERTHAN GREATERTHANEQUAL LESSTHAN LESSTHANEQUAL EQUALTO NOTEQUALTO INT READ WRITE
%left '+', '-'
%left '*', '/'
 
 

 
 //syntax for parsing the file
%%  
program: 
        	VOID MAIN'(' ')' '{' declarations statements '}'                {  printf("Legal File\n");exit(0); } 
        	; 
 
declarations:
		declarations INT id_list VARIABLE ';'
		|
		; 	 
id_list:
		id_list  VARIABLE ','
		|
		;
statements:
		 statements assign
		| statements selector
		| statements iterator
		| statements read
		| statements write
		|
		;
assign:
		VARIABLE '=' expr ';'
		;
read:
		READ '(' VARIABLE ')' ';'
		;
write:
		WRITE '(' VARIABLE ')' ';'
		;
selector:
		IF  condition '{' statements '}' ELSE '{' statements '}'
		;

iterator:
		WHILE  condition  '{' statements '}'
		;

condition:
		'(' expr compare expr ')'
		;

compare:
		GREATERTHAN
		| GREATERTHANEQUAL
		| LESSTHAN
		| LESSTHANEQUAL
		| EQUALTO
		| NOTEQUALTO
		;
 
expr: 
         	 INTEGER                
    		| VARIABLE              
       		| expr '+' expr         
       		| expr '-' expr        
        	| expr '*' expr        
        	| expr '/' expr          
        	| '(' expr ')'          
        	;  
%% 
 
 
 
/*******************************
 * @purpose		: display error messages
 * @parameter		: a character pointer *s holds the error message
 * @return		: returns void
 ********************************/
void yyerror(char *s) { 
    fprintf(stdout, "%s\n", s); 
} 
 
 
 
/******************************
 * @purpose		: the program execution starts here
 * @parameter		: void as a parameter
 * @return		: returns integer value from main
 *****************************/
 int main(void) { 
   yyparse(); 
   return 0; 
}
