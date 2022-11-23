.model small
 .stack 100h
 .data
.code
 
        mov ah, 02h      ; DOS function call 2, character output
 mov dl, 0Ah       ; the character 041h (i.e.'A')
 sub dl, 37h
        mov cx, 26              ; start the counter at 26 in cx
again: int 21h          ; print character
 inc dl           ; the next character into dl
 loop again           ; subtract 1 from cx, if not zero jump back to again
finish:       mov ax, 4C00h  ; Terminate program
               int 21h   ; correctly
 
end