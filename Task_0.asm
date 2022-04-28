.model small

.data

charTable db 'A','B','C','D','E'

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,02H
    mov bh,0
    mov dx,0D25H
    int 10H
    
    mov ah,06H
    mov al,00H
    mov bh,34H
    mov cx,0000H
    mov dx,184fH
    int 10H
    
    lea si,charTable
    
    mov cx,5
    mov ah,02H
    
L:
   mov dl,[si]
   int 21H
   inc si
   loop L
    
.exit

main endp
end