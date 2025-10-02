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

section .data
numar_zile db 0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31

section .text
    global check_events
    extern printf

check_events:
    ;; DO NOT MODIFY
    enter 0,0
    pusha

    mov ebx, [ebp + 8]      ; events
    mov ecx, [ebp + 12]     ; length
    ;; DO NOT MODIFY

    ;; Your code starts here
    mov esi, 0
    ; Cat timp mai am elemente in input
    loop_through_struct:
        cmp esi, ecx
        jge end

        mov eax, esi
        mov edx, new_date + year + 2
        mul edx
        add eax, ebx

        ; Ziua
        movzx edi, byte [eax + new_date + day]
        cmp edi, 1
        jl valid_is_zero

        ; Luna
        movzx edx, byte [eax + new_date + month]
        cmp edx, 1
        jl valid_is_zero
        cmp edx, 12
        jg valid_is_zero

        ; Ziua din luna
        movzx edx, byte [eax + new_date + month]
        movzx edx, byte [edx + numar_zile]
        cmp edi, edx
        jg valid_is_zero

        ; Anul
        movzx edx, word [eax + new_date + year]
        cmp edx, 1990
        jl valid_is_zero
        cmp edx, 2030
        jg valid_is_zero

        ; Evenimentul este valid
        mov byte [eax + valid], 1
        jmp go_next

    valid_is_zero:
        mov byte [eax + valid], 0

    go_next:
        add esi, 1
        jmp loop_through_struct

    end:
        nop
    ;; Your code ends here

    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY