.model small


.data   

Negative db "Negative number$"
Positive db "Positive number$"
Zero     db "Zero number$"

.code

main proc
   mov ax,@data
   mov ds,ax
   
   mov bl,0x30 
   cmp bl,0x30
   jl NegativeFun
   jz ZeroFun                   
   jg PositiveFun
   
   
NegativeFun: 
   mov ah,0x09      ;print string service --> char == 0x02 
   lea dx, Negative ;Load effictive address 
   int 21h
   jmp Display
ZeroFun:    
  mov ah,0x09
  lea dx,Zero
  int 0x21
  jmp Display
PositiveFun:
  mov ah,0x09  
  lea dx, Positive
  int 0x21
  jmp Display

Display:   
   
   
   mov ax,0x4c
   int 0x21
    
main endp 
end main