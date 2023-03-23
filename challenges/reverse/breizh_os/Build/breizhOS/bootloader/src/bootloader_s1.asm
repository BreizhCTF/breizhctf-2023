extern to_long_mode

bits 16

section .real_mode
    global to_protected_mode

    to_protected_mode:
        in al, 0x93
        or al, 2
        and al, ~1
        out 0x92, al

        xor	ax, ax
        mov	es, ax
        mov ds, ax
        mov ss, ax

        int 0x13
        
        .load:
            cmp word [dap.buffer_segment], 0x7e0
            jl .load_end

            mov ah, 0x42
            mov si, dap
            int 0x13

            add dword [dap.offset_from_beg], 0x20
            add word [dap.buffer_segment], 0x400

            jmp .load
        .load_end:

        cli
        lgdt [gdt32.pointer]

        mov	eax, cr0
        or	eax, 1
        mov	cr0, eax

        jmp	gdt32.cs:protected_mode

dap:
    db 0x10
    db 0x00
    .nbr_sectors:
        dw 0x20
    .buffer_offset:
        dw 0x00
    .buffer_segment:
        dw 0x07e0
    .offset_from_beg:
        dq 1

bits 32

section .protected_mode
    global protected_mode

    protected_mode:
        mov ax, gdt32.ds
        mov ds, ax
        mov es, ax
        mov fs, ax
        mov gs, ax
        mov ss, ax

        xor ebp, ebp
        xor esp, esp

        jmp gdt32.cs:to_long_mode

    gdt32:
        .null: equ $ - gdt32
            dq 0
        .cs: equ $ - gdt32
            dw 0xffff
            dw 0x0
            db 0x0
            db 10011010b
            db 11001111b
            db 0x0
        .ds: equ $ - gdt32
            dw 0xffff
            dw 0x0 
            db 0x0 
            db 10010010b
            db 11001111b
            db 0x0 
        .pointer:
            dw $ - gdt32 - 1
            dd gdt32