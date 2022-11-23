.MODEL SMALL
.STACK 100H

.DATA
MSG DB 10,13,"LIST OF OPERATIONS AND THEIR CORRESPONDING NUMBER $"
MSG1 DB 10,13,"1. ADDITION $"
MSG2 DB 10,13,"2. SUBTRACTION $"
MSG3 DB 10,13,"3. MULTIPLICATION $"
MSG4 DB 10,13,"ENTER THE NUMBER OF THE OPERATION WHICH YOU WANT TO PERFORM $"
MSG5 DB 10,13,"Enter the first operand(any one digit number) $"
MSG6 DB 10,13,"Enter the second operand(any one digit number) $"
MSG7 DB 10,13,"Result : $"

.CODE 
.startup ; GUNJAN(athough this is not needed but tasm needs it)
MAIN PROC

MOV AH,09
MOV DX,OFFSET MSG
INT 21H

MOV AH,09
MOV DX,OFFSET MSG1
INT 21H

MOV AH,09
MOV DX,OFFSET MSG2
INT 21H

MOV AH,09
MOV DX,OFFSET MSG3
INT 21H

MOV AH,09
MOV DX,OFFSET MSG4
INT 21H

MOV AH,01
INT 21H

SUB al, 30h ;GUNJAN (because in AL it is 31 for 1 and 32 for 2..)


CMP AL, 1
JE L1  

CMP AL, 2
JE L2

CMP AL, 3
JE L3

L1: MOV AH,09
          MOV DX,OFFSET MSG5
          INT 21H

MOV AH,01
INT 21H

MOV BL,AL
SUB BL,30H

MOV AH,09
MOV DX,OFFSET MSG6
INT 21H

MOV AH,01
INT 21H

SUB AL,30H

ADD BL,AL

MOV AH,09           ;GUNJAN(moved it up coz in down dx value changes)
MOV DX,OFFSET MSG7
INT 21H

MOV DL,BL
ADD DL,30H

MOV AH,02
INT 21H

Jmp L4    ;GUNJAN (this jump was unconditional)

L2: MOV AH,09
             MOV DX,OFFSET MSG5
             INT 21H

MOV AH,01
INT 21H

MOV BL,AL
SUB BL,30H

MOV AH,09
MOV DX,OFFSET MSG6
INT 21H

MOV AH,01
INT 21H

SUB AL,30H

SUB BL,AL

MOV AH,09     ;GUNJAN(moved it up coz in down dx value changes)
MOV DX,OFFSET MSG7
INT 21H

MOV DL,BL
ADD DL,30H

MOV AH,02
INT 21H

Jmp L4	;GUNJAN (this jump was unconditional)

L3:      MOV AH,09
         MOV DX,OFFSET MSG5
         INT 21H

MOV AH,01
INT 21H

MOV BL,AL
SUB BL,30H

MOV AH,09
MOV DX,OFFSET MSG6
INT 21H

MOV AH,01
INT 21H

SUB AL,30H

MUL BL

MOV AH,09     ;GUNJAN(moved it up coz in down dx value changes)
MOV DX,OFFSET MSG7
INT 21H

MOV DL,AL
ADD DL,30H

MOV AH,02
INT 21H
;GUNJAN (removed jmp from here as it was redundant but not wrong)
L4:   MOV AH,4CH
      INT 21H

MAIN ENDP
.exit ;GUNJAN(end of .startup)
end ; GUNJAN (end main not needed with startup and exit)
