.MODEL SMALL;contain two segment data and code
    .DATA;start of data segment
        INPUT DB 10,13 , 'ENTER BINARY NO:- $';10 is the ascii control code for line fed while 13 is the code for carriage return
OUTPUT DB 10,13, 'THE ASCII CHARACTER IS:-$'

.CODE;start of code segment
    .STARTUP;generates program start up code
MOV AH,09H
MOV DX,OFFSET INPUT
INT 21H; Output a string terminated by '$? stored in DX, as AH =9
MOV BL, 00H
MOV CL,08H
INPUT1: MOV AH,01H
INT 21H;input from user
SUB AL,30H
SHL BL,1
ADD BL,AL
LOOP INPUT1;go to label input
MOV AH,09H
LEA DX,OUTPUT
INT 21H; Output a string terminated by '$? stored in DX, as AH =9
MOV AH,02H
MOV DL,BL
INT 21H ; Output a character present in DL , as AH value is 2
.EXIT
END