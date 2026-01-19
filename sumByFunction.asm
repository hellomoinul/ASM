include 'emu8086.inc'
.model small
.stack 100h
.data

msg1 db 10,13,'Enter first number: $'
msg2 db 10,13,'Enter second number: $'
msg3 db 10,13,'The sum is: $'

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
    sub al, 48            ; ASCII to decimal
    mov ah, 0             ; clear AH before push
    push ax               ; push first number

    ; Prompt for second number
    mov ah, 9
    lea dx, msg2
    int 21h

    mov ah, 1
    int 21h
    sub al, 48            ; ASCII to decimal
    mov ah, 0             ; clear AH
    push ax               ; push second number

    ; Call addition procedure
    call add_numbers

    ; Save result (AX) because next calls may overwrite AX
    mov cx, ax

    ; Clean up stack (2 arguments x 2 bytes)
    add sp, 4

    ; Display result message
    mov ah, 9
    lea dx, msg3
    int 21h

    ; Display sum (assuming single digit)
    mov ax, cx
    add al, 48            ; decimal to ASCII
    mov dl, al
    mov ah, 2
    int 21h

    ; Exit program
    mov ah, 4ch
    int 21h

main endp

;--------------------------
; Procedure to add two numbers passed on stack
add_numbers proc
    push bp
    mov bp, sp

    mov ax, [bp+6]        ; first argument
    add ax, [bp+4]        ; add second argument

    pop bp
    ret
add_numbers endp

end main
