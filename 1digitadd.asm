.model small
.386
.data
DATA1 dd 00000000H
msg db 10,13,"Enter the first no.:: $"
msg1 db 10,13,"Enter the second no.:: $"
msg2 db 10,13,"The Resultant sum is :: $"

.code
MOV AH,09
MOV DX,OFFSET msg
INT 21H

MOV AH, 02
INT 21H
CMP AL,'A'
JGE L1
SUB AL,30H
JMP L2
L1: SUB AL,37H
L2:ADD BL,AL

MOV AH,09
MOV DX,OFFSET msg1
INT 21H

MOV AH, 02
INT 21H
CMP AL,'A'
JGE L3
SUB AL,30H
JMP L4
L3: SUB AL,37H
L4:ADD BL,AL

MOV AH,09
MOV DX,OFFSET msg2
INT 21H

MOV DL,BL
AND DL,0FH
CMP DL,09
JG L5 ; to o/p given no.
ADD DL,30H
JMP PRINT
L5: ADD DL,37H
MOV AH,02
INT 21H

.exit
end