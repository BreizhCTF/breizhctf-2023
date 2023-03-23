use std::path::Path;

fn main() {
    println!(
        "cargo:rustc-link-arg-bins=--script={}",
        Path::new(env!("CARGO_MANIFEST_DIR")).join("kernel.ld").display()
    )
}