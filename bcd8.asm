.model small

.data

 msg1 db 10,13,"Enter first no.$"
 msg2 db 10,13,"Enter second no.$"
 msg3 db 10,13,"Subtraction is:$"

 .code

  mov ax,@data
  mov ds,ax

  lea dx,msg1
  mov ah,09H
  int 21H

  mov ah,01H
  int 21H

  sub al,30H
  cmp al,09H
  JBE L1
  sub al,07H

 L1: mov cl,04H
     ROL al,cl
     mov bl,al  ; storing first digit in bl

     mov ah,01H
     int 21H

     sub al,30H
     cmp al,09H
     JBE L2
     sub al,07H
  L2:ADD bl,al  ;storing second digit in al and whole number in bl

  lea dx,msg2
  mov ah,09H
  int 21H

  mov ah,01H
  int 21H

   sub al,30H
   cmp al,09H
   JBE L3
   sub al,07H
 L3: mov cl,04H
     ROL al,cl
     mov bh,al

     mov ah,01H
     int 21H

     sub al,30H
     cmp al,09H
     JBE L4
     sub al,07H
  L4:ADD bh,al ; second no is in bl

mov al,bl
cmp al,bh
jb less
SBB bl,bh 
mov al,bl
das
MOV BL, AL
    lea dx,msg3
    mov ah,09H
    int 21H
jmp l5

less:Sub bh,bl 
mov al,bh
das
MOV BL, AL


    lea dx,msg3
    mov ah,09H
    int 21H
mov ah, 02h
mov dl, "-"
int 21h 




l5: MOV Dl,00

MOV Cl,2
AGAIN2: ROL BL,4
MOV DL,BL
AND DL,0FH
ADD DL,30H
MOV AH,02
INT 21H
LOOP AGAIN2

    mov ah,4ch
    int 21H
    end

