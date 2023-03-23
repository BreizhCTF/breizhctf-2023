AS       = nasm
AS_FLAGS = -f elf64

clear:
	rm -Rf bin

build:
	mkdir -p bin
	$(AS) $(AS_FLAGS) src/bootloader_s1.asm -o bin/bootloader_s1.elf
	$(AS) $(AS_FLAGS) src/bootloader_s2.asm -o bin/bootloader_s2.elf

.PHONY: build clear