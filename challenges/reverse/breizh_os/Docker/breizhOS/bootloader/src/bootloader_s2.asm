bits 32

section .to_long_mode
    global to_long_mode

    to_long_mode:
        mov eax, p4_table
        mov cr3, eax

        mov eax, cr4
        or eax, 1 << 5
        mov cr4, eax

        mov ecx, 0xC0000080
        rdmsr
        or eax, 1 << 8
        wrmsr

        mov eax, cr0
        or eax, 1 << 31
        mov cr0, eax

        cli
        lgdt [gdt64.pointer]

        jmp	gdt64.cs:long_mode

bits 64

section .long_mode
    extern stack, kmain
    global long_mode

    long_mode:
        mov ax, gdt64.ds 
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov ss, ax

        mov rbp, stack
        mov rsp, stack

        mov rdi, rand
        call kmain

        .foo:
            hlt
            jmp .foo

    gdt64:                   
        .null: equ $ - gdt64 
            dq 0
        .cs: equ $ - gdt64 
            dw 0
            dw 0
            db 0
            db 10011010b
            db 10101111b
            db 0
        .ds: equ $ - gdt64 
            dw 0
            dw 0
            db 0
            db 10010010b
            db 00000000b
            db 0
        .pointer:
            dw $ - gdt64 - 1
            dq gdt64

section .page_tables
    align 4096

    p4_table:
        dq p3_table + 7
        times 0x1000-8 db 0

    p3_table:
        dq p2_table + 7
        times 0x1000-8 db 0

    p2_table:
        dq p1_table + 7
        times 0x1000-8 db 0

    p1_table:
        %assign i 0
        %rep 512
            %if i < 0x30000
                dq i + 3
            %else
                dq i + 7
            %endif
            %assign i i+0x1000
        %endrep

rand:
    db 0x51, 0x48, 0xC7, 0xC1, 0x10, 0x00, 0x00, 0x00, 0x66, 0x31, 0xC0, 0x66, 0x03, 0x81, 0x02, 0x7E, 0x00, 0x00, 0xE2, 0xF7, 0x59, 0xC3 