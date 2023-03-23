use core::fmt::{self, Write};
use lazy_static::lazy_static;
use spin::Mutex;

lazy_static! {
    pub static ref STDOUT: Mutex<Stdout> = Mutex::new(Stdout::new());
}

#[repr(transparent)]
struct ScreenBuffer {
    screen: [[u16; 80]; 25]
}

pub struct Stdout {
    //
    // This struct is the representation of the stdout, using the basic 
    // 0xB8000 video buffer
    //
    // Fields:
    //  - cur_line<u8>                         : The current line which support the cursor
    //  - cur_char<u8>                         : The current offset of the cursor in the current line
    //  - buffer<&'static mut ScreenBuffer>    : The screen buffer
    //
    pub cur_line : u8,
    pub cur_char : u8,
    buffer   : &'static mut ScreenBuffer
}

impl Stdout {

    #[inline]
    pub fn new() -> Self {
        //
        // This is the constructor for a new Stdout
        //
        // Return:
        //  - new<Stdout> : Zero initialized stdout
        //
        Self { cur_char: 0u8, cur_line: 0u8, buffer:  unsafe { &mut *(0xb8000 as *mut ScreenBuffer) } }
    }

    #[inline]
    pub fn new_line(self: &mut Self) -> () {
        //
        // This function goes to newline
        //
        self.cur_line = (self.cur_line + 1) % 25;
        self.cur_char = 0;
    }

    #[inline]
    pub fn inc_cursor(self: &mut Self) -> () {
        //
        // This function increments the cursor position
        //
        self.cur_char = (self.cur_char + 1) % 80;
        if self.cur_char == 0 {
            self.cur_line = (self.cur_line + 1) % 25;
        }
    }

    #[inline]
    pub fn putchar(self: &mut Self, chr: u8) -> () {
        //
        // This function print chr and inc the cursor.
        // There is exceptions:
        //  - 0x0a : Inc the current line
        //
        // Parameters:
        //  - chr<u8> : The char to print
        //
        match chr {
            b'\n' => self.new_line(),
            _ => {
                //
                // TODO: Parametrize colors
                //
                self.buffer.screen[self.cur_line as usize][self.cur_char as usize] =  (0x0f00u16 | chr as u16) as u16;
                self.inc_cursor();
            }
        }
    }

    pub fn print_str(self: &mut Self, p: &str) -> () {
        //
        // Print a string on the screen
        //
        // Parameters:
        //  - p<&str> : The string to print
        //
        for c in p.bytes() {
            self.putchar(c);
        }
    }

    pub fn print_fmt(self: &mut Self, p: fmt::Arguments) -> () {
        //
        // Print a core::fmt::Arguments on the screen
        //
        // Parameters:
        //  - p<&str> : The string to print
        //
        self.write_fmt(p).unwrap();
    }

    pub fn clear(self: &mut Self) -> () {
        //
        // Clear the screen
        //
        self.cur_char = 0;
        self.cur_line = 0;
        for _ in 0..(80*25) {
            self.putchar(b' ');
        }
    }

}

impl fmt::Write for Stdout {
    fn write_str(&mut self, s: &str) -> fmt::Result {
        self.print_str(s);
        Ok(())
    }
}

#[macro_export]
macro_rules! print {
    ()            => (STDOUT.lock().clear());
    ($($arg:tt)*) => (STDOUT.lock().print_fmt(format_args!($($arg)*)));
}