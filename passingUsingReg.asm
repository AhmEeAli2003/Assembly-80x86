.model small

.data

num1 dw 1233H
num2 dw 3321H
result dw ?

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov bx,num1
    mov dx,num2
    call sum
    mov result,ax
    
    mov ax,0x4c
    int 0x21
main endp

sum proc
    mov ax,bx
    add ax,dx
    ret
sum endp