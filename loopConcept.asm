include 'emu8086.inc'
.model
.stack 100h
.data
a db "Loop concept $"

.code

main proc            
    mov ax, @data
    mov ds,ax
    
    
    mov ah,9
    lea dx,a   ;load effective address
    int 21h    ; string print done                     
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h                       ;new line
    
    
    mov cx,26
    mov ah,2
    mov dl,'A' 
    
    
    
    level1:
    int 21h
    inc dl
    loop level1
    
      
    
    main endp
end main