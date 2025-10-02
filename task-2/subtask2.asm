%include "../include/io.mac"

; declare your structs here

struc date
    day: resb 1
    month: resb 1
    year: resw 1
endstruc

struc event
    name: resb 31
    valid: resb 1
    new_date: istruc date
                at day, resb 1
                at month, resb 1
                at year, resw 1
            iend
endstruc

section .text
    global sort_events
    extern printf

sort_events:
    ;; DO NOT MODIFY
    enter 0, 0
    pusha

    mov ebx, [ebp + 8]      ; events
    mov ecx, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    mov esi, -1
    ; esi itereaza prin primul loop
    first_loop_struct:
        add esi, 1
        mov edi, esi
        cmp esi, ecx
        jge end

    second_loop_struct:
        ; edi itereaza prin al doilea loop
        add edi, 1
        cmp edi, ecx
        jge first_loop_struct

        ; ecx este o variabila intermediara
        push ecx
        mov eax, esi
        mov ecx, new_date + year + 2
        mul ecx
        add eax, ebx
        push esi
        mov esi, eax
        xor edx, edx
        ; esi este inceputul primului element

        ; edi este inceputul celui de-al doilea element
        mov eax, edi
        mov ecx, new_date + year + 2
        mul ecx
        add eax, ebx
        mov edx, esi
        pop esi


        ; In edx este i si in eax este j
        movzx ecx, byte [edx + valid]
        cmp ecx, 0
        je check_if_invalid_and_valid
        movzx ecx, byte [eax + valid]
        cmp ecx, 1
        ; 1 si 1
        je check_if_both_equal
        ; 1 si 0
        jne go_next_and_pop_ecx

    ; Daca valid este 0 in primul element
    check_if_invalid_and_valid:
        cmp byte [eax + valid], 0
        ; 0 si 0
        je check_if_both_equal
        ; 0 si 1
        jne interschimbare

    ; Trec la urmatorul element din al doilea for
    go_next_and_pop_ecx:
        pop ecx
        jmp second_loop_struct

    ; Fac swap la doua elemente din vectorul initial
    interschimbare:
        push esi
        push edi

        sub esp, new_date + year + 2
        mov esi, eax
        mov edi, esp
        mov ecx, new_date + year + 2
        rep movsb

        mov esi, edx
        mov edi, eax
        mov ecx, new_date + year + 2
        rep movsb

        mov esi, esp
        mov edi, edx
        mov ecx, new_date + year + 2
        rep movsb

        add esp, new_date + year + 2
        pop edi
        pop esi
        jmp go_next_and_pop_ecx

    ; 
    check_if_both_equal:

        ; Anul
        push edi
        push esi
        movzx edi, word [edx + new_date + year]
        movzx esi, word [eax + new_date + year]
        cmp esi, edi
        jg go_next_and_pop_2
        jl before_swap

        ; Luna
        movzx edi, byte [edx + new_date + month]
        movzx esi, byte [eax + new_date + month]
        cmp esi, edi
        jg go_next_and_pop_2
        jl before_swap

        ; Ziua
        movzx edi, byte [edx + new_date + day]
        movzx esi, byte [eax + new_date + day]
        cmp esi, edi
        jg go_next_and_pop_2
        jl before_swap

        mov ecx, -1
        jmp str_cmp

    str_cmp:
        pop esi
        pop edi
        add ecx, 1
        
        ; Verific daca am ajuns la finalul numelui
        cmp ecx, 30
        jg go_next_and_pop_ecx
        jle check_chars

    ; Verifica cele 2 caractere curente din numele celor 2 elemente
    check_chars:
        push edi
        push esi
        movzx esi, byte [edx + ecx]
        movzx edi, byte [eax + ecx]
        cmp esi, edi
        je str_cmp
        jl go_next_and_pop_2

        pop esi
        pop edi
        jmp interschimbare

    go_next_and_pop_2:
        pop esi
        pop edi
        jmp go_next_and_pop_ecx

    before_swap:
        pop esi
        pop edi
        jmp interschimbare

    end:
        nop
    ;; Your code ends here

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY