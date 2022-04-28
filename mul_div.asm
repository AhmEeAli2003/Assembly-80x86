.model small

.data

.code

main proc
   mov ax,@data
   mov ds,ax 
            
   mov al,87
   mov cl,6
   mul cl   ; Case 1 --> When OP is a byte
   
   mov ax,76
   mov cx,34
   mul cx
   
   
    
    
    
    
main endp

end