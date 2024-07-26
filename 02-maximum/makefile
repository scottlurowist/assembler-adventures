maximum: maximum.o
	ld -m elf_i386 -o maximum maximum.o
maximum.o: maximum.s
	as -g --32 maximum.s -o maximum.o
.PHONY: clean
clean:
	rm -f *.o maximum
