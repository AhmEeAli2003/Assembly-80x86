.model small

.data

number db 15,?,15 dup('$')
isLucky db 0
luckyNumber db "This is nearly Lucky number$"
notLuckyNumber db "This is not nearly lucky number$"

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov si,0
    
    mov ah,0aH
    mov dx,offset number
    int 0x21
    
L1: mov al,[number+si]
    add si,1
    cmp al,'4'
    je  Equal
    cmp al,'7'     
    je  Equal
    cmp al,'$'
    je  Check
    jmp L1

Equal:
    add isLucky,1
    jmp L1
    
Check:
    cmp isLucky,4
    je  done
    cmp isLucky,7
    je  done
    jmp notLucky
     
     
done:
    call nline
    mov ah,9
    mov dx,offset luckyNumber
    int 0x21
    jmp Exit
notLucky:
    call nline
    mov ah,9
    mov dx,offset  notLuckyNumber
    int 0x21   
Exit:
    mov ax,0x4c
    int 0x21
            
endp main

nline proc
     mov ah,0x02
     mov dl,0x0a
     int 0x21
nline endp 

ret