include 'emu8086.inc'
.model 
.stack 100h

.data
a db '**Division Calculator** $'
b db 10,13,'Enter first number: $'
c db 10,13,'Enter second number: $'
d db 10,13,'Result is: $'
num1 db ?  
num2 db ? 
;temp db ?


.code

main proc
    
    
      mov ax, @data
      mov ds, ax
      
      
      
      
      
      mov ah,9
      lea dx,a
      int 21h
      
      
      
      
      mov ah,9
      lea dx,b
      int 21h
      
      mov ah,1
      int 21h
      sub al,48
      mov num1,al
      
      
      
      
      
      mov ah,9
      lea dx,c
      int 21h
    
    
      mov ah,1
      int 21h
      sub al,48
      mov num2,al   
      
      
      
      
      
      mov ah,9
      lea dx,d
      int 21h
      
    
      mov al,num1
      mov ah,0
      div  num2   
      
      
      
      mov dl,al
      add dl,48
      mov ah,2
      int 21h
      
    
    
    
    
   

main endp
end main
