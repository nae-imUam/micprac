.model small
.386
.stack 100h
.data
dt1 dw 0000h
d2 dw 0000h
msg1 db 10,13,"Enter a 4 digit number(A): $"
msg2 db 10,13,"Enter another 4 digit number(B): $"
msg3 db 10,13,"Press 1 to ADD.$"
msg4 db 10,13,"Press 2 to subtract.$"
msg5 db 10,13,"Enter your choice; $"
msg6 db 10,13,"A + B = $"
msg7 db 10,13,"A - B = $"
.code
.startup


mov bx,0000h
mov ax,0000h

;prnting 1st print msg

mov ah,09
mov dx,offset msg1
int 21h

;taking 1st 4 digit input
    mov cx,4 
    lst: mov ah,01
    int 21h

    cmp al,'A'
    jge dig4
    sub al,30h
    jmp cont
    dig4: sub al,37h
    cont: shl bx,4
    mov ah,00
    add bx,ax
    loop lst

mov dt1,bx
mov ax,0000h
mov bx,0000h

;printing 2nd print line
mov ah,09
mov dx,offset msg2
int 21h

;taking 2nd 4 digit input

    mov cx,4
    lst2: mov ah,01
    int 21h

    cmp al,'A'
    jge di4
    sub al,30h
    jmp con
    di4: sub al,37h
    con: shl bx,4
    mov ah,00
    add bx,ax
    loop lst2
 
    mov d2,bx 
    
mov ah,09
mov dx,offset msg3
int 21h

mov ah,09
mov dx,offset msg4
int 21h

mov ah,09
mov dx,offset msg5
int 21h

mov ah,01
int 21h

sub al,30h
;mov bx,0000h
;mov bx,d2

cmp al,01h
je additon

    mov ah,09
    mov dx,offset msg7
    int 21h


   cmp bx,dt1
   ja sml
        
        xchg bx, dt1   ;NOTE dt1 is first number entered
        sub bx,dt1     ;NOTE bx contaims second number entered 
        jmp bahir

        sml: mov ah,02h
        mov dl,'-'
        int 21h
        sub bx,dt1
        jmp bahir    
    
    additon: mov ah,09
    mov dx,offset msg6
         int 21h
          
          add bx,dt1
          ;cmp bx,09
          ;jg more10
          ;add bx,30h
          ;jmp ex
         ;more10: add bx,37h
    ;ex: jmp bahir
          
bahir: mov dx,0000h
mov cx,4
last: rol bx,4
mov dx,bx
and dx,000FH
cmp dx,09
jg fadd37
add dx,30h
jmp exar
fadd37: add dx,37h
exar:mov ah,02
int 21h
loop last

mov ah,4ch
int 21h

.exit
end



