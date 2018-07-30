BITS 16    ; 16-bit real-mode instructions
ORG 7C00H  ; Expect the bootloader to be loaded into memory at 0x7C00

STACK:  MOV AX, 7C0H  ; Set AX equal to the location of xBoot
    	ADD AX, 20H   ; Skip over the size of the bootloader divided by 16
	MOV SS, AX    ; Set Stack Segment (SS) to this location
	MOV SP, 400H  ; Set SS:SP at the top of our 1K stack

BOOT:	MOV SI, BOOTMSG ; Set the address of the null-terminated string message to the SI register
	MOV AH, 0EH     ; Output characters in TTY mode

LOOP:	LODSB     ; Load byte at address DS:SI into AL and increment SI
	OR AL, AL ; Trigger Zero Flag (ZF) if result is zero
	JZ HALT   ; Jump to HALT if ZF is set
	INT 10H   ; Run BIOS interrupt vector and print the character
	JMP LOOP  ; Repeat for the next character

HALT:	CLI ; Clear the interrupt flag
	HLT ; Halt the execution

BOOTMSG: DB 0AH, "Hello, I am xBoot", 0 ; Display the message on a new line

TIMES 510 - ($-$$) DB 0 ; Pad the remaining 510-bytes with zeros
DW 0xAA55               ; Boot signature
