.model small


.data
message db "Hello, this is Assembly!", '$'

.code

main proc 

mov ax, @data
mov ds,ax

mov ah,06H      ;Request scroll & clear screen
mov al,00H      ;Full screen   [1] == One row from bottom
mov bh,64H      ;Set attribute [6] == background color, [4] == foreground color
mov cx,0000     ;Top left corner of screen
mov dx,184FH    ;Bottom right corner of screen [18] == 25 rows [0-24], [4f] == 80 coloumns [0-79]
int 10H         ;Interrupt call using BIOS


mov ah,2        ;Set cursor location
mov bh,0        ;Select page 0
mov dh,13       ;Set row location
mov dl,28       ;set coloumn location
int 0x10

lea dx,message  ;Load Effictive Adress
mov ah,09       ;Print string service
int 21h         ;Interrupt call using DOS

mov ax,4c00h
int 21h


main endp
end main