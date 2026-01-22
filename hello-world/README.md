# Hello World in x86-64 Assembly

## Overview
This program prints "Hello, World from Assembly!" to the terminal using Linux system calls.  
It is a minimal example to demonstrate how to write and run assembly code with NASM.

## Requirements
- Linux operating system
- NASM assembler
- GNU linker (ld)

## Build Instructions
To assemble and link the program:

```bash
nasm -f elf64 hello.asm -o hello.o
ld hello.o -o hello
```

## Run Instructions

Execute the program:
```bash
./hello
```

## Expected Output

```bash
Hello, World from Assembly!
```

## Notes

- This program uses the `sys_write` and `sys_exit` system calls directly.
- It serves as a starting point for learning x86-64 assembly programming.
