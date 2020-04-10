all: hello.asm
	nasm -g -f elf64 -F dwarf programm.asm
	ld programm.o -o programm.out

clean:
	-rm *.out
	-rm *.o
	-rm *~