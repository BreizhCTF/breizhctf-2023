#![no_std]
#![no_main]

use core::panic::PanicInfo;
use kernel::gdt::install_segmentation;
use kernel::io::STDOUT;
use kernel::interrupts::install_interrupts;
use kernel::print;
use kernel::prng::install_prng;
use kernel::user::to_user;

#[no_mangle]
pub extern "C" fn kmain(rand: extern fn() -> u16) -> () {
    print!();
    print!("BreizhOS: init begin\n");
    install_segmentation();
    install_prng(rand());
    install_interrupts();
    print!("BreizhOS: init end\n");
    print!("BreizhOS: good luck !!\n");
    to_user(0x30000, 0x50000);
}

#[panic_handler]
fn panic_handler(_: &PanicInfo) -> ! { loop {} }