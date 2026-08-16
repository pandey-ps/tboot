single sector x86 bootloader written in NASM. (my assembly sidequest)

boots in QEMU and prints `hello from the boot sector :)`, then halts.

- `boot.asm`: source (16-bit, ~40 lines)
- `boot.bin`: 512-byte boot sector
- `boot.img`: floppy image for QEMU


#### Build & Run

    make         
    make run      # boot in qemu 
    make screenshot  # save an ss of the boot screen at /tmp/tboot.png  
    make verify   # check size, 0xAA55 signature, disassembly

requires the `nasm` and `qemu-system-x86` packages