OUTPUT_FORMAT(elf64-x86-64)
ENTRY(kmain)

kernel_base = 0x10000;

SECTIONS {

    .kernel(kernel_base) : {
        *(.text .text.*);
        *(.rodata .rodata.*);
        *(.data .data.*);
        *(.bss .bss.*);
    }

}