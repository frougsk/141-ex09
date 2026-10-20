/*extended calculator starter, floats and parentheses work na*/
%{  // section 1a: c declarations
  #include <stdio.h>
  #include <math.h>
  int yylex();
  void yyerror(char *s);

  //todo step 2 declare the two arrays for variables here
  //one holds the values and one remembers if a letter was set
%}

// section 1b: yacc/bison declarations
%union {
  double dval;
  char varName;
}

/*declare tokens*/
%token <dval> NUMBER
%token <varName> VAR
%token ADD SUB MUL DIV POW ASSIGN
%token LPAREN RPAREN
%token EOL QUIT BADCHAR

//todo step 1 and 2 add the new rule names to this type line
%type <dval> exp term atom

%%  // section 2: grammar rules
calclist: /*nothing*/		//matches at beginning of input
  | calclist exp EOL 		{printf("=%g\n", $2);} //EOL is end of an expression
  | calclist EOL			//blank line so just move on
  | calclist QUIT 			{printf("Exiting...\n"); return 0;}
  //todo step 3 add the error rule here so a bad line gets skipped
  //todo step 2 swap exp for assign in the print rule once assign exists
  ;

//todo step 2 write the assign rule here
//it must be right associative so a=b=1.2 works

exp: term 					//default $$ = $1
  | exp ADD term 			{$$ = $1 + $3;}
  | exp SUB term 			{$$ = $1 - $3;}
  ;

term: atom 					//change this to unary in step 1
  | term MUL atom 			{$$ = $1 * $3;}
  | term DIV atom 			{$$ = $1 / $3;}
  //todo step 3 stop division by zero before it happens
  ;

//todo step 1 write the unary rule here for negative numbers
//todo step 1 write the power rule here for the caret
//hint the right side of the caret decides the associativity

atom: NUMBER 				//default $$ = $1
  | LPAREN exp RPAREN 		{$$ = $2;}
  //todo step 2 add a VAR alternative that reads the stored value
  //todo step 2 let the parentheses hold an assign instead of an exp
  ;
%%

// section 3: additional c code
void yyerror(char *s){
  fprintf(stderr, "error: %s\n", s);
}

int main(int argc, char **argv){
  yyparse();
  return 0;
}
