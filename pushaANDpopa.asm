.model small

.code

main proc
    
    ;Push value of all general purpose reg to stack 
    pusha 
    
    ;Change value of This 8 reg 
    mov ax,9876H
    mov bx,6578H
    mov cx,3400H
    mov dx,1298H
    mov si,3450H
    ;mov sp,8796H If you change stack pointer, Then prog will return false val
    mov bp,1254H
    mov di,2370H
    
    ;Repeat original values from stak to registers
    popa
    
    ;Terminate
    mov ax,0x4c
    int 0x21
    
endp main
end