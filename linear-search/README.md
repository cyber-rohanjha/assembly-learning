# Linear Search in x86-64 Assembly

## Overview

This program demonstrates a basic linear search algorithm implemented in x86-64 assembly using **NASM**.
It searches for a target value in a predefined array and prints whether the value was found or not.

## Requirements

- Linux operating system
- NASM assembler
- GNU linker (ld)

## Source Details

- The array and target value are hardcoded in the `.data` section.
- The program loops through the array, comparing each element with the target.
- If the target is found, it prints "Value found!".
- If the target is not found, it prints "Value not found".

## Build Instructions

```bash
nasm -f elf64 linear_search.asm -o linear_search.o
ld linear_search.o -o linear_search
```

## Run Instructions

Execute the program:
```bash
./linear_search
```

## Expected Output

If the target value exists in the array:
```bash
Value found!
```

If the target value does not exists:
```bash
Value not found
```

## Notes

- The current version only prints whether the value is found or not.
- Since the array values and target value is hardcoded, it will always print **Value found!**, unless the values are changed.
- Future improvements may include printing the index of the found value, returning different exit codes, or accepting user input.

