.model small; contain two segment data and code
    .386;instruction for 80386
    .data;data segment start
        ARRAY DW 20 DUP (?);declaring aray with garbage
        DATA1 dw 0000H;initialize memory with word
NUMB DW 0000H
msg db 10,13,"Enter the size of the array :: $"
msg2 db 10,13,"Enter the array :: $"
msg3 db 10,13,"The sorted array is :: $"
.code ; start of code segmen
.startup; Generates program start-up code
MOV AH,09
MOV DX,OFFSET msg
INT 21H; Output a string terminated by '$? stored in DX, as AH =9
MOV AH,01
INT 21H
SUB AL,30H
MOV AH,0
MOV CX,AX
MOV DATA1,AX
MOV AH,09
MOV DX,OFFSET msg2
INT 21H; Output a string terminated by '$? stored in DX, as AH =9
MOV AH,0
MOV SI, 0
MOV BX, OFFSET ARRAY
L1: MOV DL, 0AH ; jump onto next line
MOV AH, 02H
INT 21H
MOV DX, SI ; input element of the array
MOV AH, 01H
INT 21H
SUB AL,30H; convert the hexadecimal digits into its equivalent ASCI
MOV SI, DX
MOV [BX + SI], AX ; store at memory location addressed by DS[BX+SI]
INC SI
LOOP L1

MOV CX, DATA1
MOV BX, OFFSET ARRAY ; store the offset address of array 
MOV DI,CX
L2: MOV CX, DATA1
MOV NUMB, CX     ; Change1
DEC NUMB         ; Change2
MOV CX, NUMB     ; change3
MOV SI, 0
L3: MOV AL, [BX + SI]
CMP AL, [BX + SI + 1]; compare the value of content in AL and at DS[BX+SI+1]
JL L4
XCHG AL,[BX + SI + 1]; exchange the value of content in AL and at DS[BX+SI+1]
MOV [BX + SI],AL
L4: INC SI
LOOP L3
DEC DI
JNZ L2

MOV CX, DATA1
MOV SI, 0
MOV BX, OFFSET ARRAY
MOV AH,09
MOV DX,OFFSET msg3
INT 21H; Output a string terminated by '$? stored in DX, as AH =9
L5: MOV DL, 0AH ; jump onto next line
MOV AH, 02H
INT 21H
MOV DX, [BX + SI]
INC SI
ADD DL, 30H
MOV AH, 02
INT 21H ; Output a character present in DL , as AH value is 2
LOOP L5
.EXIT
END