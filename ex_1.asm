.model small ;Model of memory 

.data        ;Definiation data

.code        ;Code segmant

main proc    ;procedure

mov ax,@data ;Inatializing data segmant, @ == Adress
mov ds,ax    ;We can't move const value to ds directly, Move adress of data segmant to ds

mov ax,5
mov bx,0Ah  ;Zero before A to know that it's value , not name of variable
add ax,bx
mov bx,1111b
add ax,bx
;int 0x20 --> Exit service from BIOS?
mov ah,0x4c  ;Exit service from DOS?
int 0x21

main endp   ;End procedure
end