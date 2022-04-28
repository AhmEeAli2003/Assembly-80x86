.model small

.data


msg db "Input your name: $" 
msgout db "Welcome, $"
temp dw ?
char db ?


.code

main proc
   mov ax,@data
   mov ds,ax 
   
   ;Set cursor position
   mov ah,2H
   mov bh,0H
   mov dh,10
   mov dl,20
   int 0x10 
   
   ;Clear screen
   mov ah,6H
   mov al,0H
   mov bh,30
   mov cx,0000
   mov dx,7924
   int 0x10
   
   mov ah,9
   lea dx, msg
   int 0x21 
   
   mov bx, offset char
   
   
   mov ah,1H
   
input:
  int 0x21
  mov [bx],al
  inc bx
  mov temp, bx
  cmp al,13     ;Enter Key
  je  next   
  jmp input 

next:
   mov ah,2H
   mov bh,0H
   mov dh,12
   mov dl,25
   int 0x10
   
   mov ah,9
   lea dx,msgout
   int 0x21 
   
   mov ah,0x02
   mov bx, offset char
      
print:  
  mov dl,[bx]
  int 0x21
  inc bx
  cmp bx,temp
  je exit
  jmp print
    
  
exit:
   mov ax,0x4c
   int 0x21
  
    
main endp
end  main 