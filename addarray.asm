.model small; contain two segment data and code
.386
.data;start of data segment
    A1 DB 20 DUP (?);declaring array
A2 DB 20 DUP (?)
A3 DB 20 DUP (?)
DATA1 dw 0000H
DATA2 DW 0000H
msg db 10,13,"Enter the size of the array one :- $"
msg2 db 10,13,"Enter the first array :- $"

msg4 db 10,13, "Enter the second array :-$"
msg5 db 10,13, "The addition of both array is :-$"
msg6 db 10,13, "The subtraction of both array is :-$"
.code;start code segment
.startup
MOV AH,09
MOV DX,OFFSET msg
INT 21H

MOV CX, 2
L4: MOV AH,01
INT 21H
CMP AL,'A'
JGE L9
SUB AL,30H
JMP L8
L9: SUB AL,37H
L8: SHL BX, 4
ADD BL, AL
LOOP L4
MOV AL, BL
MOV CL, AL
MOV AH, 0
MOV DATA1, AX
MOV CX, DATA1


MOV AH,09
MOV DX,OFFSET msg2
INT 21H
;MOV AH,0

MOV CX, DATA1
LEA SI, A1
L1: MOV DL, 0AH ; jump onto next line
MOV AH, 02H
INT 21H
MOV AH, 01H
INT 21H
SUB AL,30H
MOV [SI], AL
INC SI
LOOP L1


MOV CX, DATA1

MOV AH,09
MOV DX,OFFSET msg4
INT 21H
MOV AH,0

LEA DI, A2
L3: MOV DL, 0AH ; jump onto next line
MOV AH, 02H
INT 21H

MOV AH, 01H
INT 21H
SUB AL,30H

MOV [DI], AL
INC DI
LOOP L3


LEA SI, A3
LEA DI, A1

MOV CX, DATA1
CPYA: MOV AL, [DI]
MOV [SI], AL
INC DI
INC SI
LOOP CPYA

LEA SI, A1
LEA DI, A2

MOV CX, DATA1
ADDA: MOV AL, [SI]
ADD AL, [DI]
MOV [SI], AL
INC DI
INC SI
LOOP ADDA

MOV AH, 09H
MOV DX, OFFSET MSG5
INT 21H

MOV CX, DATA1
LEA SI, A1 
L5:mov ah, 02h
mov dl, 0ah
int 21h
MOV DATA2, CX
MOV CX, 2
MOV BL, [SI]
ADDA1: ROL BL, 4; rotates the bits within the destination operand to the left
MOV DL, BL
AND DL, 0FH
CMP Dl, 9
JA L6
ADD DL, 30h
JMP L7
L6: ADD DL, 37H
L7: MOV AH, 02
INT 21H
LOOP ADDA1
MOV CX, DATA2
INC SI
LOOP L5


LEA SI, A3
LEA DI, A2

MOV CX, DATA1
SUBA: MOV AL, [SI]
SUB AL, [DI]
MOV [SI], AL
INC DI
INC SI
LOOP SUBA

MOV AH, 09H
MOV DX, OFFSET MSG6
INT 21H

MOV CX, DATA1
LEA SI, A3
L18:mov ah, 02h
mov dl, 0ah
int 21h
MOV DATA2, CX
MOV CX, 2
MOV BL, [SI]
SUBA1: ROL BL, 4; rotates the bits within the destination operand to the left
MOV DL, BL
AND DL, 0FH
CMP Dl, 9
JA L19
ADD DL, 30h
JMP L20
L19: ADD DL, 37H
L20: MOV AH, 02
INT 21H
LOOP SUBA1
MOV CX, DATA2
INC SI
LOOP L18

.EXIT
END