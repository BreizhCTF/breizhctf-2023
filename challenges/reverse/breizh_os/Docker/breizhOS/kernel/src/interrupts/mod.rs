pub mod exceptions;
pub mod idt;
pub mod interrupts;
pub mod pic;

use crate::interrupts::idt::Idt;
use crate::interrupts::pic::Pic8259;
use crate::utils::enable_interrupts;

#[derive(Debug)]
#[repr(C, packed(8))]
pub struct InterruptStackFrame {
    pub rip:    u64,
    pub cs:     u64,
    pub eflags: u64,
    pub rsp:    u64,
    pub ss:     u64
}

pub fn install_interrupts() -> () {
    //
    // This function is in charge of setting all interruptions
    // types up.
    //
    Idt::install();
    Pic8259::remap();
    Pic8259::enable();
    enable_interrupts();
}