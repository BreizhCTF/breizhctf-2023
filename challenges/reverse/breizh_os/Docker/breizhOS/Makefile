IMG      = img/breizhOS.img
LD       = ld
LD_FLAGS = -T link.ld -o $(IMG)

clear:
	$(MAKE) -C bootloader clear
	$(MAKE) -C kernel clear
	$(MAKE) -C user clear
	rm -rf bin img
	
init:
	mkdir -p bin img

bootloader:
	$(MAKE) -C bootloader build
	mv bootloader/bin/* bin/

kernel:
	$(MAKE) -C kernel build
	mv kernel/target/x86_64-kernel/release/kmain bin/

user:
	$(MAKE) -C user build
	mv user/target/x86_64-user/release/user bin/

link:
	$(LD) $(LD_FLAGS) bin/*

build: init bootloader kernel user link

run: 
	qemu-system-x86_64 -drive format=raw,file=$(IMG) -boot a -no-reboot -serial stdio

debug: 
	qemu-system-x86_64 -drive format=raw,file=$(IMG) -boot a -no-reboot -d int -serial stdio

.PHONY: init bootloader build run clear kernel debug user admin link