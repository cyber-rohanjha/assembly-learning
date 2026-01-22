section .data
	array dq 3, 4, 5, 6, 11, 15, 16, 20, 23
	arr_len equ 9
	target dq 15

	found_msg db "Value found!", 10
	found_msg_len equ $ - found_msg

	not_found_msg db "Value not found", 10
	not_found_msg_len equ $ - not_found_msg

section .bss
	index resq 1

section .text
	global _start

_start:
	mov rcx, 0
	mov rbx, [target]

search_loop:
	cmp rcx, arr_len
	jge not_found

	mov rax, [array + rcx*8]
	
	cmp rax, rbx
	je found

	inc rcx
	jmp search_loop

found:
	mov rax, 1
	mov rdi, 1
	mov rsi, found_msg
	mov rdx, found_msg_len
	syscall
	jmp exit

not_found:
	mov rax, 1
	mov rdi, 1
	mov rsi, not_found_msg
	mov rdx, not_found_msg_len
	syscall
	jmp exit

exit:
	mov rax, 60
	xor rdi, rdi
	syscall
