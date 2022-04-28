.model small 

.data

x db 5
y db 7
z db ?

.code

main proc
mov ax,@data ;MAIN METHOD   SET ADDRESS OF DATA
mov ds,ax    ;CAN'T MOVE @DATA TO DS \ SEGMENT IN DS

mov ax,5
mov bx,9
add ax,bx 
mov bx,0X0E
add ax,bx
mov ah,0X4c
int 21H   
    
main endp

end