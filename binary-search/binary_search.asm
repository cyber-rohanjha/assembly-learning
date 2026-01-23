; binary_search.asm
; Program: Binary search in x86-64 Assembly
; Author: cyber-rohanjha
; Purpose: Demonstartes binary search on a sorted array

section .data
	array dq 1, 3, 5, 7, 9, 11, 13, 15
	arr_len equ 8
	target dq 7

	found_msg db "Value found"
	found_msg_len equ $ - found_msg

	not_found_msg db "Value not found"
	not_found_msg_len equ $ - not_found_msg

section .text
	global _start

_start:
	mov rsi, 0		;low
	mov rdi, arr_len - 1	;high

search_loop:
	cmp rsi, rdi
	jg not_found		; if low > high, exit loop

	; calculate mid = low + (high - low) / 2
	mov rcx, rdi		; copy high to rcx
	sub rcx, rsi		; high - low
	shr rcx, 1		; divide by 2
	add rcx, rsi		; Add to low

	; compare array[mid] with target
	mov rbx, [array + rcx*8]
	mov rdx, [target]

	cmp rbx, rdx
	je found		; if equal, jump to found
	jl adjust_low		; if less, search right half

	; else search left half
	dec rcx
	mov rdi, rcx
	jmp search_loop	

adjust_low:
	inc rcx
	mov rsi, rcx
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

