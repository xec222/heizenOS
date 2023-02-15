print_hex:
    pusha

    mov cx, 0 ; our index variable


hex_loop:
    cmp cx, 4 ; loop 4 times
    je end
    
    ; dx i asciiye çevirme wednesday OMG
    mov ax, dx 
    and ax, 0x000f 
    add al, 0x30
    cmp al, 0x39 
    jle step2
    add al, 7 ; 'A' is ASCII 65 instead of 58, so 65-58=7

step2:
    mov bx, HEX_OUT + 5 ; base + length
    sub bx, cx  
    mov [bx], al  
    ror dx, 4 ; 0x1234 -> 0x4123 -> 0x3412 -> 0x2341 -> 0x1234


    add cx, 1
    jmp hex_loop

end:
    mov bx, HEX_OUT
    call print

    popa
    ret

HEX_OUT:
    db '0x0000',0 ; reserve memory for our new string

