.model small

.data

easy db "EASY$"

hard db "HARD$"

inMsg db "Input number of person: $"

.code

proc main
     mov ax, @data
     mov ds,ax
     
     mov ah,09
     lea dx,inMsg
     int 0x21
     
     mov ah,01
     int 0x21
     
     xor cx,cx
     mov cl,al
     sub cx, 48
    
     call \n
     
L:   
     cmp cx,0
     je Next
     mov ah,01
     int 0x21
     cmp al,'1'
     je Lhard
R:   loop L
     
next:
     call \n
     cmp bl,'1'
     je Phard
     mov ah,09
     lea dx, easy
     int 0x21
     jmp Exit
     
Lhard:
    mov bl, al
    jmp R
    
Phard:
    mov ah,09
    lea dx, hard
    int 0x21 
    jmp Exit
    
Exit:
    mov ax,0x4c
    int 0x21           
     
main endp  

proc \n
    mov ah,0x02
    mov dl,0x0A
    int 0x21
\n endp
    ret