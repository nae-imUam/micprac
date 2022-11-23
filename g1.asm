.Model Small
.Stack 100h
.data
.code
MAIN PROC




mov ah, 01
int 21h
mov bl, al
sub bl, 30h


mov ah, 01
int 21h
sub al, 30h

add bl, al
cmp bl, 09
jg l1
add bl, 30h
jmp l2
l1: add bl, 37h

l2: mov dl, bl
mov ah, 02
int 21h


mov AH, 4ch
int 21h

main endp


end main

