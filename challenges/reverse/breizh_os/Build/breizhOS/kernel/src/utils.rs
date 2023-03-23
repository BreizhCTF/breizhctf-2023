use core::arch::asm;

#[inline]
pub fn enable_interrupts() -> () {
    unsafe {asm!("sti", options(nomem, nostack));}
}

#[inline]
pub fn disable_interrupts() -> () {
    unsafe {asm!("cli", options(nomem, nostack));}
}

pub fn tempo() -> () {}