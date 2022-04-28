.model small

.stack

.data

saveFlags dw ?

.code

main proc
   mov ax,@data
   mov ds,ax
   
   pushf            ; Push flags reg to stack
   
   pop saveFlags    ; pop flags reg from stack to saveFlags
   
   mov al,1
   dec al           ; ZF = 1 , PF = 1
                                                            
   push 1234H       ;Push any value in the stack
                                                     
   push saveFlags   ; push flags reg from svaeFlags to stack [If U don't push any value after it, U can ignore it and INS in line 17]
   
   popf             ; pop flags reg from stack to flags register [ZF = 0 , PF = 0]
   
   mov ax,0x4c
   int 0x21
                              
endp main
end