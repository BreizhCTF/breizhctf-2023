#![no_std]
#![no_main]

use core::panic::PanicInfo;
use user::*;

#[no_mangle]
pub extern "C" fn umain() -> () {
    Solver::new().solve();
    loop {} // Important to don't return ;)
}

#[panic_handler]
fn panic_handler(_: &PanicInfo) -> ! { loop {} }