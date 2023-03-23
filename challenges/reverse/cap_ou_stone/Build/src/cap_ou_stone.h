#ifndef _CAP_OU_STONE_H
#define _CAP_OU_STONE_H 
#include "../libs/keystone/includes/keystone.h"
#include "../libs/capstone/include/capstone/capstone.h"
#include <stdio.h>
#include <string.h>
#include <stdint.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <unistd.h>

#define FIRST_SLICE_SIZE 8
#define SECOND_SLICE_SIZE 3
#define TO_ASSEMBLE_MAX_SIZE 20 

#define SECOND_SLICE "\x66\x2D\xEF\xBE\x66\x01\xC0\xB0\x11" //"%s ax, 0xBEEF;"  mov, xor works
#define SECOND_SLICE_SIZE_1 4
//#define SECOND_SLICE_2 "\x66\x01\xC0" //"%s ax, ax;" xor works
//#define SECOND_SLICE_3 "\xB0\x11" //"%s ax, 0x11;"  and works 

#define THIRD_SLICE_SIZE 3 
#define THIRD_SLICE "\x49\xC1\xEB\x02\x48\xF7\xD8\xF7\xD6" // =>  
// 49 c1 eb 02             shr     r11,0x2 => rbx,0x2
// 48 f7 d8                neg     neg rax => r10
// f7 d6                   not     not esi => ecx 
#define THIRD_SLICE_SIZE_1 4

#endif 
