.model small


.data

arr db 5 dup(?)
mesin db "Input 5 numbers","$"
mesout db "Output is","$"

.code


main proc      
    mov ax,@data            
    mov ds,ax               
    
    mov ch,0x05            ;Counter
    mov bx,offset arr      ;To Handle it
    mov ah,0x09            ;Print service No
                    
    lea dx,mesin
    int 0x21                
    call nline
    
    mov ah,0x01            ;input service No
                        
L1: int 0x21
    mov [bx],al
    inc bx
    dec ch
    jnz L1    
    
    call nline
    mov ah,0x09
    lea dx,mesout
    int 0x21
    
    mov cl,0x05 
    call nline 
    mov bx,offset arr
    
L2: mov dl,[bx]             ;Output service No in func nline
    int 0x21
    call nline
    inc bx
    dec cl
    jnz L2
    
    mov ah,0x4c
    int 0x21
    
    
main endp
   
nline proc
     mov ah,0x02
     mov dl,0x0a
     int 0x21
nline endp 
       
ret