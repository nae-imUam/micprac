.model small; contain two segment data and code
.386
.stack 100h ; tells the assembler to reserve storage
.data;start of data segment
DATA1 DD 00000000H;initialize memory with double word
DATA2 DD 00000000H;initialize memory with double word
PROD1 dd ?; set double word variable
PROD2 dd ?; set double word variable
REM dd ?; set double word variable
QUO dd ?; set double word variable

msg1 db 10,13,"Enter a number(A): $";10 is the ascii control code for line fed while 13 is the code for carriage return
msg2 db 10,13,"Enter another number(B): $"
msg3 db 10,13,"Press 1 to ADD.$"
msg4 db 10,13,"Press 2 to subtract.$"
msg5 db 10,13,"Press 3 to multiply .$"
msg6 db 10,13,"Press 4 to division.$"
msg7 db 10,13,"Enter your choice: $"
msg8 db 10,13,"A - B = $"
msg9 db 10,13,"A + B = $"
msg10 db 10,13,"A * B = $"
msg32 db 10,13,"The Remainder is :: $"
msg33 db 10,13,"The Quotient is :: $"

.code ; start of code segment
.startup; Generates program start-up code

mov BL,00H

mov ah,09
mov dx, offset msg3
int 21h; Output a string terminated by '$? stored in DX, as AH =9

mov ah,09
mov dx, offset msg4
int 21h

mov ah,09
mov dx, offset msg5
int 21h

mov ah,09
mov dx, offset msg6
int 21h

mov ah,09
mov dx, offset msg7
int 21h; Output a string terminated by '$? stored in DX, as AH =9

mov ah, 01
int 21h;input from user

sub al,30h

cmp al,01h
je addition

cmp al,02h
je subtraction

cmp al,03h
je multiply

cmp al,04h
je division

addition:
    MOV AH,09
    MOV DX,OFFSET msg1
    INT 21H
    MOV EBX,0
    MOV CX,8
    AGAIN:
        MOV AH,01 ;1ST NO. ENTERED
        INT 21H
        CMP AL,'A'
        JGE L5; jump to the lebel
        SUB AL,30H
        JMP L6 ; jump to the lebel
    L5: SUB AL,37H
    L6:
        SHL EBX,4
        ADD BL,AL
        LOOP AGAIN; goto to the lebel
        MOV DATA1,EBX
        MOV AH,09
        MOV DX,OFFSET msg2
        INT 21H
        MOV EBX,0
        MOV CX,8
    AGAIN1:
        MOV AH,01 ;2nd NO. ENTERED
        INT 21H
        CMP AL,'A'
        JGE L7; jump to the lebel
        SUB AL,30H
        JMP L8; jump to the lebel
    L7: SUB AL,37H
    L8: SHL EBX,4
    ADD BL,AL
    LOOP AGAIN1; goto to the lebel
    ADD EBX,DATA1 ;ADDITION
    MOV AH,09
    MOV DX,OFFSET msg9
    INT 21H
    MOV CX,8
    AGAIN2:
        ROL EBX,4
        MOV DL,BL
        AND DL,0FH
        CMP DL,09
        JG L1 ; to o/p given no.
        ADD DL,30H
        JMP PRINT
    L1: ADD DL,37H
    PRINT: MOV AH,02
    INT 21H
    LOOP AGAIN2
    JMP ENDF

 subtraction:
    MOV AH,09
    MOV DX,OFFSET msg1
    INT 21H
    MOV EBX,0
    MOV CX,8
    AGAIN21:
        MOV AH,01 ;1ST NO. ENTERED
        INT 21H
        CMP AL,'A'
        JGE L15; jump to the lebel
        SUB AL,30H
        JMP L16; jump to the lebel
    L15: SUB AL,37H
    L16:
        SHL EBX,4
        ADD BL,AL
        LOOP AGAIN21; goto to the lebel
        MOV DATA1,EBX
        MOV AH,09
        MOV DX,OFFSET msg2
        INT 21H
        MOV EBX,0
        MOV CX,8
    AGAIN3:
        MOV AH,01 ;2nd NO. ENTERED
        INT 21H
        CMP AL,'A'
        JGE L17
        SUB AL,30H
        JMP L18; jump to the lebel
    L17: SUB AL,37H
    L18:
        SHL EBX,4
        ADD BL,AL
        LOOP AGAIN3
        MOV DATA2, EBX
        MOV EBX, DATA1
        SUB EBX,DATA2 ;SUBTRACTION
        MOV AH,09
        MOV DX,OFFSET msg8
        INT 21H
        MOV CX,8
    AGAIN4:
        ROL EBX,4
        MOV DL,BL
        AND DL,0FH
        CMP DL,09
        JG L11 ; to o/p given no.
        ADD DL,30H
        JMP PRINT1
    L11: ADD DL,37H
    PRINT1:
        MOV AH,02
        INT 21H
        LOOP AGAIN4; goto to the lebel
    JMP ENDF

multiply:
    MOV AH,09
    MOV DX,OFFSET msg1
    INT 21H
    MOV EBX,0
    MOV CX,8
    AGAIN5:
        MOV AH,01 ;1ST NO. ENTERED
        INT 21H
        CMP AL,'A'
        JGE L25
        SUB AL,30H
        JMP L26; jump to the lebel
    L25: SUB AL,37H
    L26:
        SHL EBX,4
        ADD BL,AL
        LOOP AGAIN5; goto to the lebel
        MOV DATA1,EBX
        MOV AH,09
        MOV DX,OFFSET msg2
        INT 21H
        MOV EBX,0
        MOV CX,8

    AGAIN6:
        MOV AH,01 ;2nd NO. ENTERED
        INT 21H
        CMP AL,'A'
        JGE L27
        SUB AL,30H
        JMP L28
    L27: SUB AL,37H
    L28:
        SHL EBX,4
        ADD BL,AL
        LOOP AGAIN6
        MOV DATA2,EBX
        MOV EBX,0
        MOV EDX,0
        MOV EAX,0
        MOV EAX,DATA1
        MOV EBX,DATA2
        MUL EBX
        MOV PROD1,EDX
        MOV PROD2,EAX
        MOV AH,09
        MOV DX,OFFSET msg10
        INT 21H
        MOV EBX,PROD1
        MOV CX,8
    AGAIN7:
        ROL EBX,4
        MOV DL,BL
        AND DL,0FH ; to o/p the result
        CMP DL,9
        JBE L21; jump to the lebel
        ADD DL,37H
        MOV AH,02
        INT 21H
        JMP L22
    L21:
        ADD DL,30H
        MOV AH,02
        INT 21H
    L22:
        LOOP AGAIN7; goto to the lebel
        MOV EBX,PROD2
        MOV CX,8
    AGAIN8:
        ROL EBX,4
        MOV DL,BL
        AND DL,0FH ; to o/p the result
        CMP DL,9
        JBE L23
        ADD DL,37H
        MOV AH,02
        INT 21H
        JMP L24; jump to the lebel
    L23:
        ADD DL,30H
        MOV AH,02
        INT 21H
    L24:
        LOOP AGAIN8
        MOV AH,4CH
        INT 21H
    JMP ENDF ; JUMP TO ENDF LEVEL

division:
    MOV AH,09
    MOV DX,OFFSET msg1
    INT 21H
    MOV EBX,0
    MOV CX,8
    AGAIN9:
        MOV AH,01 ;1ST NO. ENTERED
        INT 21H
        CMP AL,'A'
        JGE L35
        JMP L36
    L35: SUB AL,37H
    L36:
        SUB AL,30H
        SHL EBX,4
        ADD BL,AL
        LOOP AGAIN9; goto to the lebel
        MOV DATA1,EBX
        MOV AH,09
        MOV DX,OFFSET msg2
        INT 21H
        MOV EBX,0
        MOV CX,8
    AGAIN10:
        MOV AH,01 ;2nd NO. ENTERED
        INT 21H
        CMP AL,'A'
        JGE L37
        SUB AL,30H
        JMP L38
    L37: SUB AL,37H
    L38:
        SHL EBX,4
        ADD BL,AL
        LOOP AGAIN10
        MOV DATA2,EBX
        MOV EBX,0
        MOV EDX,0
        MOV EAX,0
        MOV EAX,DATA1
        MOV EBX,DATA2
        DIV EBX
        MOV REM,EDX ;REM=REMAINDER
        MOV QUO,EAX ;QUO=QUOTIENT
        MOV AH,09
        MOV DX,OFFSET msg32
        INT 21H
        MOV EBX,REM
        MOV CX,8
    AGAIN11:
        ROL EBX,4
        MOV DL,BL
        AND DL,0FH ; to o/p the result in rem
        CMP DL,9
        JBE L31
        ADD DL,37H
        MOV AH,02
        INT 21H
        JMP L32; jump to the lebel
    L31:
        ADD DL,30H
        MOV AH,02
        INT 21H
    L32: LOOP AGAIN11
        MOV AH,09
        MOV DX,OFFSET msg33
        INT 21H
        MOV EBX,QUO
        MOV CX,8
    AGAIN12:
        ROL EBX,4
        MOV DL,BL
        AND DL,0FH ; to o/p the result in quo
        CMP DL,9
        JBE L33
        ADD DL,37H
        MOV AH,02
        INT 21H
        JMP L34; jump to the lebel
    L33:
        ADD DL,30H
        MOV AH,02
        INT 21H
    L34:
        LOOP AGAIN12; goto to the lebel
        MOV AH,4CH
        INT 21H
ENDF: .exit
end
