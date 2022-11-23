.model small
.386
.data
DATA Db 00H
msg db 10,13,"Enter the first no.:: $"
msg1 db 10,13,"Enter the second no.:: $"
msg2 db 10,13,"The Resultant sum is :: $"

.code
.startup
MOV AH,09
MOV DX,OFFSET msg
INT 21H

mov cx, 2

l1: MOV AH,01 ;1ST NO. ENTERED
INT 21H
SUB AL,30H
SHL bl, 4
ADD BL,AL
loop l1
mov data, bl

MOV AH,09
MOV DX,OFFSET msg1
INT 21H

mov cx,2
l2: MOV AH,01 ;2nd NO. ENTERED
INT 21H
SUB AL,30H
shl bl, 4
add bl, al
loop l2

mov al, data



ADD AL,BL


DAA
mov ah, 00
adc ah, 00



MOV Bx,Ax
MOV AH,09
MOV DX,OFFSET msg2
INT 21H

MOV CX,4
AGAIN2: ROL Bx,4

MOV DL,BL

AND DL, 0Fh
ADD DL,30H
MOV AH,02
INT 21H
loop again2




L3: .EXIT
END