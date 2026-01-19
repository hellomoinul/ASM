include 'emu8086.inc'  ; includes EMU8086 macro/definitions

.model
.stack 100h            ; defines stack size (256 bytes)
.code

main proc              ; procedure start

    mov ah,1           ; AH = 1: function to take one character input
    int 21h            ; DOS interrupt call
    mov bl,al          ; Store first input character from AL to BL  
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
  
    

    mov ah,1           ; AH = 1 again to take second character input
    int 21h
    mov bh,al          ; Store second character in BH 
    
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    mov ah,2           ; AH = 2: function to display a character
    mov dl,bl          ; Move first character to DL for output
    int 21h                                                    
    
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h

    mov ah,2
    mov dl,bh          ; Move second character to DL
    int 21h

main endp
end main
