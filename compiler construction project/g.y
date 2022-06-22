%{
  #include <iostream>
  #include <bits/stdc++.h>
  using namespace std;
  ofstream File("output.txt");
  // Declare stuff from Flex that Bison needs to know about:
  extern int yylex();
  extern int yyparse();
  extern FILE *yyin;
 
  void yyerror(const char *s);
%}

%union {
  int eval;
  float fval;
  char *cval;
}
%token <eval> DIGIT 
%token <fval> DECIMAL
%token <cval> CARBONISER 
%token <cval> KEYWORD
%token <cval> OPERATOR 
%token <cval> ID 
%token <cval> CONDITION 
%token <cval> FORLOOP 
%token <cval> WHILELOOP 
%token <cval> SEPARATOR
%%

gt:

	DIGIT gt	{
		cout << "bison found  digit: " << $1 << endl;
    File << "<DIGIT> " << $1 << endl;
	}
  |
  DECIMAL gt	{
		cout << "bison found  decimal: " << $1 << endl;
    File << "<DECIMAL> " << $1 << endl;
	}
  |
  CARBONISER gt	{
		cout << "bison found  string: " << $1 << endl;
    File << "<STRING> " << $1 << endl;
	}
  |
  OPERATOR gt	{
		cout << "bison found  operator: " << $1 << endl;
    File << "<OPERATOR> " << $1 << endl;
	}
  |
  ID gt	{
		cout << "bison found  identifier: " << $1 << endl;
    File << "<IDENTIFIER> " << $1 << endl;
	}
  |
  FORLOOP gt	{
		cout << "bison found  for loop: " << $1 << endl;
    File << "<For-Loop> " << $1 << endl;
	}
 
  |
  WHILELOOP  gt	{
		cout << "bison found  while loop: " << $1 << endl;
    File << "<While-Loop> " << $1 << endl;
	}
   |
  CONDITION  gt	{
		cout << "bison found  while loop: " << $1 << endl;
    File << "<CONDITION> " << $1 << endl;
	}
  |
  SEPARATOR gt	{
		cout << "bison found  separator: " << $1 << endl;
    File << "<SEPARATOR> " << $1 << endl;
	}
  |
  KEYWORD gt	{
		cout << "bison found  keyword: " << $1 << endl;
    File << "<KEYWORD> " << $1 << endl;
	}
  |	
  KEYWORD 	{
		cout << "bison found keyword: " << $1 << endl;
    File << "<KEYWORD> " << $1 << endl;
	}
  |
  DIGIT 	{
		cout << "bison found  digit: " << $1 << endl;
    File << "<DIGIT> " << $1 << endl;
	}
  |
  DECIMAL{
		cout << "bison found  decimal: " << $1 << endl;
    File << "<DECIMAL> " << $1 << endl;
	}
  |
  CARBONISER {
		cout << "bison found  string: " << $1 << endl;
    File << "<STRING> " << $1 << endl;
	}
  |
  OPERATOR {
		cout << "bison found  operator: " << $1 << endl;
    File << "<OPERATOR> " << $1 << endl;
	}
  |
  ID 	{
		cout << "bison found  identifier: " << $1 << endl;
    File << "<IDENTIFIER> " << $1 << endl;
	}
  |
  FORLOOP {
		cout << "bison found  for loop: " << $1 << endl;
    File << "<For-Loop> " << $1 << endl;
	}

  |
  WHILELOOP {
		cout << "bison found  while loop: " << $1 << endl;
    File << "<While-Loop> " << $1 << endl;
	}
  |
  CONDITION {
		cout << "bison found  condition: " << $1 << endl;
    File << "<CONDITION> " << $1 << endl;
	}
  |
  SEPARATOR{
		cout << "bison found  separator: " << $1 << endl;
    File << "<SEPARATOR> " << $1 << endl;
	}
	;
%%
		
int main(int, char**) {

  FILE *myfile = fopen("dark.hash", "r");

  if (!myfile) {
    cout << "I can't open dark.hash!" << endl;
    return -1;
  }
 
  yyin = myfile;
  
  yyparse();
  
}

void yyerror(const char *s) {
  cout << "EEK, parse error!  Message: " << s << endl;
  exit(-1);
}
