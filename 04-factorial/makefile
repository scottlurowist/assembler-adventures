factorial: factorial.o
	ld -m elf_i386 -o factorial factorial.o
factorial.o: factorial.s
	as -g --32 factorial.s -o factorial.o
.PHONY: clean
clean:
	rm -f *.o factorial