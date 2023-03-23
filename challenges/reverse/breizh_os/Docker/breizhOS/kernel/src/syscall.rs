use crate::prng::PRNG;
use crate::secret::FLAG;
use crate::serial_print;

pub static SYSCALLS: [extern "C" fn(u64) -> u64 ; 3] = [
    sys_ticks,
    sys_sign,
    sys_flag
];

#[inline]
pub extern "C" fn syscall(rdi: u64, rsi: u64) -> u64 {
    match rdi {
        0..=2 => SYSCALLS[rdi as usize](rsi),
        _     => u64::MAX
    }
}

pub extern "C" fn sys_ticks(_: u64) -> u64 {
    PRNG.lock().get_ticks()
}

pub extern "C" fn sys_sign(rsi: u64) -> u64 {
    PRNG.lock().sign(rsi) as u64
}

pub extern "C" fn sys_flag(rsi: u64) -> u64 {
    if rsi == PRNG.lock().get_find_me() {
        serial_print!("Voici le flag: {}\n", FLAG);
        1
    } else {
        serial_print!("Nope...\n");
        0
    }
}