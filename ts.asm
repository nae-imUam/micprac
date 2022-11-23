.model small
.386
.data
ARRAY DW 20 DUP (?)
DATA1 dw 0000H
NUMB DW 0000H
msg db 10,13,"Enter the size of the array :: $"
msg2 db 10,13,"Enter the array :: $"
msg3 db 10,13,"The sorted array is :: $"

.code
.startup

MOV DX, 20H

MOV AX, offset DX
.EXIT
END