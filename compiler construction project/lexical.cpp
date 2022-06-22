#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>

int comapreString(char string1[], char string2[])
{
	int isStringCompare = 0;
	int i=0;
	while(string1[i] == string2[i] && string1[i] !='\0')
		i++;
	
	if(string1[i] == string2[i])
		isStringCompare = 1;
		
	return isStringCompare;
}

void forRationalOperator(char bufferOperator[])
{
	char rationalOperator[30][10] = {"~>=","~<=","~==","~!=","~<","~>",",","~+","~-","~*","~/","~%","~t","~n"}, assignmentOperator[3]="~=";
	int isRationalOperator = 0;
	if(comapreString(assignmentOperator, bufferOperator) == 1)
	{
		printf("This is assignment operator: %s\n", bufferOperator);
		isRationalOperator = 1;
	}
	if(isRationalOperator == 0)
		for(int i=0; i<7; ++i)
		{
			if(comapreString(rationalOperator[i],bufferOperator) == 1)
			{
				printf("This is rational operator: %s\n", bufferOperator);
				break;
			}
		}
}

void forNumberAndFloat(char bufferNumber[])
{
	int isFloat =0, i=0;
	while(bufferNumber[i++]!= '\0')
	{
		if(bufferNumber[i] == '.')
		{
			printf("This is float: %s\n", bufferNumber);
			isFloat = 1;
			break;
		}
	}
	if(isFloat == 0)
		printf("This is number: %s\n", bufferNumber);
}

int forKeyword(char bufferString[])
{
	char keywords[14][15]= {"~show", "~capture", "~entier", "~flotter", "~deployer", "~lead", "~terminate"};
	char loops[14][15]= {"~snake","~interval"};
	char conditions[14][15]= {"~restrict","~go"};
	
	int headerFileKeyword = 0, isMatch = 0;
	if(comapreString("addDark.hash",bufferString) == 1)
	{
		printf("This is header file keyword: %s\n", bufferString);
		headerFileKeyword = 1;
		isMatch = 1;
	}
	else if(comapreString(".",bufferString) == 1)
	{
		headerFileKeyword = 1;
		isMatch = 1;
	}
	else if(comapreString(",",bufferString) == 1)
	{
		headerFileKeyword = 1;
		isMatch = 1;
	}
	
	if(headerFileKeyword == 0)
		for(int i = 0; i < 13; ++i)
		{
			if(comapreString(keywords[i],bufferString) == 1)
			{
				printf("This is keyword: %s\n", bufferString);
				isMatch = 1;
			}
			if(comapreString(loops[i],bufferString) == 1)
			{
				printf("This is loop: %s\n", bufferString);
				isMatch = 1;
			}
			if(comapreString(conditions[i],bufferString) == 1)
			{
				printf("This is condition: %s\n", bufferString);
				isMatch = 1;
			}
		}
		
	return isMatch;
}

int main()
{
	char character,bufferString[15], bufferOperator[15], bufferNumber[15], operators[6] = "+-x/%";
	int j = 0, k = 0, l = 0;
	
	FILE *filePointer;
	filePointer = fopen("dark.hash", "r");
	if(filePointer == NULL)
	{
		printf("Something went wrong, while opening the file\n");
		exit(0);
	}
	while((character = fgetc(filePointer)) != EOF)
	{
		for(int i = 0; i < 6; ++i)
		{
			if(character == operators[i])
				printf("This is operator: %c\n", character);
		}
		if(character == ';')
		{
			printf("This is seperator: %c\n", character);
		}
		if(character >='0' && character <= '9' || bufferNumber[l-1] >= '0' && bufferNumber[l-1] <= '9' && character == '.')
		{
			bufferNumber[l++] = character;
		}
		if(character == '<' || character == '>' || character == '=')
		{
			bufferOperator[k++] = character;
		}
		if((character >= 'a' && character <= 'z' || (character >= 'A' && character <= 'Z') || character == '.'))
		{
			bufferString[j++] = character;
		}
		if((character == ' ' || character == '\n'))
		{
			bufferString[j] = '\0', bufferOperator[k] = '\0';
			if(j!=0)
			{
				if(forKeyword(bufferString) == 0)
				{
					printf("This is indentifier: %s\n", bufferString);
				}
			}
			if(k!=0)
				forRationalOperator(bufferOperator);
			if(l != 0)
			{
				forNumberAndFloat(bufferNumber);
				memset(bufferNumber, '\0', 15);
			}
			j = 0, k = 0, l = 0;
		}
		if(character == '"')
		{
			printf("This is quotation: %c\n", character);
		}
		if(character == '{' || character == '}')
		{
			printf("This is parenthesis: %c\n", character);
		}
	}
	fclose(filePointer);
	return 0;
}
