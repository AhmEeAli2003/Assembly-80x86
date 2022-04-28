.model small

.data

True db "Value found$"
False db "Value not found$"
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov al,00000100b
    test al,0000011b
    jnz ValueFound   ;If either bit 0 or bit 1 in AL is set
    jz ValueNotFound ;If neither bit 0 nor it 1 in AL is set
ValueFound:
        mov ah,0x09
        lea dx,True
        int 0x21
        mov ax,0x4c
        int 0x21
ValueNotFound:
        mov ah,0x09
        lea dx,False
        int 0x21
        mov ax,0x4c
        int 0x21
main endp
end