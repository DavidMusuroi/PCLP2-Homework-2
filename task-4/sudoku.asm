%include "../include/io.mac"

extern printf
global check_row
global check_column
global check_box
; you can declare any helper variables in .data or .bss

section .data
    ; Ultimul index al randului
    end_row dd 0
    ; Ultimul index al coloanei
    end_col dd 0

section .text


; int check_row(char* sudoku, int row);
check_row:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int row 
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here
    ; Pun in eax index-ul de start al randului
    mov ebx, 9
    mov eax, edx
    mul ebx
    mov ebx, 0
    mov ecx, 0
    ; Pun in end_row ultimul index al randului
    add eax, 9
    mov [end_row], eax
    sub eax, 9
    push ebx

    ; Iterez prin cele 9 elemente de pe randul curent
    iter_row:
        pop ebx
        cmp ebx, 8
        jl first_it_1
        jge eax_is_1_1

    ; Primul loop
    first_it_1:
        add ebx, 1
        movzx edx, byte [esi + eax]
        add eax, 1
        movzx ecx, byte [esi + eax]
        ; Pun in ebx index-ul urmatorului element
        push ebx
        mov ebx, eax
        ; Verific daca cele 2 elemente sunt intre 1 si 9 sau daca sunt duplicate
        cmp ecx, 9
        jg eax_is_0_1
        cmp edx, 9
        jg eax_is_0_1
        cmp edx, ecx
        je eax_is_0_1
        jne second_it_1

    ; Al doilea loop
    second_it_1:
        ; Actualizez index-ul
        add ebx, 1
        ; Verific daca am ajuns la finalul randului
        cmp ebx, [end_row]
        je iter_row
        ; Verific daca elementul din al doilea loop este intre 1 si 9 sau daca
        ; este duplicat
        movzx ecx, byte [esi + ebx]
        cmp ecx, 9
        jg eax_is_0_1
        cmp edx, ecx
        je eax_is_0_1
        jne second_it_1

    eax_is_1_1:
        mov eax, 1
        ; Dupa ce l-am facut pe eax 1, vreau sa nu intru in label-ul care il
        ; face 2
        jmp end1

    eax_is_0_1:
        pop ebx
        mov eax, 2

    end1:
        nop

    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this row is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here
end_check_row:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY

; int check_column(char* sudoku, int column);
check_column:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int column 
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here
    ; Pun in eax index-ul de start al coloanei
    mov eax, edx
    ; Pun in end_col ultimul index al coloanei
    add eax, 72
    mov [end_col], eax
    sub eax, 72
    mov ebx, 0
    mov ecx, 0
    push ebx

    ; Iterez prin cele 9 elemente de pe coloana curenta
    iter_col:
        pop ebx
        cmp ebx, 8
        jl first_it_2
        jge eax_is_1_2

    ; Primul loop
    first_it_2:
        add ebx, 1
        movzx edx, byte [esi + eax]
        add eax, 9
        movzx ecx, byte [esi + eax]
        ; Pun in ebx index-ul urmatorului element
        push ebx
        mov ebx, eax
        ; Verific daca cele 2 elemente sunt intre 1 si 9 sau daca sunt duplicate
        cmp ecx, 9
        jg eax_is_0_2
        cmp edx, 9
        jg eax_is_0_2
        cmp edx, ecx
        je eax_is_0_2
        jne second_it_2

    ; Al doilea loop
    second_it_2:
        ; Actualizez index-ul
        add ebx, 9
        ; Verific daca am ajuns la finalul coloanei
        cmp ebx, [end_col]
        jg iter_col
        ; Verific daca elementul al doilea este intre 1 si 9 sau daca e duplicat
        movzx ecx, byte [esi + ebx]
        cmp ecx, 9
        jg eax_is_0_2
        cmp edx, ecx
        je eax_is_0_2
        jne second_it_2

    eax_is_1_2:
        mov eax, 1
        ; Dupa ce l-am facut pe eax 1, vreau sa nu intre in label-ul care il
        ; face 2
        jmp end2

    eax_is_0_2:
        pop ebx
        mov eax, 2

    end2:
        nop


    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this column is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here
end_check_column:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY


; int check_box(char* sudoku, int box);
check_box:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    push ebx
    push ecx
    push edx
    push esi
    push edi

    mov     esi, [ebp + 8]  ; char* sudoku, pointer to 81-long char array
    mov     edx, [ebp + 12]  ; int box 
    ;; DO NOT MODIFY
   
    ;; Freestyle starts here
    ; Pun in ecx cutia la care ma aflu
    mov ecx, edx
    mov eax, 1
    mul edx
    mov ebx, 3
    mul ebx
    cmp ecx, 3
    jl get_eax
    jge box_is_between_3_and_5

    ; Actualizez index-ul de start
    box_is_between_3_and_5:
        add eax, 18
        cmp ecx, 6
        jge box_is_greater_than_6
        jmp get_eax

    ; Actualizez index-ul de start
    box_is_greater_than_6:
        add eax, 18
        jmp get_eax

    get_eax:
        ; edx tine minte suma, cl elementul curent si ebx shifteaza la stanga
        ; cu cl pozitii pentru toate elementele din cutie
        mov edx, 0
        mov ebx, 1
        mov cl, [esi + eax]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx

        mov ebx, 1
        mov cl, [esi + eax + 1]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx
        mov ebx, 1

        mov cl, [esi + eax + 2]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx
        mov ebx, 1

        mov cl, [esi + eax + 9]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx
        mov ebx, 1
        
        mov cl, [esi + eax + 10]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx
        mov ebx, 1

        mov cl, [esi + eax + 11]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx
        mov ebx, 1

        mov cl, [esi + eax + 18]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx
        mov ebx, 1

        mov cl, [esi + eax + 19]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx
        mov ebx, 1

        mov cl, [esi + eax + 20]
        cmp cl, 9
        jg eax_is_0_3
        shl ebx, cl
        add edx, ebx
        mov ebx, 1

        cmp edx, 1022
        je eax_is_1_3
        jne eax_is_0_3

    eax_is_1_3:
        mov eax, 1
        ; Dupa ce l-am facut pe eax 1, vreau sa nu intru in label-ul care il
        ; face 2
        jmp end3

    eax_is_0_3:
        mov eax, 2

    end3:
        nop


    ;; MAKE SURE TO LEAVE YOUR RESULT IN EAX BY THE END OF THE FUNCTION
    ;; Remember: OK = 1, NOT_OKAY = 2
    ;; ex. if this box is okay, by this point eax should contain the value 1 

    ;; Freestyle ends here
end_check_box:
    ;; DO NOT MODIFY

    pop edi
    pop esi
    pop edx
    pop ecx
    pop ebx
    leave
    ret
    
    ;; DO NOT MODIFY
