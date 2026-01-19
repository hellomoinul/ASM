include 'emu8086.inc'
.model
.stack 100h
.data   


a db 10,13, 'Enter first number: $'
b db 10,13, 'Enter Second number: $'  
c db '**Substauct two number** $' 
d db 10,13, 'Result: $'

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    
    mov ah,9
    lea dx,c
    int 21h       ;print msg
    
    
    
    
    
    mov ah,9
    lea dx,a
    int 21h       ;print 1st msg
    
    mov ah,1 
    int 21h
    mov bl,al     ;take 1
    
   
    
    mov ah,9
    lea dx,b
    int 21h       ;print 2nd msg
    
     
    mov ah,1 
    int 21h
    mov bh,al     ;take 2
    
   
    
    mov ah,9
    lea dx,d
    int 21h       ;result line
    
    sub bl,bh
    add bl,48     ;process and add 48 with ascii
    
    mov ah,2
    mov dl,bl
    int 21h       ;output
    
    
    main endp
end main