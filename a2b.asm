.MODEL SMALL; contain two segment data and code
.DATA; start of data segment
MESG DB 10,13, 'ENTER A ascii character: $'
RESULT DB 10,13, 'RESULT IS: $'; 10 is the ASCII control code for line feed while 13 is the code for 
;carriage return
.CODE; start of code segment
.STARTUP

MOV DX,OFFSET MESG;loading the offset address
MOV AH,09H
INT 21H

MOV AH,01H
INT 21H;input from user
MOV BL,AL

MOV DX,OFFSET RESULT
MOV AH,09H
INT 21H ;Output a string terminated by '$? stored in DX, as AH =


MOV CL,08H
MOV AH,00H
MOV AL,BL
L1: SHL AL, 01H
MOV BL,AL
MOV AL,00H
ADC AL,30H
MOV DL,AL
MOV AH,02H
INT 21H ;Output a string terminated by '$? stored in DX, as AH value is 2

MOV AL,BL
LOOP L1
.EXIT
END