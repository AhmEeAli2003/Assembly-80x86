.model small

.data
                   
MsgIn   db "Input number(0-9): $"                  
EvenMsg db "Even number$"
OddMsg  db "Odd number$"

.code

main proc
     
     mov ax,@data
     mov ds,ax
     
     mov ah,0x09
     lea dx,MsgIn
     int 0x21
     
     mov ah,0x01
     int 0x21
     test al,00000001b
     jz  Even
     jnz Odd
Even:
    call nline
    mov ah,0x09
    lea dx,EvenMsg
    int 0x21
    mov ax,0x4c
    int 0x21
Odd:
    call nline
    mov ah,0x09
    lea dx,OddMsg
    int 0x21
    mov ax,0x4c
    int 0x21
           
main endp

nline proc
    mov ah,0x02
    mov dl,0x0a
    int 0x21
nline endp
ret       
end