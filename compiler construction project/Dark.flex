%{
#include <iostream>
  #include "g.tab.h"
  using namespace std;
  extern int yylex();
%}
%option noyywrap
keyword show|capture|entier|flotter|deployer|lead|terminate                  
digits   [0-9]
Id      [a-zA-Z_][a-zA-Z_0-9]*  
operator "~n"|"~t"|"~%"|"~+"|"~-"|"~/"|"~*"|"~="|"~=="|"~!="|"~++"|"~--"|"~<"|"~>"|"~<="|~>=  
%%
{digits}+                        				  { yylval.eval = atoi(yytext); return DIGIT; } 
{digits}+"."{digits}+              				   { yylval.fval = atof(yytext); return DECIMAL; } 
{keyword}                                     { yylval.cval = strdup(yytext); return KEYWORD; } 
{operator}                                         { yylval.cval = strdup(yytext); return OPERATOR; } 
{Id}                                       { yylval.cval = strdup(yytext); return ID; } 
~restrict|~go				 { yylval.cval = strdup(yytext);  return CONDITION; } 
~snake                            	{ yylval.cval = strdup(yytext);  return FORLOOP; } 
\"(\\.|[^"\\])*\"	              				 { yylval.cval = strdup(yytext);  return CARBONISER; } 
~interval                           			 { yylval.cval = strdup(yytext);  return WHILELOOP ; } 
"{"|"}"|"("|")"|"#"|","|";"                       { yylval.cval = strdup(yytext);  return SEPARATOR; } 
%%


