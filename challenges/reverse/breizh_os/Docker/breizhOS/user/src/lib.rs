#![no_std]

use kernel::io::STDOUT;
use kernel::print;

pub fn hello() -> () {
    print!();
    print!("Hello World depuis l'utilisateur land ;)\n");
}