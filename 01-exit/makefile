exit: exit.o
	ld -m elf_i386 -o exit exit.o

exit: exit.s
	as -g --32 exit.s -o exit.o

.PHONY: clean
clean:
	rm -f *.o exit
