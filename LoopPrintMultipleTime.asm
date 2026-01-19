include 'emu8086.inc'
.model
.stack 100h
.data

msg_char  db 10,13,'Enter a character: $'
msg_count db 10,13,'Enter loop count (0-9): $'
msg_out   db 10,13,'Output: $'

.code
main proc

    mov ax, @data
    mov ds, ax

    ; Prompt for character
    mov ah, 9
    lea dx, msg_char
    int 21h

    ; Read character
    mov ah, 1
    int 21h
    mov bh, al    ; Store character in BH

    ; Prompt for count
    mov ah, 9
    lea dx, msg_count
    int 21h

    ; Read count and convert from ASCII
    mov ah, 1
    int 21h
    sub al, 48
    mov cl, al    ; Move count to CL
    mov ch, 0     ; Clear CH to make full CX

    ; Show output label
    mov ah, 9
    lea dx, msg_out
    int 21h

PRINT_LOOP:
    mov dl, bh    ; Move character to DL
    mov ah, 2
    int 21h       ; Print character

    loop PRINT_LOOP   ; Decrement CX and loop if not zero

    ; End
    main endp
end main
