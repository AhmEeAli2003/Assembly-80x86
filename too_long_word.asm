.model small

.data
  wordsNum db ?
  word     db 101,?,101 dup('$')
  result dd 100 dup('$')
  temp dw ?
  
.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,0aH
    mov dx,offset word
    int 0x21
    
    mov ch,word+1           ;Lenght of word
    
    mov ah,2H
    mov dl,0aH
    int 0x21
    
    
    cmp ch,10
    ja  GreaterThanTen  
    jmp PrintWord
    
PrintWord:
    mov ah,9H
    mov dx,offset word+2    ;Index of first char in word
    int 0x21
    jmp Exit
GreaterThanTen:
    cmp ch,11
    ja  GreaterThanEleven
    call printFirstChar 
    call printNumLessTen
    call printLastChar1
    jmp exit
        
GreaterThanEleven:
    call printFirstChar
    mov cl,0                ;Xoring cl
    push cx                 ;Saving cx in stack, i'll use it with old value after change it's value
    call printNumAboveNine
    call printLastChar2
    jmp Exit
    
exit:
    .exit    
endp main

proc printFirstChar
    mov ah,2H
    mov dl,[word+2]
    int 0x21
    ret
proc printNumLessTen
    mov cl,ch               ;ch-> lenght of word
    sub ch,2                ;decrement first & last char
    add ch,48               ;48-> 0 in Ascii
    mov dl,ch
    int 0x21                
    mov ch,0                ;To avoid problem in printLastChar2 proc, if ch-> any number Then si will carry wrong offset in line 85
    ret
proc printNumAboveNine
    mov dx,0                ;Xoring dx
    sub ch,2                ;decrement first & last char
    mov cl,0                ;Xoring cl
    mov ax,cx               ;I'll div ax/cx
    mov ch,10               ;Now, cx->10
    div cx                  ;Divide Ax/cx, Assume 0B/10
    mov ah,2H
    add al,48               ;Result of div = 1
    mov dl,al
    int 0x21                ;Modulus of div = 2
    add dh,48               
    mov dl,dh
    int 0x21
    ret
proc printLastChar1         ;To run after less than ten number
    mov bx, offset word
    mov si,cx               ;Offset of last char -1
    inc si                  
    mov dl,[bx+si]
    int 0x21
    hlt            
proc printLastChar2         ;To run after printNumAboveNine proc
    pop temp                ;ret var of printNumAboveNine proc
    pop cx                  ;To get old offset of last char -1
    mov cl,ch               ;I wanna move offset as lower beacuse increment operation
    mov ch,0                ;Xoring ch to avoid any problem when incrementing & addressing
    mov bx, offset word
    mov si,cx               ;Offset of last char - 1
    inc si
    mov dl,[bx+si]
    int 0x21
    hlt    