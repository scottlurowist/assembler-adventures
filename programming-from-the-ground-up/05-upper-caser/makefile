c: toupper.o
	ld -m elf_i386 -o toupper toupper.o
toupper.o: toupper.s
	as -g --32 toupper.s -o toupper.o
.PHONY: clean
clean:
	rm -f *.o toupper