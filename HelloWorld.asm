.model small
     
.stack


.data    
str db "Hello World","$"

.code

main proc
mov ax,@data
mov ds,ax    

mov bx, offset str
mov cx,11
mov ah,02h
L1: mov dl, [bx]
    int 21h
    inc bx
    dec cx  ;For jnz
    jnz L1  ;Loop
mov ah,4ch
int 21h

main endp
end