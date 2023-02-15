bits 16]
switch_to_pm:
    cli ; 1. disable interrupts
    lgdt [gdt_descriptor] 
    mov eax, cr0
    or eax, 0x1 ; im pro
    mov cr0, eax
    jmp CODE_SEG:init_pm ; dinitctl

[bits 32]
init_pm: 
    mov ax, DATA_SEG ; my helloworldos
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x90000 ; vednesday is so pro
    mov esp, ebp

    call BEGIN_PM ; c pros are lookin u but u im wednesday

