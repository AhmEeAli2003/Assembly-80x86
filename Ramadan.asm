.model small

.data

temp db 0
ramadan db "Ramadan$"
mubarak  db "Mubarak$"
msg      db "Created by$" 
myName   db "Ahmed Ali$"
asm      db "Assembly$"
lang     db "Language$"
 
.code

main proc
    mov ax,@data
    mov ds,ax
    
    call setScreenSize
    
    
    mov dh,0
    mov dl,19
    call setCursorPos
    
    call screenAttribute

    mov dh,0
    mov cx,3
L1:
    call draw
    inc dh
    mov dl,19
    call setCursorPos
    loop L1
    
    mov cx,3
    dec dh
    
L2: 
    mov dl,19
    inc dh
    inc temp
    sub dl,temp
    call setCursorPos
    call draw
    loop L2
    
    mov cx,3
    mov temp,0
    mov dh,2
L3:
    mov dl,19
    inc dh
    inc temp
    add dl,temp
    call setCursorPos
    call draw
    loop L3
    
    mov cx,4
    mov temp,0
L4: 
    mov dl,14
    inc dh
    inc temp
    add dl,temp
    call setCursorPos
    call draw
    loop L4 
    
    mov dh,5
    mov cx,4
    mov temp,0
    
 
L5:
    mov dl,24
    inc dh
    inc temp
    sub dl,temp
    call setCursorPos
    call draw
    loop L5
    
    mov dh,9
    mov cx,5
    mov temp,0
L6:
    mov dl,19
    inc dh
    inc temp
    sub dl,temp
    call setCursorPos
    call draw
    loop L6 
    
    mov dh,9
    mov cx,5
    mov temp,0
L7:
    mov dl,19
    inc dh
    inc temp
    add dl,temp
    call setCursorPos
    call draw
    loop L7
    
    mov dh,14
    mov cx,6
    mov temp,0
    
L8:
    mov dl,12
    inc dh
    inc temp
    add dl,temp
    call setCursorPos
    call draw
    loop L8
    
    mov dh,14
    mov cx,6
    mov temp,0        
L9:
   mov dl,26
    inc dh
    inc temp
    sub dl,temp
    call setCursorPos
    call draw
    loop L9
    
    mov dh,20
    mov cx,3
    mov temp,0
    
L10:
    mov dl,19
    inc dh
    inc temp
    sub dl,temp
    call setCursorPos
    call draw
    loop L10
    
    mov dh,20
    mov cx,3
    mov temp,0
    
L11:
    mov dl,19
    inc dh
    inc temp
    add dl,temp
    call setCursorPos
    call draw
    loop L11
    
    mov cx,5
    mov dh,23
    mov temp,0

L12:
    mov dl,17
    add dl,temp
    inc temp
    call setCursorPos
    call draw
    loop L12
    
    mov dh,18
    mov dl,3
    call setCursorPos
    mov ah,9H
    mov dx,offset ramadan
    int 0x21 
    
    mov dh,18
    mov dl,29
    call setCursorPos
    mov ah,9H
    mov dx,offset mubarak
    int 0x21 
    
    mov dh,20
    mov dl,2
    call setCursorPos
    mov ah,9H
    mov dx,offset msg
    int 0x21
    
    mov dh,22
    mov dl,2
    call setCursorPos
    mov ah,9H
    mov dx,offset myName
    int 0x21
    
    mov dh,20
    mov dl,29
    call setCursorPos
    mov ah,9H
    mov dx,offset asm
    int 0x21
    
    mov dh,22
    mov dl,29
    call setCursorPos
    mov ah,9H
    mov dx,offset lang
    int 0x21  
          
    mov ax,0x24
    int 0x21
    
endp main

setCursorPos proc
   mov ah,2H
   mov bh,0H
   int 0x10
   ret     
setScreenSize proc
   mov ah,0h
   mov al,1h
   int 0x10
   ret  
screenAttribute proc
   mov ah,6H
   mov al,0H
   mov bh,30
   mov cx,0000
   mov dx,7924
   int 0x10   
   ret
draw proc
   mov ah,2h
   mov dl,'*'
   int 0x21
   ret
   