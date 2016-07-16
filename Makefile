all:
	as -32 boot.s -o boot.o
	gcc -m32 -c kernel.c -o kernel.o -ffreestanding -nostdinc
	gcc -m32 -T linker.ld boot.o kernel.o  -o kernel.bin -nostdlib -ffreestanding

clean:
	rm -rf *.o *.bin
