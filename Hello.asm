.model small

.data 

message db "Hello everybode! I am learning Assemply language!","$"

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09
    lea dx,message   ;Load effictive address
    int 21h
    
    mov ah,0x4c
    int 21h    
    
main endp

end