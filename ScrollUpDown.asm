.model small

.data

str db "I am interesting with Assembly$"

.code

main proc
    mov ax,@data
    mov ds,ax

    mov ah,7       ;Scroll down sercive
    mov al,12      ;Number of lines to scroll down
    mov bh,30H     ;Atrribute
    mov cx,0028H   ;Coordinate of top left
    mov dx,184fH   ;cordinate of bottom right
    int 0x10
   
    mov ah,6       ;Scroll up service
    mov al,10      ;Number of lines to scroll up
    mov bh,30H     ;Attribute
    mov cx,0000H   ;Coordinate of top left
    mov dx,1826H   ;Coordinate of bottom ight
    int 0x10
    
    mov ah,2H      ;Cursor location service
    mov bh,0H      ;Page number
    mov dh,13      ;Row number
    mov dl,25      ;Coloun number
    int 0x10
    
    lea dx,str
    mov ah,9
    int 0x21
.exit

main endp
end