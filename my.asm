.model small

.DATA
var1 DB 10,"enter first numbers  $"
var2 DB 10,"ENTER SECOND NUMBER  $"
VAR3 DB 10,"SUM IS : $"
.code

.STARTUP
   
    mov ax,@DATA
    mov DS,AX
    mov AH,09H
    ;mov DX,offset var1
    LEA DX,VAR1
    int 21H
   
    MOV AH,1H      ;taking first input
    INT 21H
    MOV BL,AL       ;bl=first no
    SUB BL,30H
   
    LEA DX,VAR2
    MOV AH,09H  
    INT 21H
   
    MOV AH,1H       ;taking second input
    INT 21H
    SUB AL,30H
   
    LEA DX,VAR3
    MOV AH,09H
    INT 21H
   
    ADD AL,BL       ;adding
    mov ah,00h       ;clear ah
    aaa         ;adjusts the digit after addition in unpacked bcd form
    add ax,3030h
   
    mov bx,ax
   
    mov dl,bh
    mov ah,02h
    int 21h
   
    mov dl,bl
    mov ah,02h
    int 21h
   
.exit
end