include 'emu8086.inc'
.model
.stack 100h
.data   

msg1 db 10,13,'Enter first number: $'
msg2 db 10,13,'Enter second number: $'
equal_msg db 10,13,'Numbers are equal.$'
first_msg db 10,13,'First number is greater.$'
second_msg db 10,13,'Second number is greater.$'

.code
main proc

    mov ax, @data
    mov ds, ax

    ; Prompt for first number
    mov ah, 9
    lea dx, msg1
    int 21h

    mov ah, 1
    int 21h
    sub al, 48       ; Convert ASCII to decimal
    mov bh, al       ; Store first number in BH

    ; Prompt for second number
    mov ah, 9
    lea dx, msg2
    int 21h

    mov ah, 1
    int 21h
    sub al, 48       ; Convert ASCII to decimal
    mov bl, al       ; Store second number in BL

    ; Compare BH and BL
    cmp bh, bl
    jg FIRST_IS_GREATER     ; If BH > BL
    jl SECOND_IS_GREATER    ; If BH < BL

    ; If equal
    mov ah, 9
    lea dx, equal_msg
    int 21h
    jmp END_PROGRAM         ; Skip other cases

FIRST_IS_GREATER:
    mov ah, 9
    lea dx, first_msg
    int 21h
    jmp END_PROGRAM

SECOND_IS_GREATER:
    mov ah, 9
    lea dx, second_msg
    int 21h

END_PROGRAM:
    ; Program ends here
    main endp
end main
