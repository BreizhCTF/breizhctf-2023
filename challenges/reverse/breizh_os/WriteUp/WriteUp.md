BreizhCTF 2023 - Breizh OS
==========================

### Challenge details

| Event                    | Challenge  | Category       | Points | Solves      |
|--------------------------|------------|----------------|--------|-------------|
| BreizhCTF 2023           | Breizh OS  | Reverse        | ???    | ???         |


Dans ce challenge, vous allez goûter à la crème de la crème de la signature Bretonne !
Un OS maison, spécialement concu pour l'occasion, implémente un cryptosystème de signature avec une clé secrète. Saurez-vous la récupérer ?
Afin de résoudre ce challenge, vous allez devoir construire un ELF et l'envoyer sur notre VM BreizhOS. Nous lançerons ce binaire avec un utilisateur standard en vous renvoyant l'output du binaire seulement.
Pensez à regarder les link et différents scripts pour comprendre comment le fonctionnement de l'OS pour concevoir votre binaire.

https://breizhos.breizh.ctf/

### TL;DR

TL;DR

### Méthodologie

#### Dégrossir !
Dans un premier temps, on télécharge l'archive, et on regarde son contenu :
```bash
aigle@aigle:~/p/g/b/breizhOS:[0]→ tree                                                    (Wed Feb  1 19:07:08 CET 2023)
.
├── Makefile
├── bootloader
│   ├── Makefile
│   └── src
│       ├── bootloader_s1.asm
│       └── bootloader_s2.asm
├── kernel
│   ├── Cargo.lock
│   ├── Cargo.toml
│   ├── Makefile
│   ├── build.rs
│   ├── kernel.ld
│   ├── src
│   │   ├── bin
│   │   │   └── kmain.rs
│   │   ├── gdt.rs
│   │   ├── interrupts
│   │   │   ├── exceptions.rs
│   │   │   ├── idt.rs
│   │   │   ├── interrupts.rs
│   │   │   ├── mod.rs
│   │   │   └── pic.rs
│   │   ├── io.rs
│   │   ├── lib.rs
│   │   ├── prng.rs
│   │   ├── secret.rs
│   │   ├── serial.rs
│   │   ├── syscall.rs
│   │   ├── user.rs
│   │   └── utils.rs
│   └── x86_64-kernel.json
├── link.ld
└── user
    ├── Cargo.lock
    ├── Cargo.toml
    ├── Makefile
    ├── build.rs
    ├── src
    │   ├── lib.rs
    │   └── main.rs
    ├── user.ld
    └── x86_64-user.json
```

Ouch ! Ca en fait des fichiers ! Allons y de manière méthodique : l'ennoncé nous parle d'OS custom, et la nomenclature des fichiers nous rappelle bien un système d'exploitation; on retrouve un bootloader, un kernel et un programme utilisateur dans user. Un rapide coup d'oeil au link.ld permet de déduire ceci : 
```
0x7c00-0x7e00   : stage 1
0x7e00-0x10000  : stage 2
0x10000-0x30000 : kernel
après           : userspace
```
Lancons l'analyse par le commencement : le bootloader. Le stage 1 load le reste du kernel/user et nous lance en mode protégé. Le stage 2 va setup le mode long, la pagination et lancer le kernel en lui passant un blob d'octets. Avant d'aller plus loin, analysons la pagination en fin du stage 2. 4 niveaux, c'est plutôt cohérent avec un processeur intel en mode long, et la seule table des pages disponible map de `[0-0x30000[` en kernel-restricted et le reste en user-accessible. Ce mapping paraît cohérent avec le fichier link.ld préceddement analysé (au delè de 0x30000 se trouve l'espace utilisateur). Maintenant, il est temps de mettre les mains dans le dur !

#### Comprendre le kernel

En ouvrant le kmain, on remarque que ce fichier est petit. Si on se fie aux noms des symboles : 
- le kernel prend une fonction en entrée; le fameux blob d'octets est donc une fonction.
- setup la segmentation
- initialise un generateur de nombres aléatoires dont la seed est le resultat de la fonction passée au kernel
- installe les interuptions
- jump sur le code utilisateur

#### La segmentation

Une rapide analyse nous montre qu'on setup une TSS et une GDT avec une configuration plutôt classique. Rien à signaler.

#### Les interruptions

Globalement :
- int 0x20 (timer)      = Avance le generateur de nombres aleatoires
- int 0x03 (breakpoint) = Stop le generateur de nombres aleatoires
- int 0xff              = Les syscalls !!

#### Syscalls

On peut trigger le syscall_n(m) en mettant n dans rdi, m dans rsi et en lancant l'interruption 0xff. Le retour est dans rax.
Les syscalls sont :
- sys_ticks() => donne le nombre de tours qu'a fait le generateur
- sys_sign(i) => signe i et le renvoi
- sys_flag(i) => si i == find_me, alors affiche le flag sur la liaison série

#### Le generateur

Un generateur de von neuman est initialisé avec une seed pour le moment inconnue. Des fonctions permettent d'utiliser ce générateur pour effectuer des signatures. La signature est :
```
signature = (a_signer + find_me) % nombre_aleatoire_courant
```
find_me et a_signer sont sur 64 bits, le modulo sur 16.

#### La seed

Le blob binaire une fois decompilé est une checksum tout à fait prévisible, on connaît donc la seed utilisée sur l'instance distante.

#### Ce qu'on maitrise

On maitrise : 
- Ni, la sortie i du generateur de nombres aléatoires.
- Yi, la sortie i de la fonction signature.
- Xi, l'entrée i de la fonction de signature.

#### Plan d'attaque

On peut donc generer des couples de la forme suivante :
```
Ya = Xa + FINDME [Na]
Yb = Xb + FINDME [Nb]
...
Yn = Xn + FINDME [Nn]
```
Ce qui rappelle le théorème des restes chinois. Si je mets Xi à 0, et que j'ai mes Ni premiers deux à deux, je peux retrouver FINDME !

#### Mise en pratique

Au vu du fichier link.ld, et de la fonction to_user, je sais que je dois créér un ELF mappé en 0x30000. Le dossier user propose d'ailleurs un squelette contenant un hello_world pour compiler un projet qui fonctionnel. Je vais pouvoir réutiliser la crate kernel, donc les io (comme le buffer graphique est vers 0xb8000 qui est mappé userland) et la partie prng (pseudo random number generator).

Voici le code commenté que j'ai complété dans lib.rs :

```rust
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
```

et le main est quasi identique :

```rust
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
```

Je teste le code en local en settant un flag et un find_me dans le fichier secret.rs, et le lance avec les commandes :

```bash
make build
make run
```

Ca fonctionne, donc je submit le binaire de mon user, et hop le tour est joué.

# Flag

`BZHCTF{--tRUST_me_i_m_an_engineer--}`