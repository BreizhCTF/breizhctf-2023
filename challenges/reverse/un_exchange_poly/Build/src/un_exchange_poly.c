#include "un_exchange_poly.h"
/*
 * CHAR 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
 */

void template_func(char *user_entry, int *valid_part) {
    // mini code cave
    __asm__ __volatile__("nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;nop;");
    
    return;
}

// CHECK char : 5 => 'F' ;1 => 'Z'; 26 => '}' 
void part_1_debug(char *user_entry, int *valid_part) {
    int8_t ptrace_1 = 0;
    int8_t ptrace_2 = 0;
    const char* is_preload = getenv("LD_PRELOAD");
    const char* is_lib = getenv("LD_LIBRARY_PATH");
    if(is_preload || is_lib)
        goto char_26;

    if ((ptrace_1 = ptrace(PTRACE_TRACEME, 0, 0, 0)) < 0)
        ptrace_1 *= 44; 

    if (user_entry[5] == ptrace_1 + 70)
        (*valid_part)++;
    
    if ((ptrace_2 = ptrace(PTRACE_TRACEME, 0, 0, 0)) == 0)
        goto char_26;

    if(user_entry[1] == ('H' ^ 0x12 + ptrace_1))
        (*valid_part)++;

    char_26:  
    if (*(user_entry + -ptrace_2 * 26) == ptrace_1 + -ptrace_2 * 0x7d) {
        (*valid_part)++;
    }  
    __asm__ __volatile__("nop; pop rsi; pop rdi;");
}
// 19 = '3'; 12 = '3'; 14 = '3'
void part_1_disass(char *user_entry, int *valid_part) {
    //overlap using call / other jump 
    __asm__ __volatile__("sub rsp, 0x10;");
    __asm__ __volatile__ (
        "movabs rax, 0x23eb90123413478a;" // char 19 => '3'
        "jmp $-8;"
        // junk 
        "push   rsp;"                     
        "pop    rsp;"
        "rol    DWORD PTR [rbp-0x2893043f],0x0;"
        "fst    QWORD PTR [rsi-0x2a];"
        "add    al,0xfb;"
        "lahf;"
        "shr    BYTE PTR [rax-0x2a504767],0xe9;"
        "add    cl,BYTE PTR [rdi+0x714ae8c1];"
        "frstor [rsi];"
        "push   rdi;"
        "cli;"
        // end
        "push 0x19eb213c;"
        // junk 
        "ror    BYTE PTR [rsi-0x27b3a065],0x92;"
        "ja     0xffffffffffffffbb;"
        "fnop;"
        "fs pop rsi;"
        "ja     0xffffffffffffffde;"
        ".byte 0xba;" 
        // end 
        "push 0x0eeb1e75;" // jne
        //junk 24 
        "shl    DWORD PTR [rax],1;"
        "mov    esi,0x7740bc04;"
        "sub    eax,0x89e6422e;" 
        //end
        "add rax, 0x0aeb06fe;" //inc
        // junk 16 
        "sahf;"
        "mov    esi,0x9f98181b;"
        "fidivr WORD PTR [rbx];" 
        //end
        "movabs rax, 0x1eeb9033340c478a;" // char 12 => '3' 
        // junk 24
        "jns    0xffffffffffffffb3;"
        "not    esi;"
        "mov    edi,0x30ab7f61;"
        "xchg   BYTE PTR fs:[rsi-0x54eda4c1],bh;"
        "and    BYTE PTR [rbx+0x7f],dl;"
        "sub    al,bl;"
        "shr    DWORD PTR [rsi+0x69],1;" 
        // end
        "sub rax, 0x05eb003c;"
        // junk 4
        "push   0x6;"
        "pop    rsi;"
        "pop rsi;" 
        // end
        "push 0x0eeb1875;"
        // junk 8 
        "and    eax,0x3826b2b;"
        "jl     0x1e;"
        "cmps   BYTE PTR ds:[rsi],BYTE PTR es:[rdi];"
        // end
        "add rax, 0x04eb06fe;" //inc
        // junk 2
        "ret;"
        "cmc;"
        // end
        "movabs rax, 0x09eb9018340e478a;" // char 14 => '3'
        // junk 6
        "xor    eax,0x1a57e306;"
        "fs;" 
        // end
        "sbb    DWORD PTR [rbx+rdi*1+0x11eb1834],edx;" // skip 2
        // junk 14
        "call   FWORD PTR [rip+0x3a817b51];"
        "in     eax,0xfe;"
        "call   0x5dc55630;"
        "int 3;"
        // end
        "adc    al,BYTE PTR [rdx+rdi*1+0x03eb333C];" // skip 3
        // junk 2
        "pop    rdx;"
        "int 3;"
        // end
        "push 0x06eb1575;" // jne
        // junk 4
        "cmps   BYTE PTR ds:[rsi],BYTE PTR es:[rdi];"
        "int    0x74;"
        "sti;"
        // end
        "add rax, 0x08eb06fe;" //inc
        // junk 8
        "xchg   ebx,eax;"
        "fistp  DWORD PTR [rax+rbx*2+0x7e8b8e01];"
        // end
        "xor rax, rax;"
    );
    __asm__ __volatile__("nop; pop rsi; pop rdi;");
}

// CHAR 13 => t;  15 => 5;  20 => s 
void part_1_specific_asm(char *user_entry, int *valid_part) {
    __asm__ __volatile__(
        "sub rsp, 0x10;"
        "xor rcx, rcx;"
        "mov cl, byte ptr [rdi + 20];"
        "sub cl, 0x6b;"
        "xor rax, rax;"
        "xor rdx, rdx;"
        "mov dl, 1;" // param 1
        "mov al, 0;" // param 2 
        "fibo:;"
        "xadd rax,rdx;"
        "loop fibo;"
        "cmp al, 21;"
        "jne fail_1_1_3;"
        "inc byte ptr [rsi];"
        "fail_1_1_3:;"
        "sub al, 8;"
        "mov al, byte ptr [rdi + rax];"
        "sub al, 0x6c;"
        "mov cl, al;"
        "dec cl;"
        "facto:;"
        "mul ecx;"
        "loop facto;"
        "cmp eax, 0x9d80;"
        "jne fail_2_1_3;"
        "inc byte ptr [rsi];"
        "fail_2_1_3:;"
        "xor rax, rax;"
        "mov al, byte ptr [rdi + 15];"
        "sub al, 4;"
        "push rax;"
        "fild qword ptr [rsp];"
        "fsqrt;" 
        "fistp qword ptr [rsp];"
        "pop rax;"
        "cmp al, 0x7;"
        "jne fail_3_1_3;"
        "inc byte ptr [rsi];"
        "fail_3_1_3:"
        "pop rsi;"
        "pop rdi;"
    );
}

void part_1_end() {
    printf("Humm c'est quoi ce truc ?\n");

}

// CHAR 0 = 'B'; 2 = 'H'; 3 = 'C'
void part_2_debug(char *user_entry, int *valid_part) {
    // modify syscall on the fly with the set reg 
    // other ptrace trics but only with syscall to prevent preload 
   __asm__ __volatile__ (
        "sub rsp, 0x10;");
  
    double elapsed_time;
    pid_t child_pid = fork();
    if (child_pid < 0) {
        return;
    }
    if (child_pid == 0) {
        clockid_t clockid; 
        timer_t timerid;
        struct itimerspec timerval;
        unsigned long long start_time, end_time;
        int result; 
        syscall(SYS_PTRACE, PTRACE_TRACEME, 0, 0, 0);
        raise(SIGCONT);
        result = syscall(WRONG_SYS_TIME_CRE, NULL, CLOCK_REALTIME, &timerid); // useless ! 
        if (result == -1) {
            exit(0);
        }

        timerval.it_interval.tv_sec = 0;
        timerval.it_interval.tv_nsec = 0;
        timerval.it_value.tv_sec = 1;
        timerval.it_value.tv_nsec = 0;
        syscall(WRONG_SYS_TIME_SET, NULL, 0, &timerval, timerid); // uselss ! 
        syscall(WRONG_SYS_TIME_GET, &timerval.it_value, CLOCK_REALTIME); 
        start_time = timerval.it_value.tv_nsec; 
        int z = 1,  y = 1, x = 1;
        for(int i = 0; i < 10000; i++) {
            if(user_entry[y + 1] == 'H')
                *valid_part = 1;
            z += y + x;
        }
        syscall(WRONG_SYS_TIME_GET, &timerval.it_value, CLOCK_REALTIME); 
        end_time = timerval.it_value.tv_nsec;
        elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
        if(elapsed_time > 0.2) {
            exit(0);
        }
        z = (int)(z * elapsed_time) % 27;
        if (z & 1) { // odd case
            z = (z - 1) % 2 + 3;
        } else {
            z = (z % 2) + 3;
        }
        if (user_entry[z] == 'C') {
            (*valid_part)++;
        }
        exit(*valid_part);
    } else {
        int status;
        syscall(SYS_WAIT4, child_pid, &status, 0);
        if (!WIFSTOPPED(status)) {
            printf("Meh non\n");
            return;
        }
        syscall(SYS_PTRACE, PTRACE_SETOPTIONS, child_pid, 0, PTRACE_O_EXITKILL);
        struct user_regs_struct regs;
        while (WIFSTOPPED(status)) {
            syscall(SYS_PTRACE, PTRACE_SYSCALL, child_pid, 0, 0);
            waitpid(child_pid, &status, 0);
            syscall(SYS_PTRACE, PTRACE_GETREGS, child_pid, 0, &regs);
            if (regs.orig_rax == WRONG_SYS_TIME_CRE) {
                regs.orig_rax = SYS_TIME_CRE;
                unsigned long long int orig_rdi = regs.rdi;
                regs.rdi = regs.rsi;
                regs.rsi = orig_rdi;

                syscall(SYS_PTRACE, PTRACE_SETREGS, child_pid, 0, &regs);
            }
            if (regs.orig_rax == WRONG_SYS_TIME_SET) {
                regs.orig_rax = SYS_TIME_SET;
                unsigned long long int orig_rdi = regs.rdi;
                regs.rdi = regs.r10;
                regs.rsi = orig_rdi;
            
                syscall(SYS_PTRACE, PTRACE_SETREGS, child_pid, 0, &regs);
            }
            if (regs.orig_rax == WRONG_SYS_TIME_GET) {
                regs.orig_rax = SYS_TIME_GET; 
                unsigned long long int orig_rdi = regs.rdi;
                regs.rdi = regs.rsi;
                regs.rsi = orig_rdi;

                syscall(SYS_PTRACE, PTRACE_SETREGS, child_pid, 0, &regs);
            }
        }
        wait(NULL);
        long value = syscall(SYS_PTRACE, PTRACE_GETREGS, child_pid, 0, &regs); 
        *valid_part = (int) regs.rdi; 
        if (*valid_part == 2) {
            *valid_part += ((user_entry[*valid_part - 2]) ^ 'B') + 1;
        }
        __asm__ __volatile__ (
        "pop rax;"
        "pop rax;"
            "pop rsi;"
            "pop rdi;"
        );
    }
    
    return;
}

// CHAR 10 = '5'; 16 = '_'; 25 = 'Y'
void part_2_disass(char *user_entry, int *valid_part) {
    __asm__ __volatile__ ("sub rsp, 0x10;");
    
    __asm__ __volatile__(
        "add al, 55;"
        "cmp al, 0x01;"
        "jbe $+53;"
        "jae $+53;"
    );
    __asm__ __volatile__(".byte 0x6f;.byte 0xc9;.byte 0x8b;.byte 0xd0;.byte 0x88;.byte 0xfb;.byte 0xe8;.byte 0x85;.byte 0x41;.byte 0x6c;.byte 0x22;.byte 0xde;.byte 0xb8;.byte 0xd1;.byte 0xae;.byte 0x93;.byte 0xc0;.byte 0xe4;.byte 0xcb;.byte 0x9f;.byte 0x78;.byte 0xe5;.byte 0x37;.byte 0x08;.byte 0xc8;.byte 0xd6;.byte 0x0a;.byte 0xda;.byte 0x93;.byte 0x82;.byte 0x36;.byte 0xf2;.byte 0xfa;.byte 0xee;.byte 0xe6;.byte 0x57;.byte 0x1d;.byte 0xe8;.byte 0xdc;.byte 0x1c;.byte 0xe2;.byte 0x07;.byte 0xd3;.byte 0xdc;.byte 0xb0;.byte 0xd6;.byte 0x55;.byte 0xb9;.byte 0x0f;.byte 0x90;"); 
    __asm__ __volatile__(
        //"mov al, byte ptr[rdi + 10];"
        "push  0xa478a90;"
        "cmp al, 0x35;"
        "jne fail_1_2_2;"
        "inc byte ptr[rsi];"
        "fail_1_2_2:;"
        "add al, 55;"
        "cmp al, 0x55;"
        "jz $+36;"
        "jnz $+34;"
    );
    __asm__ __volatile__(".byte 0xb4;.byte 0x9d;.byte 0x5b;.byte 0x3c;.byte 0x2b;.byte 0x23;.byte 0x43;.byte 0x8f;.byte 0xbe;.byte 0xd7;.byte 0xb7;.byte 0x5f;.byte 0x21;.byte 0x47;.byte 0x80;.byte 0x78;.byte 0xd5;.byte 0x96;.byte 0x77;.byte 0xc1;.byte 0x7d;.byte 0x30;.byte 0x0d;.byte 0xbc;.byte 0x9c;.byte 0xeb;.byte 0x22;.byte 0x58;.byte 0x07;.byte 0x87;.byte 0xea;.byte 0xd9;");
     __asm__ __volatile__(
        "mov eax, DWORD ptr[rdi + 16];"
        "mov ecx, 0x0700;"
        "bextr ecx, eax, ecx;"
        "xor ecx, 0x1337;"
        "cmp ecx, 0x1368;"
        "jne fail_2_2_2;"
        "inc byte ptr[rsi];"
        "fail_2_2_2:;"
        "call $+22;"
        "ret;"
    );   

    __asm__ __volatile__(".byte 0x7b;.byte 0x6b;.byte 0xb5;.byte 0xe4;.byte 0xf2;.byte 0x26;.byte 0xdf;.byte 0x98;.byte 0xfb;.byte 0x71;.byte 0x42;.byte 0x9c;.byte 0xcc;.byte 0x89;.byte 0x0b;.byte 0x15;");
    __asm__ __volatile__(
        "pop rax;"
        "cmp rax, 0x77;"
        "jne $+5;"
        "xor rax, rax;"
        "mov al, byte ptr[rdi + 25];"
        "cmp al, 0x59;"  
        "jne fail_3_2_2;"
        "inc byte ptr[rsi];"
        "fail_3_2_2:;"
    );

    __asm__ __volatile__("pop rsi;pop rdi;");
    return;
}

// CHAR 7 = 'V'; 9 = 'u'; 23 = '0'
void part_2_specific_asm(char *user_entry, int *valid_part) {
    __asm__ __volatile__ ("sub rsp, 0x10;");
    __asm__ __volatile__ (
        "xor rax, rax;"
        "xor rcx,rcx;"
        "mov al, byte ptr[rdi + 23];"
        "lzcnt cx, ax;"
        "cmp cx, 0xa;"
        "jnz fail_1_3_2;"
        "bsf cx, ax;"
        "cmp cx, 0x4;"
        "jnz fail_1_3_2;"
        "inc byte ptr[rsi];"
        "fail_1_3_2:;"
        "mov al, byte ptr[rdi + 7];"
        "bswap eax;"
        "cmp eax, 0x56000000;"
        "jnz fail_2_3_2;"
        "inc byte ptr[rsi];"
        "fail_2_3_2:;"
        "mov al, byte ptr[rdi + 9];"
        "ror al, 4;"
        "cmp al, 0x57;"
        "jnz fail_3_3_2;"
        "inc byte ptr[rsi];"
        "fail_3_3_2:;"
    );     
    __asm__ __volatile__("pop rsi;pop rdi;");
}

void part_2_end() {
    printf("Encore ce truc mais c'est bizarre ?!\n");
}

// 11 = '_' ; 17 = 't';  21 = '_' 
void part_3_debug(char *user_entry, int *valid_part) {
    __asm__ __volatile__ ("sub rsp, 0x10;");
    FILE *fp;
	char filename[64];
    char *tools_list[TOOLS_LIST_SIZE] = {"gdb", "strace", "ltrace", "ida64", "ida32", "r2", "radare2", "ghidra", "cutter", "iaito"};  
    int debug = 0; 

    if (getenv("LINES") || getenv("COLUMNS"))
        goto fail_1_1_3;
    if(user_entry[11] == 0x5f) {
        (*valid_part)++;
    } 
    
    fail_1_1_3:

	snprintf(filename, PROC_FILENAME_SIZE, "/proc/%i/status", getppid());

	if ((fp = fopen(filename, "r"))) {
		if (fgets(filename, PROC_FILENAME_SIZE, fp)) {    
            int step = 0;
            while(*(filename + 1) == ' ')  step++;
            for (int i = 0; i < TOOLS_LIST_SIZE; i++) {
                if(strstr(&filename[step], tools_list[i])) {
                    debug += 1;
                    goto fail_2_1_3;
                }
            }
            if((user_entry[17] ^ 0x0b) == 127)
                (*valid_part)++;
        }
        fail_2_1_3:
        fclose(fp);
    }

	snprintf(filename, PROC_FILENAME_SIZE, "/proc/%i/cmdline", getppid());

	if ((fp = fopen(filename, "r"))) {
		if (fgets(filename, PROC_FILENAME_SIZE, fp)) {    
            int step = 0;
            while(*(filename + 1) == ' ')  step++;
            for (int i = 0; i < TOOLS_LIST_SIZE; i++) {
                if(strstr(&filename[step], tools_list[i])) { 
                    debug += 1;
                    goto fail_3_1_3;
                }
            }
            if((user_entry[21] - 42) == 53)
                (*valid_part)++;
        }
        fail_3_1_3:
        fclose(fp);
    }
    __asm__ __volatile__("pop rax; pop rax; pop rsi;pop rdi;");
    if(debug)
        exit(1);
}

// 6 = '{' ; 18 = 'r';  24 = '1' 
void part_3_disass(char *user_entry, int *valid_part) {
    __asm__ __volatile__ ("sub rsp, 0x8;");
    __asm__ __volatile__(
        "sub rsp, 0x8;"
        "cmp rsp, 0x1000;"
        "jl fake;"
        "sub rsp, 0x10;"
        "jmp valid;"
        "fake:;"
        "add rsp, 0x142;"
        "mov dword [esp - 0x42], ecx;"
        "mov qword [esp - 0x24], rax;"
        "mov qword [rsp - 0x10], rdx;"
        "add qword [rsp - 0x10], cl;"
        "mov qword [rsp - 0x8], rdi;"
        "mov qword [rsp - 0x8], rsi;"
        "add qword [rsp - 0x8], al;"
        "mov qword [rsp + 0x8], rax;"
        "mov qword [rsp + 0x10], r10;"
        "valid:;"
        "mov rcx, qword ptr [rsp - 0x8];"
        "call $+5;"
        "jmp $+3;"
        ".byte 0x31;"
        "xor rax, rax;"
        "mov al, byte ptr[rdi + 24];"
        "pop rdx;"
        "mov cl, byte ptr[rdx + 2];"
        "cmp al, cl;"
        "jnz fail_1_2_3;"
        "inc byte ptr[rsi];"
        "fail_1_2_3:;"
        "mov al, byte ptr[rdi + 6];"
        "lea eax, [eax+4*eax];"
        "cmp ax, 0x267;"
        "jnz fail_2_2_3;"
        "inc byte ptr[rsi];"
        "fail_2_2_3:;"
        "add rsp, 0x10;"
        "mov al, byte ptr[rdi + 18];"
        "cmp al, 0x72;"
        "jnz fail_3_2_3;"
        "inc byte ptr[rsi];"
        "fail_3_2_3:;"
    );    
    __asm__ __volatile__("pop rsi;pop rdi;");
}
// 8 = '0' ; 0 = 'B';  22 = 'P' 
void part_3_specific_asm(char *user_entry, int *valid_part) {
    __asm__ __volatile__ ("sub rsp, 0x10;");
    __asm__ __volatile__ (
        "xor rax, rax;"
        "mov al, byte ptr [rdi + 8];"
        "cmp al, 0x30;"
        "jnz fail_1_3_3;"
        "inc byte ptr[rsi];"
        "fail_1_3_3:;"
        "mov al, byte ptr [rdi + 22];"
        "cmp al, 0x50;"
        "jnz fail_2_3_3;"
        "inc byte ptr[rsi];"
        "jmp fail_2_3_3;"
        ".byte 0x78;"
        ".byte 0x63;"
        ".byte 0x68;"
        ".byte 0x67;"
        ".byte 0x20;"
        ".byte 0x72;"
        ".byte 0x61;"
        ".byte 0x78;"
        ".byte 0x2c;"
        ".byte 0x20;"
        ".byte 0x72;"
        ".byte 0x61;"
        ".byte 0x78;"
        "fail_2_3_3:;"
        "xor rdx ,rdx;"
        "mov al, byte ptr[rdi + 4];"
        "mov cl, al;"
        "mov rdx,0xaaaaaaaaaaaaaaab;"
        "mul rdx;"
        "shr rdx,1;"
        "mov rax,rdx;"
        "cmp al, 0x1c;"
        "jnz fail_3_3_3;"
        "mov al, cl;"
        "mov rdx, 2;"
        "add rax,rdx;"
        "ror rax,1;"
        "cmp rax, 0x2b;"
        "jnz fail_3_3_3;"
        "inc byte ptr[rsi];"
        "fail_3_3_3:;"
    );    
    __asm__ __volatile__("pop rsi;pop rdi;"); 
}

void part_3_end() {
    printf("Bon la ça commence à être bizarre non ?\n");
}


void get_filename(char filename_str[512]) {
    size_t len = readlink("/proc/self/exe", filename_str, MAX_PATH -1);

    if ((int)len != -1)
        filename_str[len] = '\0';
}

void replace_function_decrypt(poly_object* poly_objects, uint8_t* buffer) {
    for (int idx = 0; idx < 3; idx++) {
        memcpy(buffer + poly_objects[idx].offset, poly_objects[idx].opcodes, poly_objects[idx].opcodes_size);  
    }
}

void get_call_opcode(uint8_t call_opcode[CALL_SIZE], uint16_t call_offset, int idx) {
    uint16_t global_offset = call_offset - TEMPLATE_OFFSET - CALL_SIZE * (idx + 1);
    call_opcode[0] = 0xE8; // call opcode
    call_opcode[1] = global_offset & 0xff;
    call_opcode[2] = (global_offset) >> 8 & 0xff;  
}

void replace_template_call(poly_object* poly_objects, uint8_t* buffer) {
    int current_offset = 0;
    uint8_t call_opcode[CALL_SIZE] = {0};
    for (int idx = 0; idx < 3; idx++) {
        get_call_opcode(call_opcode, poly_objects[idx].offset, idx);
        memcpy(buffer + TEMPLATE_OFFSET + current_offset, call_opcode, CALL_SIZE);  
        current_offset += CALL_SIZE;
    }
}

void decrypt_opcode(poly_object poly_object, uint8_t *current_key) {
    for (size_t opc_idx = 0; opc_idx < poly_object.opcodes_size; opc_idx++) {
        poly_object.opcodes[opc_idx] ^= current_key[opc_idx % KEY_SIZE];
    }    

}

int fill_poly_object(poly_object *poly_objects, uint8_t *current_key) {
    for (int idx = 0; idx < 3; idx++) {
        // get function size 
        poly_objects[idx].opcodes_size = poly_objects[idx + 1].func_addr - poly_objects[idx].func_addr;
        //printf("idx = %d, opcode size = %ld\n", idx, poly_objects[idx].opcodes_size);
        poly_objects[idx].opcodes = (uint8_t *) malloc(sizeof(uint8_t) * poly_objects[idx].opcodes_size);
        memcpy(poly_objects[idx].opcodes, poly_objects[idx].func_addr, poly_objects[idx].opcodes_size);
        decrypt_opcode(poly_objects[idx], current_key);
    }
    return 0;
}

int polymorphism_managment() {
    poly_object poly_objects[4];
    int future_generation = 0;
    uint8_t *key;
    int poly_generation = 0; 
    FILE* env_file;
    env_file = fopen(ENV_VAR_FILE, "r+");
    if(env_file) {
        fread(&poly_generation, 1, 1, env_file);
        poly_generation -= 0x30;
    }
    else {
        env_file = fopen(ENV_VAR_FILE, "w+");
    }
    fseek(env_file, 0, SEEK_SET);
        
    if(poly_generation != 0) {
        fclose(env_file);
        fopen(ENV_VAR_FILE, "w+");
    }

    if ((poly_generation == 0) || (poly_generation != 0 && (poly_generation == 3)) ) {

        future_generation = 1;
        poly_objects[0].func_addr = part_1_debug;
        poly_objects[0].offset = PART_1_DEBUG_OFFSET;
        poly_objects[1].func_addr = part_1_disass;
        poly_objects[1].offset = PART_1_DISASS_OFFSET;
        poly_objects[2].func_addr = part_1_specific_asm;
        poly_objects[2].offset = PART_1_SPECIFIC_ASM_OFFSET;
        poly_objects[3].func_addr = part_1_end;  
        key = (uint8_t *) KEY_1; 

    } else if (poly_generation == 1) {

        future_generation = 2;
        poly_objects[0].func_addr = part_2_debug;
        poly_objects[0].offset = PART_2_DEBUG_OFFSET;
        poly_objects[1].func_addr = part_2_disass;
        poly_objects[1].offset = PART_2_DISASS_OFFSET;
        poly_objects[2].func_addr = part_2_specific_asm;
        poly_objects[2].offset = PART_2_SPECIFIC_ASM_OFFSET;
        poly_objects[3].func_addr = part_2_end;  
        key = (uint8_t *) KEY_2;

    } else if (poly_generation == 2) {

        future_generation = 3;
        poly_objects[0].func_addr = part_3_debug;
        poly_objects[0].offset = PART_3_DEBUG_OFFSET;
        poly_objects[1].func_addr = part_3_disass;
        poly_objects[1].offset = PART_3_DISASS_OFFSET;
        poly_objects[2].func_addr = part_3_specific_asm;
        poly_objects[2].offset = PART_3_SPECIFIC_ASM_OFFSET;
        poly_objects[3].func_addr = part_3_end;  
        key = (uint8_t *) KEY_3;
    }
    
    fprintf(env_file, "%d", future_generation);
    fclose(env_file);

    fill_poly_object(poly_objects, key);
    char filename_str[MAX_PATH];
    get_filename(filename_str);
    FILE* itself;
    itself = fopen(filename_str,"rb");    
    fseek(itself, 0, SEEK_END);
    size_t file_size = ftell(itself);
    rewind(itself);
    
    // Allocate a buffer on the heap to hold the file contents
    uint8_t *buffer = (uint8_t*) malloc(file_size);
    if (buffer == NULL) {
        printf("Error: failed to allocate memory\n");
        return 1;
    }

    // Read the file into the buffer
    size_t bytes_read = fread(buffer, 1, file_size, itself);
    if (bytes_read != file_size) {
        printf("Fail\n");
        free(buffer);
        return 1;
    }
    fclose(itself);
    replace_function_decrypt(poly_objects, buffer);
    replace_template_call(poly_objects, buffer);

    for(int idx = 0; idx < 3; idx++) {
        free(poly_objects[idx].opcodes);
    }
    unlink(filename_str);
    itself = fopen(filename_str, "wb"); 
    fwrite(buffer, 1, file_size, itself);
    
    free(buffer);
    return 0;
}
int main(int argc, char* argv[]) {
    int is_valid = 0;
    int validated_part = 0;
    if (argc < 2) {
        printf("Usage : ./un_exchange_poly {FLAG}\n"); 
        return 1;
    }
    
    if (strlen(argv[1]) != 27) {
        printf("Bah pas très poly ça dit donc\n");
        return 1;
    }
    FILE *f = fopen(ENV_VAR_FILE, "r");
    if (f == NULL)
        validated_part = 9;
    else 
        fclose(f);
    template_func(argv[1], &validated_part);
    if(f != NULL)
        __asm__ __volatile__("sub rsp, 0x8;");

    if (validated_part == 9) {
        printf("Etape passée !\n");
    } else {
        printf("Nop, pas la bonne étape ?!\n");
        goto fail;
    }
    f = fopen(ENV_VAR_FILE, "r");
    if(f != NULL) {
        fread(&is_valid, 1, 1, f);
        if(is_valid == 0x33)
            printf("Bravo c'est gagné vous pouvez entrer le flag : %s\n", argv[1]);
        fclose(f);
    }

    polymorphism_managment();

    fail:
    return 0;
}
