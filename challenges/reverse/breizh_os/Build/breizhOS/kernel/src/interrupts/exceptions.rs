use core::sync::atomic::Ordering;
use crate::interrupts::*;
use crate::prng::PRNG_RUNNING;

pub extern "x86-interrupt" fn default_exception(_: InterruptStackFrame) -> () {}

pub extern "x86-interrupt" fn tss_exception(_: InterruptStackFrame) -> () {
    use crate::io::STDOUT;
    use crate::print;
    print!("EXCEPTION: TSS ERROR\n");
}

pub extern "x86-interrupt" fn breakpoint_exception(_: InterruptStackFrame) -> () {
    PRNG_RUNNING.store(!PRNG_RUNNING.load(Ordering::Relaxed), Ordering::Relaxed);    
}