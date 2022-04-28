.model small

.data

num1 dw 1233H
num2 dw 3321H
result dw ?

.code

main proc
    mov ax,@data
    mov ds,ax
    
    call sum
    
    mov ax,0x4c
    int 0x21
main endp

sum proc
    mov ax,num1
    add ax,num2
    mov result,ax
    ret
sum endp