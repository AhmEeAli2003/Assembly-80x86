.model small


.code


main proc
    
     mov al,0x41  ; 'A' Letter
     mov ch,0x1A  ; 26-> English letter number
    
     mov ah,0x02  
L: 
     mov dl,al     
     int 0x21     
     call nline
     
     inc al
     dec ch
     
     jnz L   
     
    mov ax,0x4c
    int 0x21
    
main endp


nline proc
     mov ah,0x02
     mov dl,0x0a
     ;int 0x21
nline endp 
  ret
 