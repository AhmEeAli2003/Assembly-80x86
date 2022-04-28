.model small

.code

main proc
    call func1
    mov ax,5
    ret
main endp

func1 proc
    mov bx,5
    call func2
    ret
func1 endp

func2 proc
    cmp ax,bx
    je L1
    mov cx,0
    jmp next
L1:
    mov cx,1
next:
    ret
func2 endp 
end