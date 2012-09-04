;	2-Chat.asm
;	Written by "Sam Blumire"
;	Build Instructions:
;		Requirements:
;			Netwide Assembler (nasm) for linux. [sudo apt-get install nasm]
;		64 bit:
;			nasm -f elf "2-Chat.asm"
;			ld -m elf_i386 -s -o chat "2-Chat.o"
;		32 bit:
;			nasm -f elf "2-Chat.asm"
;			ld -s -o chat "2-Chat.o"
;	Run Instructions;
;		Terminal Application
;		No Root Access Needed
;		Binary Compiled to "chat" (./chat from location of binary file)

SECTION .data							;Constants
	name:		db "Hello, What is your name? "		;name = Hello, What is your name? 
	name_L:		equ $-name				;name_L = Length of constant "name"
	hello:		db "Hello "				;hello = Hello 
	hello_L:	equ $-hello				;hello_L = Length of constant "hello"
	
SECTION .bss							;Variables
	name_V:	resb 255					;Name = 255 bytes of reserved space
	
SECTION .text							;Code
	global _start						;Link to Script
	
_start:								;Start of Script
	mov eax, 4						;Kernel Function = sys_write
	mov ebx, 1							;Standard output file descriptor
	mov ecx, name							;Message to Print
	mov edx, name_L							;Number of characters to print
	int 80h								;Call the Kernel
	mov eax, 3						;Kernel Function = sys_read
	mov ebx, 0							;Standard input file descriptor
	mov ecx, name_V							;Location to store input
	mov edx, 255							;Number of characters to store
	int 80h								;Call the Kernel
	mov eax, 4						;Kernel Function = sys_write
	mov ebx, 1							;Standard output file descriptor
	mov ecx, hello							;Message to Print
	mov edx, hello_L						;Number of characters to print
	int 80h								;Call the Kernel
	mov eax, 4						;Kernel Function = sys_write
	mov ebx, 1							;Standard output file descriptor
	mov ecx, name_V							;Message to Print
	mov edx, 255							;Number of characters to print
	int 80h								;Call the Kernel
	mov eax, 1						;Kernel Function = sys=exit
	mov ebx, 0							;Error code (0 = no error)
	int 80h								;Call the Kernel