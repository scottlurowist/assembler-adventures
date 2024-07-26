power: power.o
	ld -m elf_i386 -o power power.o
power.o: power.s
	as -g --32 power.s -o power.o
.PHONY: clean
clean:
	rm -f *.o power