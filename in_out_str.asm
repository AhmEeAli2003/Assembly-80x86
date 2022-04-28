.model small

.data

msgin db "Input your name: $" 
char db 15,?,15 dup('$')
msgout db "Welcome, $"

.code

main proc
   mov ax,@data
   mov ds,ax 
   
   ;Set cursor position
   
   mov dh,10
   mov dl,20
   call setCursorPos
   
   ;Clear screen
   mov ah,6H
   mov al,0H
   mov bh,30
   mov cx,0000
   mov dx,7924
   int 0x10
   
   mov ah,9
   mov dx, offset msgin
   int 0x21 
   
   mov ah,0aH
   mov dx,offset char
   int 0x21
   
   mov dh,12
   mov dl,23
   call setCursorPos
   
   mov ah,9
   
   mov dx,offset msgout
   int 0x21
      
   
   mov dx,offset char+2
   int 0x21
  
exit:
   mov ax,0x4c
   int 0x21
  
    
main endp
     
setCursorPos proc
   mov ah,2H
   mov bh,0H
   int 0x10
   ret     
end   