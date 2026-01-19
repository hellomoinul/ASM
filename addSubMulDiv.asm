include 'emu8086.inc'
.model
.stack 100h
.data   

a db 10,13,'Enter first number: $'
b db 10,13,'Enter Second number: $'  

c db 10,13,'**Add two number** $' 
d db 10,13,'Result: $'

e db 10,13,'**Subtract two number** $'
f db 10,13,'**Multiply two number** $'
g db 10,13,'**Divide two number** $'

.code
main proc
    
    mov ax,@data
    mov ds,ax

    ;=================== ADDITION ===================
    mov ah,9
    lea dx,c
    int 21h       ;print add title
    
    mov ah,9
    lea dx,a
    int 21h       ;print 1st prompt
    
    mov ah,1 
    int 21h
    sub al,48
    mov bl,al     ;num1
    
    mov ah,9
    lea dx,b
    int 21h       ;print 2nd prompt
    
    mov ah,1 
    int 21h
    sub al,48
    mov bh,al     ;num2

    mov ah,9
    lea dx,d
    int 21h       ;print result msg

    mov al,bl
    add al,bh     ;al = bl + bh
    add al,48     ;back to ASCII

    mov ah,2
    mov dl,al
    int 21h       ;show sum result


    ;=================== SUBTRACTION ===================
    mov ah,9
    lea dx,e
    int 21h       ;print sub title

    mov ah,9
    lea dx,a
    int 21h       ;1st prompt

    mov ah,1
    int 21h
    sub al,48
    mov bl,al

    mov ah,9
    lea dx,b
    int 21h       ;2nd prompt

    mov ah,1
    int 21h
    sub al,48
    mov bh,al

    mov ah,9
    lea dx,d
    int 21h       ;print result

    mov al,bl
    sub al,bh
    add al,48

    mov ah,2
    mov dl,al
    int 21h       ;show sub result


    ;=================== MULTIPLICATION ===================
    mov ah,9
    lea dx,f
    int 21h       ;print mul title

    mov ah,9
    lea dx,a
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bl,al

    mov ah,9
    lea dx,b
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bh,al

    mov ah,9
    lea dx,d
    int 21h       ;print result

    mov al,bl
    mul bh        ;AL = AL * BH, result in AL
    add al,48

    mov ah,2
    mov dl,al
    int 21h       ;show mul result


    ;=================== DIVISION ===================
    mov ah,9
    lea dx,g
    int 21h       ;print div title

    mov ah,9
    lea dx,a
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bl,al

    mov ah,9
    lea dx,b
    int 21h

    mov ah,1
    int 21h
    sub al,48
    mov bh,al

    mov ah,9
    lea dx,d
    int 21h       ;print result

    mov al,bl
    mov ah,0
    div bh        ;AL = quotient

    add al,48

    mov ah,2
    mov dl,al
    int 21h       ;show div result

    main endp
end main
