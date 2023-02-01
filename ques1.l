
%{
	#include<stdio.h>
	
	int nlines=0, nchar=0;
%}


%%
[\n] {nlines++;}
. {nchar++;}
%%
int main()
{
	yyin = fopen("ques1.l", "r");
		yylex();
		printf("\nFile contents...\n");
		printf("\n\t%d Line : ", nlines);
		printf("\n\t%d Character : ", nchar);
	return 0;
}

int yywrap()
{
	return 1; 
}


