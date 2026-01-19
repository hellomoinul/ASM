include 'emu8086.inc'
.model
.stack 100h
.data
a db "Hello world! $"

.code

main proc            
    mov ax, @data
    mov ds,ax
    
    
    mov ah,9
    lea dx,a   ;load effective address
    int 21h    ; string print done 
    
    main endp
end main