.model small
.386
.data

DATA1 dd 00000000H
msg1 db 10,13, "Enter the first no.:$"
msg2 db 10,13, "Enter the second no.:$"
msg3 db 10,13, "The sum is :$"

.code
.startup
mov ah,09
mov dx, offset msg1
int 21h
mov ebx,0
mov cx,8

again: mov ah,01 ;first number entered
int 21h
cmp al,'A'
jge l5
sub al,30h
jmp l6
l5:sub al,37h
l6:shl ebx,4
add bl,al

loop again
mov DATA1, ebx
mov ah,09
mov dx,offset msg2
int 21h
mov ebx,0
mov cx,8

again1: mov ah,01 ;second number is entered
int 21h
cmp al,'A'
jge l7
sub al,30h
jmp l8
l7:sub al,37h
l8:shl ebx,4
add bl,al

loop again1
add ebx,DATA1 ;Addtion of above two number
mov ah,09
mov dx,offset msg3
int 21h
mov cx,8


again2: rol ebx,4
mov dl,bl
and dl,0fh
and dl,09
cmp dl,09
jg l1 ; to o/p given number

add dl,30h
jmp print
l1: add dl,37h
print: mov ah,02
int 21h
loop again2

end