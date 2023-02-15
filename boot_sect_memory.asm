mov ah, 0x0e

; attempt 1
; Fails because it tries to print the memory address (i.e. pointer)
; not its actual contents
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; attempt 2
; It tries to print the memory address of 'the_secret' which is the correct approach.
; However, BIOS places our bootsector binary at address 0x7c00
; so we need to add that padding beforehand. We'll do that in attempt 3
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

; deeneme3
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

; 4.deneme
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10


jmp $ ; infinite loop

the_secret:
    ; ASCII code 0x58 ('X') is stored just before the zero-padding.
    ; On this code that is at byte 0x2d (use xxd lol xxd produr wednesday bin')
    db "X"

; bios sayıcıkları
times 510-($-$$) db 0
dw 0xaa55
