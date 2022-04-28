.model small

.code

main proc
    mov ax,0xB800       ;Screen buffer segmant
    mov es,ax           ;Extra Segmant reg
    
    mov dl,0x41         ;Char code
    mov dh,0x74         ;Attribute of char [7] is background color, [4] is foregroung color 
             
    mov bx,0            ;To use it as offset 
             
    mov cx,26           ;Number of English letters 
    
    
    
print:
    mov es:[bx],dx      ;Move dx to B800:0000 at once
    inc dl              ;Next letter
    add bx,2            ;Increment offset by 2 bytes [byte for char code + byte for it;s attribute]
    loop print          ;Decrement cx & jnz print
    
.exit

main endp
end