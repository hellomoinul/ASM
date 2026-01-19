include 'emu8086.inc'
.model
.stack 100h
.data
a db ?
b db ?
c db ?

.code

endl proc
    mov dl,10
    mov ah,02h
    int 21h
    mov dl, 13
    int 21h
    ret
endl endp

main proc
    mov ax,@data
    mov ds,ax
    
    ; Input a
    print 'Enter first number: '
    mov ah,01h
    int 21h
    mov a,al
    call endl
    
    ; Input b
    print 'Enter second number: '
    mov ah,01h
    int 21h
    mov b,al
    call endl
    
    ; Input c
    print 'Enter third number: '
    mov ah,01h
    int 21h
    mov c,al
    call endl
    
    ; Convert ASCII to number
    sub a,48
    sub b,48
    sub c,48
    
    ; Compare a & b
    mov al,a
    cmp al,b
    jge skip1
    mov al,b
skip1:
    ; Compare with c
    cmp al,c
    jge skip2
    mov al,c
skip2:
    ; Convert to ASCII
    add al,48
    
    print 'Greatest number is: '
    mov dl,al
    mov ah,02h
    int 21h
    
    mov ah,4ch
    int 21h
main endp
end main
