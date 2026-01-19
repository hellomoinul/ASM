include 'emu8086.inc'
.model small
.stack 100h
.data

msg1       db 'enter a string: $'
msg2       db 10,13, 'length of string is: $'
count_msg  db 3 dup('$')

buffer     db 99           ; max chars allowed (excluding enter)
            db ?           ; actual number of chars read (set by DOS)
            db 100 dup(?)  ; buffer to store input string

.code
main proc

    mov ax, @data
    mov ds, ax

    ; prompt user for input
    lea dx, msg1
    mov ah, 9
    int 21h

    ; read string using buffered input
    lea dx, buffer
    mov ah, 0ah
    int 21h

    ; manually add '$' terminator at end of input
    mov si, offset buffer
    mov cl, [si+1]          ; actual length
    mov bx, si
    add bx, 2               ; start of string
    add bx, cx              ; move to end
    mov byte ptr [bx], '$'  ; terminate with '$'

    ; get length and convert to ascii string (2 digits)
    mov al, buffer+1
    mov bl, 10
    xor ah, ah
    div bl                  ; al = tens, ah = units

    add al, '0'
    mov count_msg, al
    add ah, '0'
    mov count_msg+1, ah
    mov count_msg+2, '$'

    ; print message
    lea dx, msg2
    mov ah, 9
    int 21h

    ; print string length
    lea dx, count_msg
    mov ah, 9
    int 21h

    ; exit
    mov ah, 4ch
    int 21h

main endp
end main
