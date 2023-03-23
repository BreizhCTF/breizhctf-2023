use core::sync::atomic::{AtomicBool, Ordering};
use lazy_static::lazy_static;
use spin::Mutex;
use crate::secret::FIND_ME;

pub static PRNG_RUNNING: AtomicBool = AtomicBool::new(false);

lazy_static! {
    pub static ref PRNG: Mutex<VonNeumannPrng> = Mutex::new(VonNeumannPrng::new(0));
}

pub fn install_prng(seed: u16) -> () {
    //
    // This function install the prng in the static mutex
    //
    // Parameters:
    //  - seed<u16> : The seed to use for prng init
    //
    PRNG.lock().set_seed(seed);
    PRNG_RUNNING.store(true, Ordering::Relaxed);
}

pub struct VonNeumannPrng {
    //
    // This struct is the implementation of a Von Neumann PRNG, and implement some...
    // interesting features...
    //
    // Fields:
    //  - rand<u16>    : The current randomly generated number
    //  - ticks<u64>   : Number of times the prng had been updated 
    //  - find_me<u64> : !!!!!!!! Find me !!!!!!!! 
    //
    rand:    u16,
    ticks:   u64,
    find_me: u64
}

impl VonNeumannPrng {

    #[inline]
    pub fn new(seed: u16) -> Self {
        //
        // Create a new prng instance
        // NOTE: find_me is not set to the real value ;-)
        //
        // Parameters:
        //  - seed<u16> : The seed to init the prng
        //
        // Return:
        //  - new<VonNeumannPrng> : The newly instanciated prng
        //
        Self { rand: seed, ticks: 0, find_me: FIND_ME }
    }

    pub fn set_seed(self: &mut Self, seed: u16) -> () {
        //
        // Set seed and replace self
        //
        // Parameters:
        //  - seed<u16> : The seed to init the prng
        //
        *self = Self::new(seed);
    }

    pub fn get_rand(self: &Self) -> u16 {
        //
        // Get current randomly generated number
        //
        // Return:
        //  - rand<u16> : The random number
        //
        self.rand
    }

    pub fn get_find_me(self: &Self) -> u64 {
        //
        // Get find me number
        //
        // Return:
        //  - find_me<u64> : The find me number
        //
        self.find_me
    }

    pub fn get_ticks(self: &Self) -> u64 {
        //
        // Get current number of ticks
        //
        // Return:
        //  - ticks<u64> : The number of ticks
        //
        self.ticks
    }

    pub fn update(self: &mut Self) -> () {
        //
        // Update the random
        //
        self.rand = ((self.rand as u32).pow(2)>>8) as u16;
        self.ticks += 1;
    }

    pub fn sign(self: &mut Self, to_sign: u64) -> u16 {
        //
        // Sign a data with an extremely complicated process ;-)
        //
        // Parameters:
        //  - to_sign<u64> : Data to sign
        //
        // Return:
        //  - signed<u16> : The signature
        //
        ((to_sign + self.find_me) % self.rand as u64) as u16
    }
}