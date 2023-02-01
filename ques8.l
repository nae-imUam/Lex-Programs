%option noyywrap
%{
	#include<strings.h>
	int opcount=0,intcount=0,check=1,top=0, prnt=0;;
%}
%%
['('] {check=0;}
[')'] {check=1;}
[+|*|/|-] {opcount++; prnt=1;}
[0-9]+ {intcount++; prnt=1;}
. {printf("Invalid Input(only digits and +|-|*|/ is valid\n");}
[\n] {
	if(prnt==1)
	{
		if(intcount==opcount+1)
		{
			 if(check==1)
			 {
			    printf("\nExpression is CORRECT!\n");
			 }
			 else{
			    printf("\n')' bracket missing from expression\n");
			 }
		} 
		else
		{
		   printf("\nExpression is INCORRECT!\n");
		}
		prnt=0;
		opcount=0;
		intcount=0;
		check=1;
		printf("\nEnter expression : "); 
	}
	else
	{
		printf("Please, Enter your Expression or terminate this loop by pressing ctrl+c. ");
		printf("\nEnter expression : "); 
	}
}
%%
int main()
{
	printf("Enter expression : ");
	yylex();
	
	return 0;
}

