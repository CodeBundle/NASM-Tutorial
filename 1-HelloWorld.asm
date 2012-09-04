;	1-HelloWorld.asm
;	Written by "Sam Blumire"
;	Build Instructions:
;		Requirements:
;			Netwide Assembler (nasm) for linux. [sudo apt-get install nasm]
;		64 bit:
;			nasm -f elf "1-HelloWorld.asm"
;			ld -m elf_i386 -s -o helloworld "1-HelloWorld.o"
;		32 bit:
;			nasm -f elf "1-HelloWorld.asm"
;			ld -s -o hw "1-HelloWorld.o"
;	Run Instructions;
;		Terminal Application
;		No Root Access Needed
;		Binary Compiled to "helloworld" (./helloworld from location of binary file)


SECTION .data					;Constants
	msg: 	db "Hello World!", 10		;msg = Hello World(new Line)
	len: 	equ $-msg			;msglen = Length of variable "msg"
	

SECTION .text					;Code
global _start					;Link to Script

_start:						;Start of Script
	mov eax, 4				;Kernel Function = sys_write
	mov ebx, 1					;Standard output file descriptor
	mov ecx, msg					;Message to Print
	mov edx, len				;Number of Characters to print
	int 80h						;Call the Kernel
	mov eax, 1				;Kernel Function = sys_exit
	mov ebx, 0					;Error code (0 = no error)
	int 80h					;Call the Kernel
