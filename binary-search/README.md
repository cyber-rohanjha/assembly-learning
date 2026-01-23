# Binary Search in x86-64 Assembly

## Overview

This program demonstrates the **binary search algorithm** implemented in x86-64 assembly using NASM and Linux system calls.
Binary search is an efficient algorithm for finding a target value in a sorted array.
Binary search runs in **O(log n)** time, making it much faster than linear search for large arrays.
It repeatedly divides the search interval in half until the target is found or the interval becomes empty.

## Key Features

- Operates on a **hardcoded sorted array** of integers.
- Searches for a **hardcoded target value**.
- Prints whether the value was found or not.
- Uses a **safe midpoint calculation** to avoid overflow.


## Midpoint Calculation Logic

In binary search, the midpoint of the current search range is calculated to decide whether to search the left half or the right half of the array.

### Naive Approach

A common formula is:

`mid = (low + high) / 2`

However, this can cause **integer overflow** if `low + high` exceeds the maximum value storable in the register.

### Safer Approach

Instead, we use:

`mid = low + (high - low) / 2`

This avoids overflow because `(high - low)` is always less than or equal to the maximum array size.

### Assembly Implementation

```asm
; Calculate mid = low + (high - low) / 2
mov rcx, rdi		; rcx = high
sub rcx, rsi		; rcx = high - low
shr rcx, 1		; rcx = (high - low) / 2
add rcx, rsi		; rcx = mid
```

- `rsi` holds **low**
- `rdi` holds **high**
- `rcx` is used to compute the **midpoint**

This ensures the midpoint is always correctly calculated without risk of overflow.

## Build Instructions

To assemble and link the program:

```bash
nasm -f elf64 binary_search.asm -o binary_search.o
ld binary_search.o -o binary_search
```

## Run Instructions

Execute the program:

```bash
./binary_search
```

## Expected Output

```bash
Value found
```
or
```bash
Value not found
```

## Notes

- The array and target are **hardcoded** for simplicity.
- Printing the actual index requires an **integer-to-string routine**, which will be added later.
- This program demonstrates both the **binary search algorithm** and the **importance of safe arithmetic** in assembly.
