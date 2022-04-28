.model small

.code

main proc
   push 4356H    ;3rd element
   push 7689H    ;2nd element
   push 6453H    ;1st element
   mov bp,sp     ;We can't use sp to addressing So,we use bp,bx,si,di
   mov ax,[bp+4] ;move 3rd element to ax
   
   mov ax,0x4c
   int 0x21
    
endp main
end