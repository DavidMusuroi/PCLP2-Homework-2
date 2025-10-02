%include "../include/io.mac"

extern printf
global base64

section .data
	alphabet db 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '/'
	fmt db "%d", 10, 0

section .text

base64:
	;; DO NOT MODIFY

    push ebp
    mov ebp, esp
	pusha

	mov esi, [ebp + 8] ; source array
	mov ebx, [ebp + 12] ; n
	mov edi, [ebp + 16] ; dest array
	mov edx, [ebp + 20] ; pointer to dest length

	;; DO NOT MODIFY

	; -- Your code starts here --
	xor edx, edx
	xor ecx, ecx

	check_elems:
		cmp ebx, 0
		jg get_bytes
		je end

	get_bytes:
		sub ebx, 3
		push ebx
		push ecx
		; Pun cei 8 biti in 3 registre
		movzx eax, byte [esi + edx]
		movzx ebx, byte [esi + edx + 1]
		movzx ecx, byte [esi + edx + 2]

		; Pun cei 24 de biti in eax
		shl eax, 16
		shl ebx, 8
		or eax, ebx
		or eax, ecx
		pop ecx

		; Pun primul numar in edi
		mov ebx, eax
		; Primii 6 biti
		shr ebx, 18
		and ebx, 0b111111
		mov bl, [alphabet + ebx]
		mov [edi + ecx], bl

		; Pun al doilea numar in edi
		mov ebx, eax
		; Urmatorii 6 biti
		shr ebx, 12
		and ebx, 0b111111
		mov bl, [alphabet + ebx]
		mov [edi + ecx + 1], bl
		

		; Pun al treilea numar in edi
		mov ebx, eax
		; Urmatorii 6 biti
		shr ebx, 6
		and ebx, 0b111111
		mov bl, [alphabet + ebx]
		mov [edi + ecx + 2], bl

		; Pun al patrulea numar in edi
		mov ebx, eax
		; Ultimii 6 biti
		and ebx, 0b111111
		mov bl, [alphabet + ebx]
		mov [edi + ecx + 3], bl

		; Actualizez numarul initial si final de elemente
		add edx, 3
		add ecx, 4
		pop ebx
		jmp check_elems

	end:
		mov eax, ecx
		mov ecx, [ebp + 20]
		mov [ecx], eax

	; -- Your code ends here --
	;; DO NOT MODIFY

	popa
	leave
	ret

	;; DO NOT MODIFY