include 'emu8086.inc'

.model small
.stack 100h

.data
                    ; ----- Messages split properly -----
msg_title db 10,13,'Select conversion:',10,13,'$'
msg_opt1  db '1. Celsius to Fahrenheit',10,13,'$'
msg_opt2  db '2. Fahrenheit to Celsius',10,13,'$'

msg_choice db 10,13,'Enter your choice (1 or 2): $' 
msg_temp   db 10,13,'Enter temperature (two digits): $'
msg_result db 10,13,'Result = $'

temp   db ?
choice db ?
result db ?

.code
main proc
    mov ax,@data
    mov ds,ax

                     ; ----- Show menu (split prints) -----
    mov ah,9
    lea dx,msg_title
    int 21h

    mov ah,9
    lea dx,msg_opt1
    int 21h

    mov ah,9
    lea dx,msg_opt2
    int 21h

                     ; ----- Ask for choice -----
    mov ah,9
    lea dx,msg_choice
    int 21h

    mov ah,1
    int 21h
    sub al,'0'
    mov choice,al

                     ; ----- Ask for temperature (two digits) -----
    mov ah,9
    lea dx,msg_temp
    int 21h

                     ; read tens digit
    mov ah,1
    int 21h
    sub al,'0'
    mov bl,al

                     ; read ones digit
    mov ah,1
    int 21h
    sub al,'0'
    mov bh,al

                     ; combine two digits (tens * 10 + ones)
    mov ah,0
    mov al,bl
    mov cl,10
    mul cl           ; AX = tens*10
    add al,bh        ; add ones digit to AL
    mov temp,al      ; store temperature

                     ; ----- Check choice -----
    mov al,choice
    cmp al,1
    je c_to_f
    cmp al,2
    je f_to_c
    ;jmp exit

                     ; -------- Celsius to Fahrenheit ----------
c_to_f:
    mov ah,0
    mov al,temp
    mov bl,9
    mul bl           ; AX = 9*C
    mov bl,5
    div bl           ; AL = (9*C)/5
    add al,32        ; +32
    mov result,al
    jmp show_result

                     ; -------- Fahrenheit to Celsius ----------
f_to_c:
    mov ah,0
    mov al,temp
    sub al,32        ; (F-32)
    mov bl,5
    mul bl           ; AX=5*(F-32)
    mov bl,9
    div bl           ; AL=(5*(F-32))/9
    mov result,al
    jmp show_result

                     ; -------- Show Result ----------
show_result:
    mov ah,9
    lea dx,msg_result
    int 21h

    mov al,result
    mov bl,10
    mov ah,0
    div bl           ; AL=tens, AH=ones

    add al,'0'
    mov dl,al
    mov ah,2
    int 21h

    add ah,'0'
    mov dl,ah
    mov ah,2
    int 21h

;exit:
    ;mov ah,4Ch
    ;int 21h

main endp
end main
