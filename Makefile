all:
	wine /opt/c3w/c3/c3c.exe compile-only main.c3 --use-stdlib=no --no-entry
	x86_64-w64-mingw32-gcc obj/windows-x64/main.obj -o main.exe -nostdlib -e main -lkernel32 -luser32
