BITS 16    ; 16-bit real-mode instructions
ORG 0x7C00 ; Expect the bootloader to be loaded into memory at 0x7C00

STACK:
	; Set up a 1K stack after this bootloader
    	MOV AX, 0x7C00 ; Set AX equal to the location of xBoot
    	ADD AX, 0x20   ; Skip over the size of the bootloader divided by 16
	MOV SS, AX     ; Set Stack Segment (SS) to this location
	MOV SP, 0x400  ; Set SS:SP at the top of our 1K stack

BOOT:  
	MOV SI, BOOTMSG ; Set the address of the null-terminated string message to the SI register
	MOV AH, 0x0E    ; Output characters in TTY mode

LOOP:
	LODSB     ; Load byte at address DS:SI into AL
	OR AL, AL ; Trigger Zero Flag (ZF) if result is zero
	JZ HALT   ; Jump to HALT since ZF is set
	INT 0x10  ; Run BIOS interrupt vector and print the character
	JMP LOOP  ; Repeat for the next character

HALT:
	CLI ; Clear the interrupt flag
	HLT ; Halt the execution

BOOTMSG: DB "Hello, I am xBoot", 0 ; The message we want to display

TIMES 510 - ($-$$) DB 0 ; Pad the remaining 510-bytes with zeros
DW 0xAA55               ; Boot signature
	
	
	
	
