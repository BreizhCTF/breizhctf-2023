use core::arch::asm;

pub fn to_user(code: u64, stack: u64) -> () {
    unsafe{
        // asm!(
        //     "mov ax, 0x23",
        //     "mov ds, ax",
        //     "mov es, ax",
        //     "mov fs, ax",
        //     "mov gs, ax"
        // );
        asm!(
            "push 0x23",
            "push rax",
            "push 0x202",
            "push 0x1b",
            "push rcx",
            "iretq",
            in("rax") stack,
            in("rcx") code
        );
    }
}