OUTPUT_FORMAT(binary)
ENTRY(to_protected_mode)

kernel_base = 0x10000;
user_base   = 0x30000;

SECTIONS {

    .stage_1(0x7c00) : {
        *(.real_mode);
        *(.protected_mode);
        . = 0x1fe;
        SHORT(0xaa55)
    }

    . = 0x7e00;
    to_long_mode = .;

    .stage_2(0x7e00) : {
        *(.to_long_mode);
        *(.long_mode);
        *(.page_tables);
    }

    .kernel(kernel_base) : {
        *(.kernel)

        stack_end = .;
        .         = . + 4096;
        stack     = .;
    }

    .user(user_base) : {
        *(.user)
    }

}