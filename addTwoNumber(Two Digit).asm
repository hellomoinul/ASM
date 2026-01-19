include 'emu8086.inc'
.model small
.stack 100h

.data
n db ?         ; first number
m db ?         ; second number

.code

; ===== Procedure to print newline =====
endl proc
    mov dl, 10        ; line feed
    mov ah, 02h
    int 21h
    mov dl, 13        ; carriage return
    int 21h
    ret
endl endp

main proc
    mov ax, @data
    mov ds, ax

    ; ===== Read First Number (two digits) =====
    print 'Enter first 2-digit number: '

    ; First digit
    mov ah, 01h
    int 21h
    sub al, '0'       ; convert ASCII to number
    mov bl, al        ; store tens digit
    mov bh, 10
    mul bh            ; al = al * 10
    mov cl, al        ; store (tens * 10) in cl

    ; Second digit
    mov ah, 01h
    int 21h
    sub al, '0'
    add al, cl        ; al = tens*10 + ones
    mov n, al
    call endl

    ; ===== Read Second Number (two digits) =====
    print 'Enter second 2-digit number: '

    ; First digit
    mov ah, 01h
    int 21h
    sub al, '0'
    mov bl, al
    mov bh, 10
    mul bh
    mov cl, al

    ; Second digit
    mov ah, 01h
    int 21h
    sub al, '0'
    add al, cl
    mov m, al
    call endl

    ; ===== Add Two Numbers =====
    mov al, n
    add al, m         ; al = n + m

    ; ===== Print Result =====
    print 'Result: '

    aam               ; AH = tens, AL = ones
    mov bh, ah        ; tens
    mov bl, al        ; ones

    add bh, '0'       ; convert tens to ASCII
    mov dl, bh
    mov ah, 02h
    int 21h           ; print tens digit

    add bl, '0'       ; convert ones to ASCII
    mov dl, bl
    mov ah, 02h
    int 21h           ; print ones digit

    call endl

    ; ===== Exit =====
    mov ah, 4Ch
    int 21h
main endp
end main
