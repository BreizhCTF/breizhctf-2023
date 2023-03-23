#include "cap_ou_stone.h"

void get_entry_slice(char *user_entry, char *slice,size_t slice_id, size_t slice_size) {
    memcpy(slice, user_entry + (slice_id * slice_size), slice_size); 
    slice[slice_size + 1] = 0;
}

int find_nop(uint8_t *start_addr, size_t max_size) {
    size_t idx;
    for(idx = 0; idx < (max_size - 1); idx++) {
        if(start_addr[idx] == 0x90) {
            if(memcmp(&start_addr[idx], "\x90\x90\x90\x90", 4) == 0) {
                return idx;
            }
        }
    }
    return -1;
}

void replace_nop(uint8_t *replacement_addr, size_t replacement_size, uint8_t *replacement_buffer) {
    for (size_t idx = 0; idx < replacement_size; idx++) {
        replacement_addr[idx] = replacement_buffer[idx];
    }
}

void translate_buffer(char *slice, uint8_t *byte_slice, int slice_size) {
    for (int i = 0; i < slice_size; i += 2) {
        sscanf(slice + i, "%2hhx", &byte_slice[i / 2]);
    }
} 

void *get_aligned_addr(void *function, long *page_size) {
    void* function_ptr = (void*) function;
    *page_size = sysconf(_SC_PAGE_SIZE);
    void* aligned_ptr = (void*)((uintptr_t)function_ptr & ~(*page_size - 1));
    return aligned_ptr; 
}

void flush_standard_input() {
    int c;
    while ((c = getchar()) != '\n' && c != EOF);
}

int set_memory_writable(void *aligned_ptr, long page_size) {
    if (mprotect(aligned_ptr, page_size, PROT_WRITE | PROT_READ | PROT_EXEC) == -1) {
            printf("Protection couldn't be applied \n");
            return 1;
    }
    return 0;
}

int reset_memory_status(void *aligned_ptr, long page_size) {
    if(mprotect(aligned_ptr, page_size, PROT_READ | PROT_EXEC) == -1) {
        printf("Protection couldn't be applied \n");
        return 1; 
    }
    return 0;
}

int first_check_opcode() {
    char user_entry[25] = {0};
    char slice[FIRST_SLICE_SIZE + 1];
    uint8_t byte_slice[4];
    long page_size;
    printf("Donne moi les hespoires code\n");
    if(fgets(user_entry, 25, stdin) == NULL) {
        printf("Error reading user entry \n");
        return 1;
    }
     if(strlen(user_entry) == 24) {
        flush_standard_input();
    }
    
    void* aligned_ptr = get_aligned_addr(first_check_opcode, &page_size);

    // Make memory writable
    set_memory_writable(aligned_ptr, page_size); 
    // Treat each slice  
    for(int idx = 0; idx < 3; idx++) {
        memset(slice, 0, FIRST_SLICE_SIZE + 1);
        get_entry_slice(user_entry, slice, idx, FIRST_SLICE_SIZE);
        translate_buffer(slice, byte_slice, FIRST_SLICE_SIZE);
        int offset = find_nop((uint8_t*) aligned_ptr, page_size);
        if (offset == -1) {
            printf("[-] Error while replacing \n");
            return 1;
        }
        replace_nop((uint8_t*)(aligned_ptr + offset), FIRST_SLICE_SIZE / 2, byte_slice);
    }

    reset_memory_status(aligned_ptr, page_size);
     
    __asm__ __volatile__
        ("xor rax, rax;"
        "nop;"
        "nop;"
        "nop;"
        "nop;" // possible solve : 66B83713 => mov ax, 0x1337
        "cmp ax, 0x1337;"); // ax should be equals to 0x1337
    __asm__ goto ("jnz %l0;": : : :_fail_1);    
    __asm__ __volatile__(
        "xor rax, rax;"
        "nop;"
        "nop;"
        "nop;"
        "nop;" // possible solve :  66B80100 -> mov ax, 0x1
        "add ax, 0xDEAD;"); // the carry flag sould be unset 
    __asm__ goto ("jc %l0;": : : :_fail_1);               
    __asm__ __volatile__(
        "xor rax, rax;"
        "xor rcx, rcx;"
        "nop;"
        "nop;"
        "nop;"
        "nop;" // possible solve : B020B110 => mov al, 0x21; mov cl, 0x10
        "sub al, cl;" // al and cl need to be odd and even in order to unset the parity flag
        );
    __asm__ goto ("jp %l0;": : : :_fail_1);               

    return 0;

    _fail_1:

    return 1;
}

int second_check_mnemonic() {
    char user_entry[10] = {0};
    char slice[SECOND_SLICE_SIZE + 1];
    char to_assemble[TO_ASSEMBLE_MAX_SIZE];
    unsigned char *opcodes;
    long page_size;
    int last_one = 0;
    // capstone var setup
    csh handle;
	cs_insn *insn;
	size_t cs_count;
    // keystone var setup
    ks_engine *ks;
    ks_err err;
    size_t size; 
    size_t ks_count;

    printf("Aide monic à trouver ses mne\n"); 
    if(fgets(user_entry, 10, stdin) == NULL) {
        printf("Error reading user entry \n");
        goto _fail_2;
    }
    if(strlen(user_entry) == 9) {
        flush_standard_input();
    }

	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK) {
		goto _fail_2;
    }
	 
    err = ks_open(KS_ARCH_X86, KS_MODE_64, &ks);
    if (err != KS_ERR_OK) {
        printf("KS_failed \n");
        goto _fail_2;
    }
    ks_option(ks, KS_OPT_SYNTAX, KS_OPT_SYNTAX_NASM);

    void* aligned_ptr = get_aligned_addr(second_check_mnemonic, &page_size);
    set_memory_writable(aligned_ptr, page_size);

    for (int idx = 0; idx < 3; idx++) {
        if (idx == 2) {
            last_one = -1;
        }
        cs_count = cs_disasm(handle, (uint8_t*)(SECOND_SLICE + (idx * 4 + last_one)), SECOND_SLICE_SIZE_1 - idx, 0x0, 0, &insn);
        if(cs_count <= 0) {
            cs_close(&handle);
            return 1;
        }
        get_entry_slice(user_entry, slice, idx, SECOND_SLICE_SIZE);
        memmove(insn->mnemonic, slice, SECOND_SLICE_SIZE);
        snprintf(to_assemble, TO_ASSEMBLE_MAX_SIZE, "%s %s;", insn->mnemonic, insn->op_str); 
        int result  = 0;
        if ((result = ks_asm(ks, to_assemble, 0, &opcodes, &size, &ks_count)) != KS_ERR_OK) {
            ks_close(ks);
        }
        
        int offset = find_nop(aligned_ptr, page_size);
        if (offset == -1) {
            ks_free(opcodes);
            ks_close(ks);
            cs_free(insn, cs_count);
            cs_close(&handle);
            printf("[-] Error while replacing \n");
            goto _fail_2; 
        }
        replace_nop(aligned_ptr + offset, SECOND_SLICE_SIZE_1 - idx, opcodes);
        memset(to_assemble, 0, TO_ASSEMBLE_MAX_SIZE);
        ks_free(opcodes);
        cs_free(insn, cs_count);
    }
    reset_memory_status(aligned_ptr, page_size);

    cs_close(&handle);
    ks_close(ks);
     __asm__ __volatile__
        ("xor rax, rax;"
        "nop;"
        "nop;"
        "nop;"       
        "nop;"       
        "cmp ax, 0xBEEF;");
    __asm__ goto ("jnz %l0;": : : :_fail_2);
    __asm__ __volatile__ (
        "mov ax, 0xBABE;"
        "nop;"
        "nop;"
        "nop;"       
        "nop;"
        "cmp ax, 0;");
    __asm__ goto ("jnz %l0;": : : :_fail_2);
    __asm__ __volatile__ (
        "xor rax, rax;"
        "mov al, 0x33;"
        "nop;"
        "nop;"
        "nop;"       
        "nop;"       
        "cmp al, 0x11;");
    __asm__ goto ("jnz %l0;": : : :_fail_2);

    return 0;

    _fail_2:

    return 1;
}

int third_check_op_str() {
    char user_entry[10] = {0};
    char slice[THIRD_SLICE_SIZE + 1];
    char to_assemble[TO_ASSEMBLE_MAX_SIZE];
    unsigned char *opcodes;
    long page_size;
    csh handle;
	cs_insn *insn;
	size_t cs_count;
    ks_engine *ks;
    ks_err err;
    size_t size; 
    size_t ks_count;
    int last_one = 0;

    printf("Donne moi les registres des comptes\n"); 
    if(fgets(user_entry, 10, stdin) == NULL) {
        printf("Error reading user entry \n");
        return 1;
    }
    if(strlen(user_entry) == 9) {
        flush_standard_input();
    }
	if (cs_open(CS_ARCH_X86, CS_MODE_64, &handle) != CS_ERR_OK) {
		goto _fail_3;
    }
	 
    err = ks_open(KS_ARCH_X86, KS_MODE_64, &ks);
    if (err != KS_ERR_OK) {
        printf("KS_failed \n");
        goto _fail_3;
    }
    ks_option(ks, KS_OPT_SYNTAX, KS_OPT_SYNTAX_NASM);

    void* aligned_ptr = get_aligned_addr(third_check_op_str, &page_size);
    set_memory_writable(aligned_ptr, page_size);

    for (int idx = 0; idx < 3; idx++) {
        if (idx == 2) {
            last_one = -1;
        }
        cs_count = cs_disasm(handle, (uint8_t*)(THIRD_SLICE + (idx * 4 + last_one)), THIRD_SLICE_SIZE_1 - idx, 0x0, 0, &insn);
        if(cs_count <= 0) {
            cs_close(&handle);
            return 1;
        }
        get_entry_slice(user_entry, slice, idx, THIRD_SLICE_SIZE);
        memmove(insn->op_str, slice, THIRD_SLICE_SIZE);
        snprintf(to_assemble, TO_ASSEMBLE_MAX_SIZE, "%s %s;", insn->mnemonic, insn->op_str); 
        int result  = 0;
        if ((result = ks_asm(ks, to_assemble, 0, &opcodes, &size, &ks_count)) != KS_ERR_OK) {
            ks_close(ks);
        }
        
        int offset = find_nop(aligned_ptr, page_size);
        if (offset == -1) {
            ks_free(opcodes);
            ks_close(ks);
            cs_free(insn, cs_count);
            cs_close(&handle);
            printf("[-] Error while replacing \n");
            goto _fail_3; 
        }
        replace_nop(aligned_ptr + offset, THIRD_SLICE_SIZE_1 - idx, opcodes);
        memset(to_assemble, 0, TO_ASSEMBLE_MAX_SIZE);
        ks_free(opcodes);
        cs_free(insn, cs_count);
    }
    reset_memory_status(aligned_ptr, page_size);

    cs_close(&handle);
    ks_close(ks);
     __asm__ __volatile__
        ("xor rbx, rbx;" //shr :
        "mov rbx, 8;"
        "nop;"
        "nop;"
        "nop;"       
        "nop;"       
        "cmp rbx, 2;");
    __asm__ goto ("jnz %l0;": : : :_fail_3);
    __asm__ __volatile__ (
        "xor r10, r10;" // neg
        "mov r10, 5;"
        "nop;"
        "nop;"
        "nop;"       
        "nop;"
        "cmp r10, -5;");
    __asm__ goto ("jnz %l0;": : : :_fail_3);
    __asm__ __volatile__ (
        "xor ecx, ecx;"
        "mov ecx, -4;" // not
        "nop;"
        "nop;"
        "nop;"       
        "nop;"       
        "cmp ecx, 3;");
    __asm__ goto ("jnz %l0;": : : :_fail_3);

    return 0;

    _fail_3: 

    return 1;
}

int main(void) {
    FILE* flag_file;
    char* flag_name = "flag.txt";
    char flag_str[60] = {0};
    if(!first_check_opcode()) { 
        printf("GG, la première vérification est validée\n");
        // 66B8371366B80100B020B110 valid
    } else {
        printf("Première vérification échouée !\n");
        return 1;
    }
    if(!second_check_mnemonic()) {
        printf("GG, La seconde vérification est validée\n");
        // movxorand valid
    } else {
        printf("Seconde vérification échouée !\n");
        return 1;
    }
    if(!third_check_op_str()) {
        printf("GG, la troisième vérification est validée\n");
        // rbxr10ecx valid
        flag_file = fopen(flag_name, "r");
        if(flag_file != NULL) {
            fread(flag_str, 1, 60, flag_file);
            printf("Bravo vous avez réussi voici le flag : %s\n", flag_str);
            fclose(flag_file);
        } else {
            printf("Bravo, vous pouvez répéter la même opération sur le serveur pour récupérer le flag !\n");
        }
    } else {
        printf("Troisième vérification échouée !\n");
        return 1;
    }

    return 0;
}
