include 'emu8086.inc'
.model
.stack 100h
.data

ARRAY_SIZE equ 5

msg_prompt db 10,13,'Enter 5 numbers (0-9): $'
msg_output db 10,13,'The numbers you entered are: $'
space      db ' $'

my_array db ARRAY_SIZE dup(?)

.code
main proc

    mov ax, @data
    mov ds, ax

    ; Display prompt to enter numbers
    mov ah, 9
    lea dx, msg_prompt
    int 21h

    mov si, 0          ; Initialize array index
    mov cx, ARRAY_SIZE ; Loop counter for input

input_loop:
    mov ah, 1          ; Read character
    int 21h
    sub al, 48         ; Convert ASCII to decimal
    mov my_array[si], al
    inc si
    loop input_loop

    ; Display output message
    mov ah, 9
    lea dx, msg_output
    int 21h

    mov si, 0          ; Reset index for output
    mov cx, ARRAY_SIZE ; Loop counter for output

output_loop:
    mov dl, my_array[si]
    add dl, 48         ; Convert decimal to ASCII
    mov ah, 2
    int 21h            ; Print character

    mov ah, 9
    lea dx, space
    int 21h            ; Print space

    inc si
    loop output_loop

    ; Exit program
    mov ah, 4Ch
    int 21h

main endp
end main
