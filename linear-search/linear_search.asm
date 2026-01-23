; linear_search.asm
; Program: Linear Search in x86-64 Assembly
; Author: cyber-rohanjha
; Purpose: Search for a target value in an array and print result

section .data
	array dq 3, 4, 5, 6, 11, 15, 16, 20, 23		; sample array (64-bit integers)
	arr_len equ 9								; number of elemnts
	target dq 15								; value to search

	found_msg db "Value found!", 10
	found_msg_len equ $ - found_msg

	not_found_msg db "Value not found", 10
	not_found_msg_len equ $ - not_found_msg

section .text
	global _start

_start:
	mov rcx, 0				; rcx = loop counter
	mov rbx, [target]		; rbx = target value

search_loop:
	cmp rcx, arr_len		; if index == arr_len, end of array
	jge not_found			; jump if greater than array length to not found section

	mov rax, [array + rcx*8] ; load array[rcx] (each element is 8 bytes)
	
	cmp rax, rbx			; compare with target value
	je found				; if equal jump to found section

	inc rcx					; increment the counter rcx = rcx + 1
	jmp search_loop			; unconditional jump to the start of the loop

found:
	mov rax, 1				; syswrite
	mov rdi, 1				; stdout
	mov rsi, found_msg		; pointer to the found message
	mov rdx, found_msg_len	; length of the found message
	syscall
	jmp exit

not_found:
	mov rax, 1				; syswrite
	mov rdi, 1				; stdout
	mov rsi, not_found_msg	; pointer to the not found message
	mov rdx, not_found_msg_len	; length of the not found message
	syscall
	jmp exit

exit:
	mov rax, 60				; sys_exit
	xor rdi, rdi			; exit code 0
	syscall
