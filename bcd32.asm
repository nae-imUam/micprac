.model small; contain two segment data and code
    .386;instruction for 80386
    .data;data segment start
    num1 DD 00000000H;initialize memory with double word
    num2 DD 00000000H;initialize memory with double word
    num3 DD 00000000H;initialize memory with double word
    msg1 db 10,13,"Enter the first no.:: $"
    msg2 db 10,13,"Enter the second no.:: $"
    msg3 db 10,13,"Press 1 to ADD.$"
    msg4 db 10,13,"Press 2 to subtract.$"
    msg5 db 10,13,"Enter your choice; $"
    msg6 db 10,13,"A + B = $"
    msg7 db 10,13,"A - B = $"
.code ; start of code segmen
.startup; Generates program start-up code
    MOV AH,09
    MOV DX,OFFSET msg1
    INT 21H; Output a string terminated by '$? stored in DX, as AH =9
    MOV EBX,0
    MOV CX,8
AGAIN: 
    MOV AH,01 ;1ST NO. ENTERED
    INT 21H;input from user
    CMP AL,'A'
    JGE L2
    SUB AL,30H
    SHL EBX,4
    ADD BL,AL
    LOOP AGAIN
    MOV num1,EBX

    MOV AH,09
    MOV DX,OFFSET msg2
    INT 21H; Output a string terminated by '$? stored in DX, as AH =9
    MOV EBX,0
    MOV CX,8
AGAIN1:
    MOV AH,01 ;2nd NO. ENTERED
    INT 21H;input from user
    CMP AL,'A'
    JGE L2
    SUB AL,30H
    SHL EBX,4
    ADD BL,AL
    LOOP AGAIN1
    MOV num2, EBX
    
mov ah,09
mov dx,offset msg3
int 21h; Output a string terminated by '$? stored in DX, as AH =9

mov ah,09
mov dx,offset msg4
int 21h; Output a string terminated by '$? stored in DX, as AH =9

mov ah,09
mov dx,offset msg5
int 21h; Output a string terminated by '$? stored in DX, as AH =9

mov ah,01
int 21h; input from user

sub al,30h

cmp al,01h
je addition;jump to label addition

cmp al,02h
je subtraction;jump to label subtraction


addition:
    mov ax, word ptr num1
    mov dx, word ptr num2
    add al,dl
    daa
    mov bl,al

    mov al,ah
    adc al,dh
    daa
    mov bh,al

    mov word ptr num3,bx

    mov ax, word ptr num1+2
    mov dx, word ptr num2+2
    adc al,dl
    daa
    mov bl,al

    mov al,ah
    adc al,dh
    daa
    mov bh,al

    mov word ptr num3+2,bx
    mov ebx,num3



    mov ah, 09h
    mov dx, offset msg2
    int 21h; Output a string terminated by '$? stored in DX, as AH =9
    jnc l6
    mov ah, 02h
    mov dl, "1"
    int 21h 
    
subtraction:
    mov ax, word ptr num1
    mov dx, word ptr num2
    sub al,dl
    daa
    mov bl,al

    mov al,ah
    sub al,dh
    daa
    mov bh,al

    mov word ptr num3,bx

    mov ax, word ptr num1+2
    mov dx, word ptr num2+2
    sub al,dl
    daa
    mov bl,al

    mov al,ah
    sub al,dh
    daa
    mov bh,al

    mov word ptr num3+2,bx
    mov ebx,num3



    mov ah, 09h
    mov dx, offset msg2
    int 21h; Output a string terminated by '$? stored in DX, as AH =9
    jnc l6
    mov ah, 02h
    mov dl, "1"
    int 21h 
    
l6: MOV CX,8

AGAIN2: 
    ROL EBX,4
    MOV DL,BL
    AND DL,0FH
    ADD DL,30H
    MOV AH,02
    INT 21H
    LOOP AGAIN2;go to label again2
L2: .EXIT
END