section .text
global _start

_start:
	xor rax, rax
	xor rdi, rdi
	mov al, 60
	mov dil, 2
	syscall
