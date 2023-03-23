#include "la_key_dans_la_stone.h"


int main(void) {
    ks_engine *ks;
    ks_err err;
    size_t count;
    unsigned char *shellcode;
    size_t size;
    const char *asm_buffer = "push    rbp\n        mov     rbp, rsp  \n        sub     rsp, 0x20\n        mov     rax, 0\n        mov     rdi, 0\n        mov     rsi, rsp\n        mov     rdx, 0x19\n        syscall\n        mov     rcx, rax\n        cmp     rax, 0x19\n        jnz     _end\n        mov     rsi ,rsp\n        mov     rdi, 0\n        mov     al, byte [rsi + rdi]\n        cmp     al, 0x42 \n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        cmp     al, 0x5a\n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        xor     al, 0x78\n        cmp     al, 0x30\n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        sub     al, 0x30\n        cmp     al, 0x13\n        jnz     _end\n        inc     rdi \n        mov     al, byte [rsi + rdi]\n        add     al, 0x30\n        cmp     al, 0x84\n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        xchg    al, al \n        cmp     al, 0x46 \n        jnz     _end \n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        cmp     al, 0x7b\n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        xor     al, 0x60\n        cmp     al, 0x36 \n        jnz     _end \n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        add     al, 0x40\n        cmp     al, 0x70\n        jnz     _end \n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        sub     al, 0x44\n        cmp     al, 0x31 \n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        cmp     al, 0x35 \n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        cmp     al, 0x5f \n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        xchg    al, al \n        cmp     al, 0x34  \n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        cmp     al, 0x76\n        jnz     _end\n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        sub     al, 0x33\n        cmp     al, 0 \n        jnz     _end \n        inc     rdi\n        mov     al, byte [rsi + rdi]\n        add     al, 2 \n        cmp     al, 0x7c\n        jnz     _end\n        add     rdi, 2 \n        mov     al, byte [rsi + rdi]\n        xchg    al, al \n        cmp     al, 0x31\n        jnz     _end\n        dec     rdi\n        mov     al, byte [rsi + rdi]\n        cmp     al, 0x5f\n        jnz     _end\n        add     rdi, 2 \n        mov     al, byte [rsi + rdi]\n        sub     al, 0x33\n        cmp     al, 1 \n        jnz     _end\n        mov     al, byte [rsi + rdi + 3]\n        cmp     al, 0x31\n        jnz     _end \n        mov     al, byte [rsi + rdi + 2]\n        add     al, 1 \n        cmp     al, 0x64\n        jnz     _end\n        mov     al, byte [rsi + rdi  + 1]\n        cmp     al, 0x5f \n        jnz     _end\n        add     rdi, 0x4 \n        mov     al, byte [rsi + rdi]\n        cmp     al, 0x65 \n        jnz     _end \n        mov     al, byte [rsi + rdi + 1]\n        sub     al, 0x19 \n        cmp     al, 0x64\n        jnz     _end\n        mov     rax, 1\n        mov     rdi, 1 \n        mov     rdx, rcx\n        syscall \n        add     rsp, 0x20\n        pop     rbp\n        xor     rax, rax\n        ret \n\n_end: \n        add     rsp, 0x20\n        pop     rbp\n        mov     rax, 1\n        ret   \n";
    int win = 1;

    err = ks_open(KS_ARCH_X86, KS_MODE_64, &ks);
    if (err != KS_ERR_OK) {
        printf("ERROR: failed on ks_open(), quit\n");
        return -1;
    }
    // change syntax option to nasm 
    ks_option(ks, KS_OPT_SYNTAX, KS_OPT_SYNTAX_NASM);

    int result  = 0;
    if ((result = ks_asm(ks, asm_buffer, 0, &shellcode, &size, &count)) != KS_ERR_OK) {
        printf("ERROR: ks_asm() failed & count = %lu, error = %u\n",
            count, ks_errno(ks));
    }

    void *shellcode_mem = mmap(0, size, PROT_READ|PROT_WRITE, MAP_SHARED|MAP_ANONYMOUS, -1, 0);
    memcpy(shellcode_mem, shellcode, size);
    mprotect(shellcode_mem, size, PROT_READ|PROT_WRITE|PROT_EXEC);

    int (*func)();                      // function pointer
    func = (int (*)()) shellcode_mem;   // func points to our shellcode
    win = (int)(*func)();               // call func pointer

    if(munmap(shellcode_mem, size) == -1) {
        printf("Unmap failed \n");
    }
    if (!win) {
        printf("Bien joué tu as le flag du chall !\n");
    } else {
        printf("Encore un petit d'effort !\n");
    }

    // NOTE: free encode after usage to avoid leaking memory
    ks_free(shellcode);

    // close Keystone instance when done
    ks_close(ks);
    return 0;
}
