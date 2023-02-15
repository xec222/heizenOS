mov ah, 0x0e ; tty mode lol tty1 im hecker

mov bp, 0x8000 ; 
mov sp, bp ;

push 'A'
push 'B'
push 'C'

[0x7ffe] ; 0x8000 - 2
int 0x10

[0x8000]
int 0x10


; recover 
pop bx
mov al, bl
int 0x10 ; prints C

pop bx
mov al, bl
int 0x10 ; prints B

pop bx
mov al, bl
int 0x10 ; prints A

; yess im pro
mov al, [0x8000]
int 0x10


jmp $
times 510-($-$$) db 0
dw 0xaa55

