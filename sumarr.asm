.model small

.data

arr dw 1,3,5,7,9,12,13,15,17,19,21 

.code

main proc
    mov ax,@data
    mov ds,ax
    mov bx,offset arr
    mov cx,10  
    xor ax,ax
L:  add ax,[bx]
    add bx,2
    sub cx,1
    jnz L
    mov [arr+20],ax
    mov ax,0x4c
    int 21h
    
main endp
end main