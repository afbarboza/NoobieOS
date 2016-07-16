.set		MAGIC,		0x1BADB002
.set		FLAGS,		0 | 1
.set		CHECKSUM,	-(MAGIC + FLAGS)
.set		STACK_SIZE,	0x4000

/*.section	.multiboot
.align		4, 0
.long		MAGIC
.long		FLAGS
.long		CHECKSUM */

.section	.text
.globl		start, _start

start:
_start:
	jmp	multiboot_entry
	.align	4
multiboot_header:
	.long	MAGIC
	.long	FLAGS
	.long	CHECKSUM

multiboot_entry:
	movl	$(stack + STACK_SIZE), %esp
	pushl	$0
	popf
	pushl	%ebx
	pushl	%eax
	call	kernel_main
loop:	hlt
	jmp	loop

	.comm	stack, STACK_SIZE
