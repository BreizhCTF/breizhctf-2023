use core::arch::asm;
use lazy_static::lazy_static;

lazy_static! {
    pub static ref TSS: Tss = {
        let mut tss: Tss = Tss::new();
        static mut KSTACK: [u8;4096] = [0;4096];
        tss.privileged_stacks[0] = (unsafe { &KSTACK[4095] } as *const _ as u64) + 1;
        tss
    };
    pub static ref GDT_TABLE:      GdtTable      = GdtTable::new();
    pub static ref GDT_DESCRIPTOR: GdtDescriptor = GdtDescriptor::new(GDT_TABLE.get_addr(), GdtTable::get_len() as u16);
}

//
// TSS part
//
#[derive(Debug, Clone, Copy)]
#[repr(C, packed(4))]
pub struct Tss {
    zero1:                 u32,
    pub privileged_stacks: [u64; 3],
    zero2:                 u64,
    pub interrupt_stacks:  [u64; 7],
    zero3:                 u64,
    zero4:                 u16,
    iomap_offset:          u16
}

impl Tss {
    pub fn new() -> Self {
        Self {
            zero1:             0,
            zero2:             0,
            zero3:             0,
            zero4:             0,
            privileged_stacks: [0;3],
            interrupt_stacks:  [0;7],
            iomap_offset:      104
        }
    }

    pub fn install() -> () {
        unsafe {asm!("ltr {0:x}", in(reg) 0x28, options(readonly, nostack, preserves_flags));}
    }

    pub fn get_addr(self: &Self) -> u64 {
        self as *const _ as u64
    }

    pub fn get_len() -> usize {
        104
    }
}

//
// GDT part
//

#[derive(Debug, Clone, Copy)]
#[repr(C, packed(2))]
pub struct GdtDescriptor {
    size: u16,
    addr: u64
}

impl GdtDescriptor {
    pub fn new(addr: u64, len: u16) -> Self {
        Self { size: (len*16) as u16, addr: addr }
    }

    pub fn get_addr(self: &Self) -> u64 {
        self as *const _ as u64
    }
}

#[derive(Debug, Clone, Copy)]
#[repr(transparent)]
pub struct GdtTable {
    _table: [u64; 7]
}

impl GdtTable {
    #[inline]
    pub fn new() -> Self {
        let tss: (u64, u64) = GdtEntry::system_descriptor(
            TSS.get_addr(),
            Tss::get_len() as u32,
            0x0,
            0x89
        );
        // use crate::print; use crate::io::STDOUT;
        // print!("{:x}, {:x}\n", (tss.0 as u128) | ((tss.1 as u128)<<64), TSS.get_addr()); loop {}
        Self { _table: [
/* Null entry        */ GdtEntry::segment_descriptor(0, 0),
/* Kernel code entry */ GdtEntry::segment_descriptor(0xa, 0x9a),
/* Kernel data entry */ GdtEntry::segment_descriptor(0xc, 0x92),
/* User code entry   */ GdtEntry::segment_descriptor(0xa, 0xfa),
/* User data entry   */ GdtEntry::segment_descriptor(0xc, 0xf2),
/* TSS entry         */ tss.0,
                        tss.1
        ] }
    }

    pub fn get_len() -> usize {
        7*8 - 1
    }

    pub fn get_addr(self: &Self) -> u64 {
        self as *const _ as u64
    }
}

pub struct GdtEntry {}

impl GdtEntry {
    #[inline]
    pub fn system_descriptor(base: u64, limit: u32, flags: u8, access_byte: u8) -> (u64, u64) {
        (
            (limit&0xffff) as u64 | ((base&0xffffff) << 16) | ((access_byte as u64) << 40) | (((limit&0xf0000) as u64) << 32) | ((flags as u64) << 48) | ((base&0xff000000) << 32),
            base>>32
        )
    }

    #[inline]
    pub fn segment_descriptor(flags: u8, access_byte: u8) -> u64 {
        ((access_byte as u64)<<40) | ((flags as u64)<<52)
    }
}

pub struct Gdt {}

impl Gdt {
    pub fn install() -> () {
        unsafe {asm!(
            "lgdt [{}]",
            in(reg) GDT_DESCRIPTOR.get_addr(), 
            options(readonly, nostack, preserves_flags)
        );}
        unsafe {asm!(
            "push 0x8",
            "lea {tmp}, [1f + rip]",
            "push {tmp}",
            "retfq",
            "1:",
            tmp = lateout(reg) _,
            options(preserves_flags),
        );}
    }
}

//
// Merge
//
pub fn install_segmentation() -> () {
    Gdt::install();
    Tss::install();
}