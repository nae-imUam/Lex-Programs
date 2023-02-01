%option noyywrap
%{
	int count=0;
	int spch =0;
%}
digit     [0-9]
letter    [A-Za-z_]
specialChar [,|<|>|.|_|(|)|;|$|:|%|#|?|'|&|{|}|"|^|!|*|/|-|\|~|+|=|]
space      [ ]
%% 

([ ])int|float|char|enum|long|struct|double|void([ ]) {count++;}
{specialChar}|{digit}|{letter}|([ ])|\n {spch++;}
%%
int main()
{
	yyin=fopen("sample.cpp","r");
	yylex();
	printf("No of identifiers : %d\n",count);

	return 1;
}