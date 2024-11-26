nasm -f win64 mp2_asm.asm
gcc -c mp2_C.c -o mp2_C.obj -m64
gcc mp2_C.obj mp2_asm.obj -o mp2_C.exe -m64

