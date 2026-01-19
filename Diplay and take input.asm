include 'emu8086.inc'
.model
.stack 100h
.data 
    
msg1 db ?    ; will store user input

.code
main proc 
    mov ax, @data
    mov ds, ax

    ; Get user input
    mov ah, 1
    int 21h
    mov msg1, al

    ; Print newline again (CR + LF)
    mov ah, 2
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; Display the user input
    mov ah, 2
    mov dl, msg1
    int 21h

main endp
end main 
