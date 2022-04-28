;Less code using fall-through logic
;ja Imp
;cmp bl,cl
;jbe L
;Imp: mov var4,1
;L:

.model small

.data

var1 db 6
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
    ja Implementation2
    cmp bl,cl
    ja  Implementation2   
    jmp L               
                        
            
Implementation2:
    mov var4,1
            
L:
   mov ax,0x4c
   int 0x21
endp main
end