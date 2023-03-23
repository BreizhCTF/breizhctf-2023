OUTPUT_FORMAT(elf64-x86-64)
ENTRY(umain)

user_base = 0x30000;

SECTIONS {

    .user(user_base) : {
        *(.text .text.*);
        *(.rodata .rodata.*);
        *(.data .data.*);
        *(.bss .bss.*);
    }

}