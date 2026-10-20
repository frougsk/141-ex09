HI RAF ITO NA UNG NAGAWA KO:

1. OKAY na ung scanner.lex, di na need palitan UNLESS necesary

how to run:
bison -d simple_calc.y
flex scanner.lex
gcc simple_calc.tab.c lex.yy.c -lm -o calc
./calc < sample.in
