include 'emu8086.inc'
.model small
.stack 100h
.data   

a db 10,13,'Enter first number: $'
b db 10,13,'Enter second number: $'  
c db 10,13,'** Add two numbers ** $' 
d db 10,13,'Result: $'

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    ; print heading
    mov ah,9
    lea dx,c
    int 21h       
    
    ; ask first number
    mov ah,9
    lea dx,a
    int 21h       
    mov ah,1 
    int 21h
    mov bl,al     ; take first digit
    
    ; ask second number
    mov ah,9
    lea dx,b
    int 21h       
    mov ah,1 
    int 21h
    mov bh,al     ; take second digit
    
    ; print result text
    mov ah,9
    lea dx,d
    int 21h       
    
    ; convert ASCII to number
    sub bl,48
    sub bh,48
    
    ; add
    add bl,bh
    
    ; convert back to ASCII
    add bl,48
    
    ; print result
    mov ah,2
    mov dl,bl
    int 21h       
    
    ; exit program
    mov ah,4Ch
    int 21h

main endp
end main
