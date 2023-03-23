#ifndef _UN_EXCHANGE_POLY_H 
#define _UN_EXCHANGE_POLY_H

#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <unistd.h>
#include <time.h>
#include <sys/ptrace.h>
#include <sys/wait.h>
#include <signal.h>
#include <sys/user.h>

#define POLY_G "POLY_GENERATION"
#define KEY_SIZE 16
#define KEY_1 "not_a_flag_dude!"
#define KEY_2 "popopopolylylyly"
#define KEY_3 "BZHCTF_radio_<3!" 
#define MAX_PATH 512
#define CALL_SIZE 5
#define ENV_VAR_FILE "/tmp/poly_generation"


#define TEMPLATE_OFFSET 0x18d1
#define PART_1_DEBUG_OFFSET 0x18e2
#define PART_1_DISASS_OFFSET 0x1a2c
#define PART_1_SPECIFIC_ASM_OFFSET 0x1b3b
#define PART_2_DEBUG_OFFSET 0x1bb5
#define PART_2_DISASS_OFFSET 0x21a9
#define PART_2_SPECIFIC_ASM_OFFSET 0x2271
#define PART_3_DEBUG_OFFSET 0x22d6
#define PART_3_DISASS_OFFSET 0x263f
#define PART_3_SPECIFIC_ASM_OFFSET 0x26d0

#define SYS_PTRACE 101
#define SYS_WAIT4  61
#define WRONG_SYS_TIME_CRE 600
#define SYS_TIME_CRE 222 
#define WRONG_SYS_TIME_SET 601 
#define SYS_TIME_SET 223
#define WRONG_SYS_TIME_GET 608
#define SYS_TIME_GET 228

#define PROC_FILENAME_SIZE 64
#define TOOLS_LIST_SIZE 10

typedef  struct poly_object {
    void (*func_addr)();
    size_t opcodes_size;
    uint8_t *opcodes;
    uint16_t offset;
}poly_object;

void part_1_debug(char *user_entry, int *valid_part);
void part_1_disass(char *user_entry, int *valid_part);
void part_1_specific_asm(char *user_entry, int *valid_part);
void part_1_end();

void part_2_debug(char *user_entry, int *valid_part);
void part_2_disass(char *user_entry, int *valid_part);
void part_2_specific_asm(char *user_entry, int *valid_part);
void part_2_end();

void part_3_debug(char *user_entry, int *valid_part);
void part_3_disass(char *user_entry, int *valid_part);
void part_3_specific_asm(char *user_entry, int *valid_part);
void part_3_end();
#endif 
