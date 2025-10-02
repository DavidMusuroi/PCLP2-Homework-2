%include "../include/io.mac"

extern printf
global remove_numbers

section .data
	fmt db "%d", 10, 0

section .text

; function signature: 
; void remove_numbers(int *a, int n, int *target, int *ptr_len);

remove_numbers:
	;; DO NOT MODIFY
	push    ebp
	mov     ebp, esp
	pusha

	mov     esi, [ebp + 8] ; source array
	mov     ebx, [ebp + 12] ; n
	mov     edi, [ebp + 16] ; dest array
	mov     edx, [ebp + 20] ; pointer to dest length

	;; DO NOT MODIFY
   

	;; Your code starts here
	; [edx] va contine numarul final de elemente
	mov eax, -1
	mov [edx], eax

	; ecx itereaza prin elementele vectorului initial
	mov ecx, 0
	mov eax, 1
	cmp ebx, 0
	jge check_pow2

	add_dest_array:
		; Actualizez numarul de elemente
		push ebx
		mov ebx, [edx]
		add ebx, 1
		mov [edx], ebx
		; Actualizez array-ul final
		mov eax, [esi + ecx]
		mov [edi + 4 * ebx], eax
		pop ebx
		jmp get_next_elem

	get_next_elem:
		; Actualizez offset-ul vectorului initial si numarul de elemente n
		add ecx, 4
		mov eax, 1
		sub ebx, 1
		cmp ebx, 1
		jge check_pow2
		jl end

	check_pow2:
		; Inmultesc eax cu 2 pana ajung la relatia 2^eax >= elementul curent
		add eax, eax
		cmp eax, [esi + ecx]
		je get_next_elem
		jl check_pow2
		jg check_impar

	check_impar:
		mov eax, [esi + ecx]
		and eax, 1
		cmp eax, 0
		je add_dest_array
		jg get_next_elem

	end:
		; Actualizez numaratoarea pentru ca incepuse de la 0
		mov eax, [edx]
		add eax, 1
		mov [edx], eax
	;; Your code ends here
	

	;; DO NOT MODIFY

	popa
	leave
	ret
	
	;; DO NOT MODIFY
