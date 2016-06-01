final:	lex.yy.o y.tab.o 
	gcc -o final lex.yy.o y.tab.o

lex.yy.c:lexer.l
	lex lexer.l

y.tab.c y.tab.h :parser.y
	yacc -d parser.y

lex.yy.o:lex.yy.c y.tab.h
	gcc -c lex.yy.c

y.tab.o:y.tab.c y.tab.h
	gcc -c y.tab.c

