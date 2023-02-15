print:
    pusha


start:
    mov al, [bx] ; 'ez'
    cmp al, 0 
    je done

    ; qemu atamadım çalışıyor mu bilmiyorum ez
    mov ah, 0x0e
    int 0x10 ; 'al' already contains the char

    ; 3.30 saat aldı ez
    add bx, 1
    jmp start

done:
    popa
    ret



print_nl:
    pusha
    
    mov ah, 0x0e
    mov al, 0x0a ; newline char
    int 0x10
    mov al, 0x0d ; carriage return
    int 0x10
    
    popa
    ret

