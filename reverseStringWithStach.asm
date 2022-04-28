.model small

.data

str db "ABCDEFG$"

.code

main proc
    mov ax,@data
    mov ds,ax
    
    ;Initializing registers
    mov bx, offset str
    mov si,0
    mov cx,0
    
    ;Print string before reverse
    mov dx,bx
    mov ah,0x09
    int 0x21              
    
    ;Initializing register AX 
    mov ax,0
L1:
    mov al,[bx+si]  ;Move value/char which in this address to al 
    cmp al,"$"      ;Check if end of string
    je outLoop
    push ax         ;Can't push only AL, so we'll push AX
    inc si          ;Incerement source index reg to read next char
    inc cx          ;Count lenght of string 
    jmp L1
    
outLoop:
    mov si,0        ;Intializing source Index reg again to start reverse

L2: 
    pop ax          ;pop last element in stack [should be last letter] to AX
    mov [bx+si],al  ;Move this element/char to this address [Old string will remove in this case]
    inc si          ;Incerement source index reg to write next cahr in next address
    dec cx          ;Number of charactars in string, If Zero: Then stop
    jnz L2 
       
    call nline      ;Print new line
    
    ;print string after reverse   
    mov dx,bx
    mov ah,0x09
    int 0x21
    
    ;Terminate the program
    mov ax,0x4c
    int 0x21
endp main

nline proc
     mov ah,0x02
     mov dl,0x0a
     int 0x21
nline endp 
       
ret  