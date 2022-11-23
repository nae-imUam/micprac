.model small

.data

 ;msg1 Dw 10,13,"Enter $"
 msg2 dw 20


 MOV DX, msg2
 MOV AX, OFFSET DX

 mov ah,4ch
    int 21H
    end