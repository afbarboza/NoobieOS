.set		MAGIC,		0x1BADB002
.set		FLAGS,		0 | 1
.set		CHECKSUM,	-(MAGIC + FLAGS)

.section	.multiboot
.align		4
.long		MAGIC
.long		FLAGS
.long		CHECKSUM

.section	.bootstrap_stack, "aw", @nobits
stack_bottom:
.skip	16384
stack_top:

.section	.text
.global		_start
.type		_start, @function
_start:
	mov	$stack_top, %esp
	call	kernel_main
	cli
1:	hlt
	jmp	1b

.size _start, . - _start
