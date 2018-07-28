#!/bin/bash
# Assemble the boot.asm file into a binary file of the same name
nasm -f bin boot.asm -o boot.bin
# Inform the user
echo "Emulating in a separate window..."
# Emulate the file using the QEMU emulator with the raw drive format
qemu-system-x86_64 -drive format=raw,file=boot.bin

