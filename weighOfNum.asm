.model small

.data

digits db 0,0,0,0,0,0,0,0,0,0

.code

main proc
    mov ax,@data
    mov ds,ax 
       
input:
    mov al,'0'
    mov ah,1
    int 0x21
    
    cmp al,'0'
    ja above
    jl exit
    inc [digits+0],1
    jmp input
    
above:   
   cmp al,'9'
   jl  switch
   ja  exit
   inc [digits+9]
   jmp input

switch:
    call switchFun
    jmp input   
    
exit:
    cmp al,13
    jne input
    call print
    mov ah,0x4c
    int 0x21   
endp main
         
switchFun proc
    mov ah,0
    mov bx,offset digits
    add al,-48
    mov si,ax
    inc [bx+si]
    ret
             
print proc
    mov cx,10
    mov bx,offset digits
    mov si,0
start:
    mov ah,2H
    mov dl,[bx+si]
    add dl,48
    int 0x21
    mov dl,' '
    int 0x21
    inc si
    dec cx
    jnz start
    ret
    
                                   