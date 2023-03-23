use core::sync::atomic::Ordering;
use crate::interrupts::*;
use crate::interrupts::pic::Pic8259;
use crate::prng::{PRNG, PRNG_RUNNING};
use crate::syscall::syscall;

pub extern "x86-interrupt" fn default_interrupt_hard_0(_: InterruptStackFrame) -> () {
    Pic8259::ack_master();
}

pub extern "x86-interrupt" fn default_interrupt_hard_1(_: InterruptStackFrame) -> () {
    Pic8259::ack_master();
    Pic8259::ack_slave();
}

pub extern "x86-interrupt" fn timer_interrupt(_: InterruptStackFrame) -> () {
    if PRNG_RUNNING.load(Ordering::Relaxed) {
        PRNG.lock().update();    
    }
    Pic8259::ack_master();
}

pub extern "x86-interrupt" fn default_interrupt_soft(_: InterruptStackFrame) -> () {}

#[naked]
pub extern "x86-interrupt" fn syscall_interrupt(_: InterruptStackFrame) -> () {
    unsafe{core::arch::asm!(
        "cli",
        "push rbx",
        "push rcx",
        "push rdx",
        "push rsi",
        "push rdi",
        "push r8",
        "push r9",
        "push r10",
        "push r11",
        "push r12",
        "push r13",
        "push r14",
        "push r15",
        "call {}",
        "pop r15",
        "pop r14",
        "pop r13",
        "pop r12",
        "pop r11",
        "pop r10",
        "pop r9",
        "pop r8",
        "pop rdi",
        "pop rsi",
        "pop rdx",
        "pop rcx",
        "pop rbx",
        "sti",
        "iretq",
        sym syscall,
        options(noreturn)
    );}
}