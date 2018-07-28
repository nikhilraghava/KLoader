BITS 16    ; Tell NASM this is 16 bit code
ORG 0x7C00 ; Tell NASM to output at offset 0x7C00

BOOT:
    MOV SI, HELLO ; Point SI register to hello label memory location
    MOV AH, 0x0E  ; 0x0E means write character in TTY mode

LOOP:
    LODSB     ; Load byte at address DS:SI into AL
    OR AL, AL ; Perform logical OR on the AL register
    JZ HALT   ; If AL is zero, jump to HALT
    INT 0x10  ; Runs BIOS interrupt 0x10 - video services
    JMP LOOP  ; Jump and loop again

HALT:
    CLI ; Clear interrupt flag
    HLT ; Halt execution

HELLO: DB 0x0A, "Hello World! Booted from xBoot", 0

TIMES 510 - ($-$$) DB 0 ; Pad remaining 510 bytes with zeroes
DW 0xAA55               ; Magic bootloader magic - marks this 512 byte sector bootable!
