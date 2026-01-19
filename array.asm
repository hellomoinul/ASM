include 'emu8086.inc'
.model small
.stack 100h
.data
array db 3,4,5,6,7,8

.code
main proc

    mov ax, @data
    mov ds, ax

    mov si, offset array ; access the first value of the given array

    mov cx, 6

start:
    mov dl, [si]         ; print the value
    add dl, 48
    mov ah, 02h
    int 21h

    mov dl, 32           ; space
    mov ah, 02h
    int 21h

    inc si
    loop start

    mov dl, 13           ; carriage return
    mov ah, 02h
    int 21h

    mov dl, 10           ; line feed
    mov ah, 02h
    int 21h

main endp
end main
