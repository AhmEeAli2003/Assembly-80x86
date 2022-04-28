.model small

.data

num1 dw 1233H
num2 dw 3321H
result dw ?

.code

main proc
    mov ax,@data
    mov ds,ax
    
    push num2
    push num1
    
    call sum
         
    mov result,ax
    
    mov ax,0x4c
    int 0x21
main endp

sum proc
    push bp         ;To avoid any problem
    mov bp,sp       ;To acsess variables in stack
    mov ax,[bp+4]   ;refer to num 1, because [sp+2] or [bp+2] refer to return address
    add ax,[bp+6]   ;refer to num2, because i push num2 first, and stack works as LIFO
    pop bp          ; It's very important pop bp from stack before ret, because the TOS is val of BP, so will return to address equal BP val
    ret 4           ;This will return to correct address, then pop 4 bytes [num1 and num2] from stack
sum endp