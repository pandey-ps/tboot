bits 16
org 0x7C00

start:
    cli
    xor ax, ax
    mov ds, ax
    mov ss, ax
    mov sp, 0x7C00
    sti

    mov ah, 0x07
    mov al, 0x00
    mov bh, 0x07
    mov cx, 0x00
    mov dx, 0x184F
    int 0x10

    mov si, msg
print:
    lodsb
    or al, al
    jz halt
    mov ah, 0x0E
    mov bx, 0x0007
    int 0x10
    jmp print

halt:
    cli
    hlt
    jmp halt

msg: db "hello from the boot sector :)", 0

times 510-($-$$) db 0
dw 0xAA55
