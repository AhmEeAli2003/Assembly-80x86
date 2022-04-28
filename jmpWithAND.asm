.model small

.data

var1 db 9
var2 db 8
var3 db 7
var4 db ?

.code

main proc 
    mov ax,@data
    mov ds,ax
    
    mov al,var1
    mov bl,var2
    mov cl,var3
    cmp al,bl
    ja Implentation1    ;jbe L
    jmp L               ;cmp bl,cl
                        ;jbe L
Implentation1:          ;mov var4,1
    cmp bl,cl
    ja  Implentation2
    jmp L
            
Implentation2:
    mov var4,1
            
L:
   mov ax,0x4c
   int 0x21
endp main
end