use core::arch::asm;
use lazy_static::lazy_static;
use crate::interrupts::*;
use crate::interrupts::exceptions::*;
use crate::interrupts::interrupts::*;

lazy_static! {
    pub static ref IDT_TABLE:      IdtTable      = IdtTable::new();
    pub static ref IDT_DESCRIPTOR: IdtDescriptor = IdtDescriptor::new(IDT_TABLE.get_addr());
}

#[derive(Debug, Clone, Copy)]
#[repr(C, packed(2))]
pub struct IdtDescriptor {
    size: u16,
    addr: u64
}

impl IdtDescriptor {
    pub fn new(idt: u64) -> Self {
        Self { size: 256*16, addr: idt }
    }

    pub fn get_addr(self: &Self) -> u64 {
        self as *const _ as u64
    }
}

#[derive(Debug, Clone, Copy)]
#[repr(transparent)]
pub struct IdtTable {
    table: [IdtEntry; 256]
}

impl IdtTable {
    #[inline]
    pub fn new() -> Self {
        Self { table: [
/* 0x00 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x01 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x02 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x03 */  IdtEntry::new(breakpoint_exception, GateType::Trap as u8, Dpl::Ring3 as u8),
/* 0x04 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x05 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x06 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x07 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x08 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x09 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x0a */  IdtEntry::new(tss_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x0b */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x0c */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x0d */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x0e */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x0f */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x10 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x11 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x12 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x13 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x14 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x15 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x16 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x17 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x18 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x19 */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x1a */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x1b */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x1c */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x1d */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x1e */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x1f */  IdtEntry::new(default_exception, GateType::Trap as u8, Dpl::Ring0 as u8),
/* 0x20 */  IdtEntry::new(timer_interrupt, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x21 */  IdtEntry::new(default_interrupt_hard_0, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x22 */  IdtEntry::new(default_interrupt_hard_0, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x23 */  IdtEntry::new(default_interrupt_hard_0, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x24 */  IdtEntry::new(default_interrupt_hard_0, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x25 */  IdtEntry::new(default_interrupt_hard_0, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x26 */  IdtEntry::new(default_interrupt_hard_0, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x27 */  IdtEntry::new(default_interrupt_hard_0, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x28 */  IdtEntry::new(default_interrupt_hard_1, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x29 */  IdtEntry::new(default_interrupt_hard_1, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x2a */  IdtEntry::new(default_interrupt_hard_1, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x2b */  IdtEntry::new(default_interrupt_hard_1, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x2c */  IdtEntry::new(default_interrupt_hard_1, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x2d */  IdtEntry::new(default_interrupt_hard_1, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x2e */  IdtEntry::new(default_interrupt_hard_1, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x2f */  IdtEntry::new(default_interrupt_hard_1, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x30 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x31 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x32 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x33 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x34 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x35 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x36 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x37 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x38 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x39 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x3a */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x3b */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x3c */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x3d */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x3e */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x3f */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x40 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x41 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x42 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x43 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x44 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x45 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x46 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x47 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x48 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x49 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x4a */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x4b */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x4c */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x4d */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x4e */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x4f */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x50 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x51 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x52 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x53 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x54 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x55 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x56 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x57 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x58 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x59 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x5a */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x5b */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x5c */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x5d */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x5e */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x5f */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x60 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x61 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x62 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x63 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x64 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x65 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x66 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x67 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x68 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x69 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x6a */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x6b */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x6c */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x6d */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x6e */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x6f */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x70 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x71 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x72 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x73 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x74 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x75 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x76 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x77 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x78 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x79 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x7a */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x7b */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x7c */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x7d */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x7e */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x7f */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x80 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x81 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x82 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x83 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x84 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x85 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x86 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x87 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x88 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x89 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x8a */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x8b */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x8c */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x8d */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x8e */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x8f */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x90 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x91 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x92 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x93 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x94 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x95 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x96 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x97 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x98 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x99 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x9a */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x9b */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x9c */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x9d */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x9e */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0x9f */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa0 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa1 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa2 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa3 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa4 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa5 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa6 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa7 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa8 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xa9 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xaa */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xab */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xac */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xad */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xae */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xaf */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb0 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb1 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb2 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb3 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb4 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb5 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb6 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb7 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb8 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xb9 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xba */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xbb */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xbc */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xbd */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xbe */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xbf */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc0 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc1 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc2 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc3 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc4 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc5 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc6 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc7 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc8 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xc9 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xca */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xcb */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xcc */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xcd */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xce */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xcf */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd0 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd1 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd2 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd3 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd4 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd5 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd6 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd7 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd8 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xd9 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xda */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xdb */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xdc */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xdd */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xde */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xdf */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe0 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe1 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe2 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe3 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe4 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe5 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe6 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe7 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe8 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xe9 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xea */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xeb */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xec */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xed */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xee */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xef */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf0 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf1 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf2 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf3 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf4 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf5 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf6 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf7 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf8 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xf9 */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xfa */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xfb */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xfc */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xfd */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xfe */  IdtEntry::new(default_interrupt_soft, GateType::Interrupt as u8, Dpl::Ring0 as u8),
/* 0xff */  IdtEntry::new(syscall_interrupt, GateType::Interrupt as u8, Dpl::Ring3 as u8),        
        ]}
    }

    pub fn get(self: &Self, index: usize) -> IdtEntry {
        self.table[index]
    }

    pub fn get_addr(self: &Self) -> u64 {
        self as *const _ as u64
    }
}

pub enum GateType {
    Interrupt = 0xe,
    Trap      = 0xf
}

pub enum Dpl {
    Ring0 = 0x00,
    Ring3 = 0x03
}

#[derive(Debug, Clone, Copy)]
#[repr(C, packed)]
pub struct IdtEntry {
    offset_low:            u16,
    segment_code_selector: u16,
    zero1:                 u8,
    type_dpl_present:      u8,
    offset_mid:            u16,
    offset_high:           u32,
    zero2:                 u32
}

impl IdtEntry {
    #[inline]
    pub fn new(code: extern "x86-interrupt" fn(InterruptStackFrame) -> (), gate_type: u8, dpl: u8) -> Self {
        let code: u64 = code as u64;
        Self {
            offset_low:            code as u16,
            offset_mid:            (code>>16) as u16,
            offset_high:           (code>>32) as u32,
            segment_code_selector: 0x08,
            type_dpl_present:      0x80 | gate_type | (dpl << 5),
            zero1:                 0,
            zero2:                 0
        }
    }

    #[inline]
    pub fn get_addr(self: &Self) -> u64 {
        self.offset_low as u64 | ((self.offset_mid as u64) << 16) | ((self.offset_high as u64) << 32)
    }
}

pub struct Idt {}

impl Idt {
    pub fn install() -> () {
        unsafe {asm!("lidt [{}]", in(reg) IDT_DESCRIPTOR.get_addr(), options(readonly, nostack, preserves_flags));}
    }
}