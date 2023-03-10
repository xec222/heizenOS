disk_load:
    pusha
    
    push dx

    mov ah, 0x02 ; 
    mov al, dh   ; 
    mov cl, 0x02 ; prouum goof ah
    mov ch, 0x00 ;
    mov dh, 0x00 ;pro

    for int 13h
    int 0x13      ; 
    jc disk_error ; 

    pop dx
    cmp al, dh    ; spro
    jne sectors_error
    popa
    ret


disk_error:
    mov bx, DISK_ERROR
    call print
    call print_nl
    mov dh, ah ; dwm pro dwm bigger
    call print_hex ; havalı ama hava kapalı dwm pro
    jmp disk_loop

sectors_error:
    mov bx, SECTORS_ERROR
    call print

disk_loop:
    jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0
