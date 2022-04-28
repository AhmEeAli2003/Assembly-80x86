.model small

.code

main proc
    mov bx,5
    cmp bx,6
    je Implentation
    mov dx,2
    jmp L
Implentation:    
        mov dx,1
        ;mov dx,6
L:
   mov ax,0x4c
   int 0x21
endp main
end