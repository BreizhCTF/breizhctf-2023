use core::arch::asm;
use crate::utils::tempo;

enum Pic8259Command {
    InitSequence = 0x10
}
pub struct Pic8259();

impl Pic8259 {
    fn send_command_to_master(value: u8) -> () {
        //
        // This function send byte to pic master command port
        //
        // Parameters:
        //  - value<u8> : The value to communicate
        //
        unsafe {asm!(
            "out 0x20, al", 
            in("al") value, 
        );}
    }

    fn send_data_to_master(value: u8) -> () {
        //
        // This function send byte to pic master data port
        //
        // Parameters:
        //  - value<u8> : The value to communicate
        //
        unsafe {asm!(
            "out 0x21, al", 
            in("al") value, 
        );}
    }

    fn send_command_to_slave(value: u8) -> () {
        //
        // This function send byte to pic slave command port
        //
        // Parameters:
        //  - value<u8> : The value to communicate
        //
        unsafe {asm!(
            "out 0xa0, al", 
            in("al") value, 
        );}
    }

    fn send_data_to_slave(value: u8) -> () {
        //
        // This function send byte to pic slave data port
        //
        // Parameters:
        //  - value<u8> : The value to communicate
        //
        unsafe {asm!(
            "out 0xa1, al", 
            in("al") value, 
        );}
    }

    pub fn ack_master() -> () {
        //
        // Ack for master
        //
        Pic8259::send_command_to_master(0x20);
    }

    pub fn ack_slave() -> () {
        //
        // Ack for slave
        //
        Pic8259::send_command_to_slave(0x20);
    }

    pub fn disable() -> () {
        //
        // Disable the PIC
        //
        Pic8259::send_data_to_master(0xff);
        Pic8259::send_data_to_slave(0xff);
    }

    pub fn enable() -> () {
        //
        // Enable the PIC
        //
        Pic8259::send_data_to_master(0x00);
        Pic8259::send_data_to_slave(0x00);
    }

    pub fn remap() -> () {
        //
        // This function intent to remap the irq 
        // with a base of 0x20
        //
        Pic8259::send_command_to_master(Pic8259Command::InitSequence as u8);
        tempo();
        Pic8259::send_command_to_slave(Pic8259Command::InitSequence as u8);
        tempo();

        Pic8259::send_data_to_master(0x20);
        tempo();
        Pic8259::send_data_to_slave(0x28);
        tempo();

        Pic8259::send_data_to_master(4);
        tempo();
        Pic8259::send_data_to_slave(2);
        tempo();

        Pic8259::send_data_to_master(1);
        tempo();
        Pic8259::send_data_to_slave(1);
        tempo();

        Pic8259::send_data_to_master(0);
        tempo();
        Pic8259::send_data_to_slave(0);
        tempo();
    }
}