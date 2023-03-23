          global    _start

          section   .text
_start:   
        push    rbp
        mov     rbp, rsp  
        sub     rsp, 0x20
        mov     rax, 0
        mov     rdi, 0
        mov     rsi, rsp
        mov     rdx, 0x19
        syscall
        mov     rcx, rax
        cmp     rax, 0x19
        jnz     _end
        mov     rsi ,rsp
        mov     rdi, 0
        mov     al, byte [rsi + rdi]
        cmp     al, 0x42 
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        cmp     al, 0x5a
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        xor     al, 0x78
        cmp     al, 0x30
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        sub     al, 0x30
        cmp     al, 0x13
        jnz     _end
        inc     rdi 
        mov     al, byte [rsi + rdi]
        add     al, 0x30
        cmp     al, 0x84
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        xchg    al, al 
        cmp     al, 0x46 
        jnz     _end 
        inc     rdi
        mov     al, byte [rsi + rdi]
        cmp     al, 0x7b
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        xor     al, 0x60
        cmp     al, 0x36 
        jnz     _end 
        inc     rdi
        mov     al, byte [rsi + rdi]
        add     al, 0x40
        cmp     al, 0x70
        jnz     _end 
        inc     rdi
        mov     al, byte [rsi + rdi]
        sub     al, 0x44
        cmp     al, 0x31 
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        cmp     al, 0x35 
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        cmp     al, 0x5f 
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        xchg    al, al 
        cmp     al, 0x34  
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        cmp     al, 0x76
        jnz     _end
        inc     rdi
        mov     al, byte [rsi + rdi]
        sub     al, 0x33
        cmp     al, 0 
        jnz     _end 
        inc     rdi
        mov     al, byte [rsi + rdi]
        add     al, 2 
        cmp     al, 0x7c
        jnz     _end
        add     rdi, 2 
        mov     al, byte [rsi + rdi]
        xchg    al, al 
        cmp     al, 0x31
        jnz     _end
        dec     rdi
        mov     al, byte [rsi + rdi]
        cmp     al, 0x5f
        jnz     _end
        add     rdi, 2 
        mov     al, byte [rsi + rdi]
        sub     al, 0x33
        cmp     al, 1 
        jnz     _end
        mov     al, byte [rsi + rdi + 3]
        cmp     al, 0x31
        jnz     _end 
        mov     al, byte [rsi + rdi + 2]
        add     al, 1 
        cmp     al, 0x64
        jnz     _end
        mov     al, byte [rsi + rdi  + 1]
        cmp     al, 0x5f 
        jnz     _end
        add     rdi, 0x4 
        mov     al, byte [rsi + rdi]
        cmp     al, 0x65 
        jnz     _end 
        mov     al, byte [rsi + rdi + 1]
        sub     al, 0x19 
        cmp     al, 0x64
        jnz     _end
        mov     rax, 1
        mov     rdi, 1 
        mov     rdx, rcx
        syscall 
        add     rsp, 0x20
        pop     rbp
        xor     rax, rax
        ret 

_end: 
        add     rsp, 0x20
        pop     rbp
        mov     rax, 1
        ret   

        ;ret for shellcode 
        ;syscall for bin

;          section   .data
;flag:  db        "BZHCTF{V0u5_4v3z_14_c1e}", 24
