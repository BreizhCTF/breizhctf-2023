use core::fmt::Arguments;
use lazy_static::lazy_static;
use spin::Mutex;
use uart_16550::SerialPort;

lazy_static! {
    pub static ref SERIAL: Mutex<SerialPort> = {
        let mut serial = unsafe { SerialPort::new(0x3F8) };
        serial.init();
        Mutex::new(serial)
    };
}

pub fn serial_print(args: Arguments) -> () {
    use core::fmt::Write;
    SERIAL.lock().write_fmt(args).unwrap();
}

#[macro_export]
macro_rules! serial_print {
    ($($arg:tt)*) => {
        crate::serial::serial_print(format_args!($($arg)*));
    };
}