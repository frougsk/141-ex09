HI RAF ITO NA UNG NAGAWA KO:

The following features should be implemented:
~~1. It should be able to accept integer and floating-point values.~~ OK NA TO
~~2. Allow simple floating point calculations involving addition, subtraction, multiplication and division,
e..g., (–1.0+2.5/(3.33–2))*4. Note: negative numbers are allowed, and sub-expressions can be
grouped using pairs of parentheses. These should follow the basic PEMDAS rules, with
left-associative rules for the 4 basic arithmetic operations.~~ OK NA RIN TO
3. Allow exponentiation with integer exponents using the caret symbol, e.g., 2.0^2^3. As in most
programming languages, exponentiation is right-associative, thus the expression above evaluates to
256.0.
4. Allow storage using one letter variable names and multiple assignments. For example, we should
allow in separate lines a=b=1.2 then (a+b)*2.0 should evaluate to 4.8.
5. Handle errors gracefully, either exiting gracefully or continue to next expression.

na setup na rin 3-5, if may other questions pm moko

how to run:
bison -d simple_calc.y
flex scanner.lex
gcc simple_calc.tab.c lex.yy.c -lm -o calc
./calc < sample.in
