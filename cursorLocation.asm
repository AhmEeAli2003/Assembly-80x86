.model small

.data

str db "What, It's work!$"

.code

main proc
    mov ax,@data
    mov ds,ax
    
    
    mov ah,2
    mov bh,0
    mov dh,13
    mov dl,31
    int 0x10
    
   
    mov ah,9
    lea dx,str
    int 0x21
    
    
    
.exit
main endp
end