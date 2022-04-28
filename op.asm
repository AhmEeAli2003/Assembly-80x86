.model small


.data
    
 A dw 215
 B dw 125
 C dw 100
 D db 20
 E db 10
 F dw ?  

.code


main proc
    mov ax,@data
    mov ds,ax
    
    mov ax,A
    add ax,B
    sub ax,C
    mov cl,D
    mul cx 
    mov cl,E
    div cx
    
    mov F,ax
    mov ax,0x4c
    

main endp
end main