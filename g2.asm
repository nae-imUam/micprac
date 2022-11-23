.Model Small
.Stack 100h
.data
.code
MAIN PROC

mov cx, 10
mov dx, 30h

L1: mov ah, 02
int 21h

add dx, 1

Loop L1

mov ah, 4ch
int 21h

main endp
end main
