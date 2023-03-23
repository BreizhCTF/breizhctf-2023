#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <gelf.h>
#include <fcntl.h>
#include <unistd.h>
#include <libelf.h>

#define SYM_SIZE 13
#define KEY_SIZE 16
#define KEY_1 "not_a_flag_dude!"
#define KEY_2 "popopopolylylyly"
#define KEY_3 "BZHCTF_radio_<3!" 

typedef struct function_block {
    int offset; 
    int size; 
    char* name;
}function_block;


void encrypt_buffer(uint8_t* buffer, uint8_t* current_key, int offset, int size) {
    for (int opc_idx = 0; opc_idx < size; opc_idx++) {
         buffer[offset - 0x400000 + opc_idx] ^= current_key[opc_idx % KEY_SIZE];
    }
}

void encrypt_function_block(function_block* functions_block) {
    char* current_key;
    FILE* poly_file = fopen("bin/un_exchange_poly", "rb");
    if(!poly_file) {
        printf("Error while opening un_exchange_poly\n");
        return;
    }
    fseek(poly_file, 0, SEEK_END);
    size_t file_size = ftell(poly_file);
    rewind(poly_file);
    
    // Allocate a buffer on the heap to hold the file contents
    uint8_t *buffer = (uint8_t*) malloc(file_size);
    if (buffer == NULL) {
        printf("Error: failed to allocate memory\n");
        return;
    }

    // Read the file into the buffer
    size_t bytes_read = fread(buffer, 1, file_size, poly_file);
    if (bytes_read != file_size) {
        printf("Fail\n");
        free(buffer);
        return;
    }
    printf("file_size %ld\n", file_size);
    fclose(poly_file);

    for (int idx = 0; idx < SYM_SIZE; idx++) {
        if((idx < 4) && (idx > 0)) {
            current_key = KEY_1;
            encrypt_buffer(buffer, (uint8_t*) current_key, functions_block[idx].offset, functions_block[idx].size);
        }   
        
        if((idx < 8) && (idx > 4)) {
            current_key = KEY_2;
            encrypt_buffer(buffer, (uint8_t*) current_key, functions_block[idx].offset, functions_block[idx].size);
        }

        if((idx < 12) && (idx > 8)) {
            current_key = KEY_3;
            encrypt_buffer(buffer, (uint8_t*) current_key, functions_block[idx].offset, functions_block[idx].size);
        }
    }
    poly_file = fopen("bin/un_exchange_poly", "wb");
    if (fwrite(buffer, 1, file_size, poly_file) != file_size) {
        printf("Fwrite failed\n");
    } 
    free(buffer);
    fclose(poly_file);
    return;
}

void swap(function_block *a, function_block *b) {
    function_block temp = *a;
    *a = *b;
    *b = temp;
}

int partition(function_block arr[], int low, int high) {
    function_block pivot = arr[high];
    int i = (low - 1);
    for (int j = low; j <= high - 1; j++) {
        if (arr[j].offset <= pivot.offset) {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}

void quicksort(function_block arr[], int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quicksort(arr, low, pi - 1);
        quicksort(arr, pi + 1, high);
    }
}

int main(void) {

    function_block functions_block[SYM_SIZE];
    char *functions_symbol[SYM_SIZE] = {"template_func","part_1_debug", "part_1_disass", "part_1_specific_asm", "part_1_end",
                                            "part_2_debug", "part_2_disass", "part_2_specific_asm", "part_2_end",
                                            "part_3_debug", "part_3_disass", "part_3_specific_asm", "part_3_end"
                                           };

    int fd = open("bin/un_exchange_poly", O_RDONLY);
    if (fd < 0) {
        perror("open");
        exit(1);
    }

    if (elf_version(EV_CURRENT) == EV_NONE) {
        fprintf(stderr, "Error: elf_version() failed: %s\n", elf_errmsg(-1));
        exit(1);
    }

    Elf *elf = elf_begin(fd, ELF_C_READ, NULL);
    if (!elf) {
        fprintf(stderr, "Error: elf_begin() failed: %s\n", elf_errmsg(-1));
        exit(1);
    }

    if (elf_kind(elf) != ELF_K_ELF) {
        fprintf(stderr, "Error: file is not an ELF object\n");
        exit(1);
    }

    Elf_Scn *scn = NULL;
    while ((scn = elf_nextscn(elf, scn)) != NULL) {
        GElf_Shdr shdr;
        if (!gelf_getshdr(scn, &shdr)) {
            fprintf(stderr, "Error: gelf_getshdr() failed: %s\n", elf_errmsg(-1));
            exit(1);
        }
    
        if (shdr.sh_type != SHT_SYMTAB) {
            continue;
        }

        Elf_Data *data = elf_getdata(scn, NULL);
        if (!data) {
            fprintf(stderr, "Error: elf_getdata() failed: %s\n", elf_errmsg(-1));
            exit(1);
        }

        int nsyms = shdr.sh_size / shdr.sh_entsize;
        GElf_Sym sym;
        const char *strtab = NULL;
    for (int i = 0; i < nsyms; i++) {
            gelf_getsym(data, i, &sym);

            if (GELF_ST_TYPE(sym.st_info) != STT_FUNC) {
                continue;
            }

            if (!strtab) {
                Elf_Scn *strscn = elf_getscn(elf, shdr.sh_link);
                Elf_Data *strdata = elf_getdata(strscn, NULL);
                strtab = (const char *)strdata->d_buf;
            }
            for (int idx = 0; idx < SYM_SIZE; idx++) {
                if (strcmp(strtab + sym.st_name, functions_symbol[idx]) == 0) {
                    functions_block[idx].offset = sym.st_value;
                    functions_block[idx].name = functions_symbol[idx];
                }
            }
        }
    }
    elf_end(elf);
    close(fd);

    quicksort(functions_block, 0, SYM_SIZE -1);
    for (int idx = 0; idx < SYM_SIZE; idx++) {
        if(idx!=0)
            functions_block[idx - 1].size = functions_block[idx].offset - functions_block[idx - 1].offset;
    }

    for (int idx = 0; idx < SYM_SIZE; idx++) {
        if(idx == 0)
            printf("func = %s; offset = 0x%x; size = %d\n", functions_block[idx].name, functions_block[idx].offset - 0x400000 + 12, functions_block[idx].size);
        else 
            printf("func = %s; offset = 0x%x; size = %d\n", functions_block[idx].name, functions_block[idx].offset - 0x400000, functions_block[idx].size);
    }
    encrypt_function_block(functions_block);
   

    return 0;
}
