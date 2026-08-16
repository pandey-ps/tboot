build:
	nasm -f bin -o boot.bin boot.asm
	dd if=boot.bin of=boot.img bs=512 count=1 conv=notrunc

run: build
	qemu-system-i386 -drive file=boot.img,format=raw,if=floppy -boot a -m 16M

verify:
	stat -c%s boot.bin
	od -An -tx1 -j510 boot.bin
	ndisasm boot.bin | head -30

screenshot: build
	{ sleep 1; echo "screendump /tmp/tboot.ppm"; sleep 1; echo "quit"; } | \
	qemu-system-i386 -drive file=boot.bin,format=raw,if=floppy,snapshot=on -boot a -m 16M -display none -monitor stdio >/dev/null 2>&1
	magick /tmp/tboot.ppm -crop 640x400+0+80 /tmp/tboot.png
	@echo "saved /tmp/tboot.png"

clean:
	rm -f boot.bin boot.img
