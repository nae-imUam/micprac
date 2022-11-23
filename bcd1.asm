.model small
.386
.data
DATA DW 0000H
msg db 10,13,"Enter the first no.:: $"
msg1 db 10,13,"Enter the second no.:: $"
msg2 db 10,13,"The Resultant sum is :: $"

.code
.startup
MOV AH,09
MOV DX,OFFSET msg
INT 21H


MOV AH,01 ;1ST NO. ENTERED
INT 21H
SUB AL,30H

MOV BL,AL

MOV AH,09
MOV DX,OFFSET msg1
INT 21H

MOV AH,01 ;2nd NO. ENTERED
INT 21H

SUB AL,30H



ADD AL,BL

DAA



MOV BL,AL
MOV AH,09
MOV DX,OFFSET msg2
INT 21H

MOV CX,2
AGAIN2: ROL BL,4

MOV DL,BL

AND DL, 0Fh
ADD DL,30H
MOV AH,02
INT 21H
loop again2




L2: .EXIT
END