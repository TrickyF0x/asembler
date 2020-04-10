section .text

global _start

_start:

array:
	push rbp
	mov rbp, rsp
	mov DWORD [rbp-48], 10
    mov DWORD [rbp-44], 33
	mov DWORD [rbp-40], 55
	mov DWORD [rbp-36], 24
	mov DWORD [rbp-32], 102
	mov DWORD [rbp-28], 56
	mov DWORD [rbp-24], 39
	mov DWORD [rbp-20], 69
	mov DWORD [rbp-16], 4
	mov DWORD [rbp-12], 31
	mov DWORD [rbp-8], 0
	mov DWORD [rbp-4], 0

main:
	cmp DWORD [rbp-4], 0 ;FIRST ITERATION
	je noteven

	cmp DWORD [rbp-4], 9 ;KONEC MASSIVA?
	jg exit ;JUMP IF X>Y
	jmp sum

sum:
	mov eax, DWORD [rbp-4] ;COUNTER TO EAX
	and   eax, 01h	;делаем and eax с 1
    jz    noteven	;NE4ETNOE
    jmp even

even: ;CHETNOE
	mov eax, DWORD [rbp-4] ;COUNTER TO EAX
	cdqe ;EAX TO RAX
	mov eax, DWORD [rbp-48+rax*4] ;ARRAY ELEMENT TO EAX
	test eax, 16h
		jnz subd
	add DWORD [rbp-8], eax ;SUMMIRUEM
	mov ebx, DWORD [rbp-8] ;SUMMA TO EBX

	add DWORD [rbp-4], 1 ;COUNTER
	 jmp main

subd:
	sub eax, 16h
	add DWORD [rbp-8], eax ;SUMMIRUEM
	mov ebx, DWORD [rbp-8] ;SUMMA TO EBX

	add DWORD [rbp-4], 1 ;COUNTER
	 jmp main

noteven: ;NECHETNOE
	mov eax, DWORD [rbp-4] ;COUNTER TO EAX
	cdqe ;EAX TO RAX
	mov eax, DWORD [rbp-48+rax*4] ;ARRAY ELEMENT TO EAX
	or eax, 08h
	add DWORD [rbp-8], eax ;SUMMIRUEM
	mov ebx, DWORD [rbp-8] ;SUMMA TO EBX

	add DWORD [rbp-4], 1 ;COUNTER
	 jmp main


exit:
	mov eax, 0
	pop rbp
	mov eax, 1
	int 0x80