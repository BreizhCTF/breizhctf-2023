#![no_std]

use core::arch::asm;
use kernel::io::STDOUT;
use kernel::print;
use kernel::prng::{install_prng, PRNG};

pub fn syscall(number: u64, param: u64) -> u64 {
    //
    // Fonction généraliste pour faire un syscall selon l'ABI découverte
    //
    let tmp: u64;
    unsafe{asm!(
        "int 0xff",
        "mov {}, rax",
        out(reg) tmp,
        in("rdi") number,
        in("rsi") param
    )}
    tmp
}

//
// Wrappers autour de la fonction syscall simplifiant l'appel d'un syscall donné
//
pub fn get_ticks() -> u64 {
    syscall(0, 0)
}

pub fn get_sign(to_sign: u64) -> u16 {
    syscall(1, to_sign) as u16
}

pub fn get_flag(find_me: u64) -> u64 {
    syscall(2, find_me)
}

pub fn stop_prng() -> () {
    unsafe{asm!(
        "int3"
    );}
}

pub struct Solver {}

impl Solver {
    pub fn new() -> Self {
        install_prng(0xd2cd); // Initialisation du PRNG avec la seed calculée en jouant la fonction rand() sur les bons bytes de l'image breizhOS.img compilée en local
        Self {}
    }

    pub fn wait(&self) -> () {
        while get_ticks() != PRNG.lock().get_ticks() {}
    }

    pub fn solve(self: &Self) -> () {
        // On part du principe que 6 inputs nous permettent de trouver un mot de 64 bits
        let mut residues: [i128;6] = [0;6];
        let mut modulus:  [i128;6] = [0;6];
        let mut index:    usize    = 0;

        while index != residues.len() {
            stop_prng(); // On arrête le PRNG
            let ticks: u64 = get_ticks();
            while PRNG.lock().get_ticks() != ticks { PRNG.lock().update(); } // On met le nôtre à jour
            let (signed, rand): (u64, u64) = (get_sign(0) as u64, PRNG.lock().get_rand() as u64); // On signe 0 et on récupère le modulo actuel
            
            // Si on a pas encore d'échantillons ou que le modulo actuel est coprime de tous les précédents, on récolte la signature et le modulo
            if index == 0 || verif_coprime(&modulus[..index], rand as i128) {
                residues[index] = signed as i128;
                modulus[index]  = rand as i128;
                index += 1;
            }

            // On fait avancer nôtre prng, on relance celui du noyau et on attend qu'il tourne
            PRNG.lock().update();
            stop_prng();
            self.wait();
        }

        // On applique notre CRT, et on tente de submit le résultat au noyau.
        if let Some(find_me) = chinese_remainder(&residues, &modulus) {
            get_flag(find_me as u64);
        } else {
            print!("CRT can't be applied...");
        }

    } 
}

//
// Les maths :) merci internet pour les snippets de code
//
fn verif_coprime(modulus: &[i128], verif: i128) -> bool {
    for modulu in modulus {
        if egcd(*modulu, verif).0 != 1 { return false; }
    }
    true
}

fn egcd(a: i128, b: i128) -> (i128, i128, i128) {
    if a == 0 {
        (b, 0, 1)
    } else {
        let (g, x, y) = egcd(b % a, a);
        (g, y - (b / a) * x, x)
    }
}

fn mod_inv(x: i128, n: i128) -> Option<i128> {
    let (g, x, _) = egcd(x, n);
    if g == 1 {
        Some((x % n + n) % n)
    } else {
        None
    }
}

fn chinese_remainder(residues: &[i128], modulii: &[i128]) -> Option<i128> {
    let prod = modulii.iter().product::<i128>();

    let mut sum = 0;

    for (&residue, &modulus) in residues.iter().zip(modulii) {
        let p = prod / modulus;
        sum += residue * mod_inv(p, modulus)? * p
    }

    Some(sum % prod)
}