.MODEL SMALL
.STACK 100H
.DATA
INP1 Dw 0000H
MSG1 DB 10,13, "ENTER THE FIRST NUMBER (4 DIGIT)::> $"
MSG2 DB 10,13, "ENTER THE SECOND NUMBER (4 DIGIT)::> $"
ADD1 DB 10,13, "RESULT OF ADDITION IS::> $"

.CODE
.STARTUP
MAIN PROC
			MOV AH,09		;INP1
			MOV DX, OFFSET MSG1
			INT 21H

			MOV CX,4
			REPEAT1:MOV AH,01
			INT 21H
			CMP AL, 'A'
			JGE G
			SUB AL,30H
			JMP C
			G: SUB AL,37H
			C: SHL BX, 4   ;don't modify value of CL it is a counter
			MOV AH, 00
			ADD BX,AX
			LOOP REPEAT1

			MOV INP1,BX

			MOV AH,09			;INP2
			MOV DX, OFFSET MSG2
			INT 21H

			MOV CX,4
			REPEAT2:MOV AH,01
			INT 21H
			CMP AL, 'A'
			JGE GG
			SUB AL,30H
			JMP CC
			GG: SUB AL,37H
			CC:SHL BX,4 ;same as inp1 
			MOV AH, 00
			ADD BX,AX
			LOOP REPEAT2

			ADD BX,INP1

			MOV AH,09		; ROL TO GET THE CORRECT OUTPUT
			MOV DX, OFFSET ADD1
			INT 21H

			MOV DL,00
			MOV CX,4
			MOV CL,4

			REPEAT3: ROL BX, 4
			MOV DX,BX
			AND DX, 0FH
			CMP DX, 09
			JG ADD2
			ADD DX,30H
			JMP FIN

			ADD2:ADD DX, 37H

			FIN: MOV AH,02
			INT 21H

			LOOP REPEAT3

MOV AH,4CH
INT 21H			

MAIN ENDP
END
.EXIT