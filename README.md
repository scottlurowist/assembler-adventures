# Assembler Adventures

These are programs from the free eBook
[Programming From The Ground Up](https://download-mirror.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-1-0-booksize.pdf)
by Jonathan Bartlett. This book is about 20 years old and uses 32-bit Intel registers. It is 
written for the GNU assembler and linker using `AT&T syntax`.

These programs are targeted at Linux and assembled for 32-bit Intel registers. 32-bit Intel is now dated but these programs serve pedagogical purposes. If you are interested in 64-bit register versions, please explore this [Github Repository](https://github.com/swseverance/programming-from-the-ground-up).

Each program is in a folder (e.g. 01-exit). Within each folder is the source code and a makefile. Simply run the makefile to build the program. 
Type: `echo $?` in order to see the output as most of the programs do not write to standard output.

***
### 01-exit

This program is a few notches above "Hello World!". It shows how to exit from a 32-bit Linux 
program.

***
### 02-maximum

This program shows how to use an array. The array contains a list of numbers that are not sorted.
The program finds the maximum value in the list. It shows how to use the `.data` section and how to use `loops`.

***
### 03-power

Now the fun begins as functions are employed. This program finds the solution to 2^3 + 5^2.

***
### 04-factorial

03-power introduced functions. Now we raise the stakes and introduce recursion into the mix.
This also demonstrates how to make a function visible to the linker using `.globl`.
