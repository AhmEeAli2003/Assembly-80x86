.model small

.stack


.data        
x db 0ch,13
y dw 23afh
z db 5 dup(2)


.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov al,x
    mov bh,[x+1] 
    mov cl,[x+2] ; can't write cl,y
    
    mov ah,4ch
    int 21h
    
    
    
main endp

end