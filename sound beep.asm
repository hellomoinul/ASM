include 'emu8086.inc'
.model
.stack 100h
.data
.code
main proc
    
    mov ah,1
    int 21h
    mov bl,al ;take one
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h       ;print new line
    
    
    mov ah,1
    int 21h
    mov bh,al ;take two 
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13      ;print new line
    int 21h 
    
    
    
    mov ah,2
    mov dl,bl
    int 21h   ;print one    
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h        ;print new line 
    
    
    mov ah,2
    mov dl,bh
    int 21h   ;print two
    
    
    
    
    
    mov ah,2
    mov dl,07       ;sound beep
    int 21h 
    
    
     
   main endp
end main