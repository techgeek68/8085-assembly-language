# 🖥️ 8085 Assembly Language

![Language](https://img.shields.io/badge/Language-Assembly-blue) ![Architecture](https://img.shields.io/badge/Architecture-Intel%208085-green) ![Programs](https://img.shields.io/badge/Programs-33-orange) ![License](https://img.shields.io/badge/License-MIT-yellow)

A curated educational repository for learning Intel 8085 assembly language through foundational theory notes, reference material, and a categorized collection of 33 assembly programs covering data transfer, arithmetic, logic, arrays, conversions, series, and advanced patterns.

## Table of Contents

- [About](#about)
- [Prerequisites](#prerequisites)
- [Theory & Reference Docs](#theory--reference-docs)
- [Repository Structure](#repository-structure)
- [Programs Index](#programs-index)
  - [01 · Data Transfer](#01--data-transfer)
  - [02 · Arithmetic](#02--arithmetic)
  - [03 · Logic & Bit Manipulation](#03--logic--bit-manipulation)
  - [04 · Arrays & Searching](#04--arrays--searching)
  - [05 · Number Conversion](#05--number-conversion)
  - [06 · Series & Patterns](#06--series--patterns)
  - [07 · Advanced](#07--advanced)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [License](#license)

## About

This repository brings together core 8085 microprocessor theory and a practical collection of assembly language programs in one place. It is designed for students, self learners, and anyone who wants a cleaner, easier to navigate reference for studying Intel 8085 programming concepts and examples.

## Prerequisites

Before using this repository, it helps to be familiar with:

- Basic digital electronics
- Number systems (binary, decimal, hexadecimal)

Recommended simulator: [GNUSim8085](http://gnusim8085.srid.ca) - A free, cross platform 8085 simulator for writing, assembling, and running programs.

## Theory & Reference Docs

| # | Document | Description |
|---|---|---|
| 1 | [Opcodes Table](docs/01-opcodes-table.md) | All 246 Intel 8085 opcodes in alphabetical order |
| 2 | [Introduction to 8085](docs/02-introduction.md) | Architecture, registers, flags, memory, machine cycles |
| 3 | [Instruction Set](docs/03-instruction-set.md) | All instruction categories with explanations and examples |
| 4 | [Addressing Modes](docs/04-addressing-modes.md) | All 5 addressing modes with programs |

## Repository Structure

```text
8085-assembly-language/
├── .gitignore
├── LICENSE
├── README.md
├── docs/
│   ├── 01-opcodes-table.md
│   ├── 02-introduction.md
│   ├── 03-instruction-set.md
│   └── 04-addressing-modes.md
└── programs/
    ├── 01-data-transfer/
    │   ├── 01-store-8bit-direct.asm
    │   ├── 02-store-8bit-indirect.asm
    │   ├── 03-exchange-memory-direct.asm
    │   └── 04-exchange-memory-indirect.asm
    ├── 02-arithmetic/
    │   ├── 01-add-8bit.asm
    │   ├── 02-subtract-8bit.asm
    │   ├── 03-ones-complement.asm
    │   ├── 04-twos-complement.asm
    │   ├── 05-add-block-with-carry.asm
    │   ├── 06-add-bcd-numbers.asm
    │   ├── 07-multiply-8bit-repeated-add.asm
    │   ├── 08-add-16bit-dad.asm
    │   ├── 09-add-16bit-bytewise.asm
    │   ├── 10-subtract-16bit.asm
    │   ├── 11-add-16bit-tables.asm
    │   ├── 12-divide-8bit.asm
    │   ├── 13-multiply-8bit-double-add.asm
    │   └── 14-multiply-16bit.asm
    ├── 03-logic-and-bit/
    │   ├── 01-count-positive-negative.asm
    │   ├── 02-count-even-odd.asm
    │   ├── 03-set-bit-above-threshold.asm
    │   └── 04-conditional-data-transfer.asm
    ├── 04-array-and-search/
    │   ├── 01-find-largest.asm
    │   ├── 02-find-smallest.asm
    │   ├── 03-bubble-sort-ascending.asm
    │   └── 04-sum-odd-numbers.asm
    ├── 05-conversion/
    │   ├── 01-bcd-to-binary.asm
    │   ├── 02-binary-to-bcd.asm
    │   └── 03-hex-to-ascii.asm
    ├── 06-series-and-patterns/
    │   ├── 01-fibonacci-series.asm
    │   └── 02-factorial.asm
    └── 07-advanced/
        ├── 01-palindrome-check.asm
        └── 02-square-wave-delay.asm
```

## Programs Index

### 01 · Data Transfer

| # | File | Description |
|---|---|---|
| 01 | [01-store-8bit-direct.asm](programs/01-data-transfer/01-store-8bit-direct.asm) | Store 8-bit data using direct addressing |
| 02 | [02-store-8bit-indirect.asm](programs/01-data-transfer/02-store-8bit-indirect.asm) | Store 8-bit data using indirect (HL) addressing |
| 03 | [03-exchange-memory-direct.asm](programs/01-data-transfer/03-exchange-memory-direct.asm) | Exchange two memory locations: direct |
| 04 | [04-exchange-memory-indirect.asm](programs/01-data-transfer/04-exchange-memory-indirect.asm) | Exchange two memory locations: indirect |

### 02 · Arithmetic

| # | File | Description |
|---|---|---|
| 01 | [01-add-8bit.asm](programs/02-arithmetic/01-add-8bit.asm) | Add two 8-bit numbers |
| 02 | [02-subtract-8bit.asm](programs/02-arithmetic/02-subtract-8bit.asm) | Subtract two 8-bit numbers |
| 03 | [03-ones-complement.asm](programs/02-arithmetic/03-ones-complement.asm) | 1's complement of a number |
| 04 | [04-twos-complement.asm](programs/02-arithmetic/04-twos-complement.asm) | 2's complement of a number |
| 05 | [05-add-block-with-carry.asm](programs/02-arithmetic/05-add-block-with-carry.asm) | Add a block of 8-bit numbers with carry |
| 06 | [06-add-bcd-numbers.asm](programs/02-arithmetic/06-add-bcd-numbers.asm) | Add ten BCD numbers |
| 07 | [07-multiply-8bit-repeated-add.asm](programs/02-arithmetic/07-multiply-8bit-repeated-add.asm) | Multiply two 8-bit numbers by repeated addition |
| 08 | [08-add-16bit-dad.asm](programs/02-arithmetic/08-add-16bit-dad.asm) | Add two 16-bit numbers using DAD |
| 09 | [09-add-16bit-bytewise.asm](programs/02-arithmetic/09-add-16bit-bytewise.asm) | Add two 16-bit numbers byte-by-byte |
| 10 | [10-subtract-16bit.asm](programs/02-arithmetic/10-subtract-16bit.asm) | Subtract two 16-bit numbers |
| 11 | [11-add-16bit-tables.asm](programs/02-arithmetic/11-add-16bit-tables.asm) | Add corresponding elements of two 16-bit tables |
| 12 | [12-divide-8bit.asm](programs/02-arithmetic/12-divide-8bit.asm) | Divide two 8-bit numbers |
| 13 | [13-multiply-8bit-double-add.asm](programs/02-arithmetic/13-multiply-8bit-double-add.asm) | Multiply 8-bit numbers by double-and-add method |
| 14 | [14-multiply-16bit.asm](programs/02-arithmetic/14-multiply-16bit.asm) | Multiply two 16-bit numbers |

### 03 · Logic & Bit Manipulation

| # | File | Description |
|---|---|---|
| 01 | [01-count-positive-negative.asm](programs/03-logic-and-bit/01-count-positive-negative.asm) | Count positive and negative numbers in an array |
| 02 | [02-count-even-odd.asm](programs/03-logic-and-bit/02-count-even-odd.asm) | Count even and odd numbers in an array |
| 03 | [03-set-bit-above-threshold.asm](programs/03-logic-and-bit/03-set-bit-above-threshold.asm) | Set a bit for numbers above a threshold |
| 04 | [04-conditional-data-transfer.asm](programs/03-logic-and-bit/04-conditional-data-transfer.asm) | Conditional data transfer within a range |

### 04 · Arrays & Searching

| # | File | Description |
|---|---|---|
| 01 | [01-find-largest.asm](programs/04-array-and-search/01-find-largest.asm) | Find the largest number in an array |
| 02 | [02-find-smallest.asm](programs/04-array-and-search/02-find-smallest.asm) | Find the smallest number in an array |
| 03 | [03-bubble-sort-ascending.asm](programs/04-array-and-search/03-bubble-sort-ascending.asm) | Sort an array in ascending order (bubble sort) |
| 04 | [04-sum-odd-numbers.asm](programs/04-array-and-search/04-sum-odd-numbers.asm) | Sum only the odd numbers in an array |

### 05 · Number Conversion

| # | File | Description |
|---|---|---|
| 01 | [01-bcd-to-binary.asm](programs/05-conversion/01-bcd-to-binary.asm) | BCD to binary conversion |
| 02 | [02-binary-to-bcd.asm](programs/05-conversion/02-binary-to-bcd.asm) | Binary to BCD conversion |
| 03 | [03-hex-to-ascii.asm](programs/05-conversion/03-hex-to-ascii.asm) | Hexadecimal digit to ASCII code |

### 06 · Series & Patterns

| # | File | Description |
|---|---|---|
| 01 | [01-fibonacci-series.asm](programs/06-series-and-patterns/01-fibonacci-series.asm) | Generate Fibonacci series (8 terms) |
| 02 | [02-factorial.asm](programs/06-series-and-patterns/02-factorial.asm) | Compute factorial of a number |

### 07 · Advanced

| # | File | Description |
|---|---|---|
| 01 | [01-palindrome-check.asm](programs/07-advanced/01-palindrome-check.asm) | Check if a number is a palindrome |
| 02 | [02-square-wave-delay.asm](programs/07-advanced/02-square-wave-delay.asm) | Generate a square wave using a delay subroutine |

## Getting Started

1. Clone the repository.
2. Install [GNUSim8085](http://gnusim8085.srid.ca).
3. Open any `.asm` file in GNUSim8085.
4. Load it, assemble, and run the program.

## Contributing

- Fork the repository.
- Create a branch for your changes.
- Follow the existing file naming convention.
- Add a comment header to new `.asm` files.
- Open a pull request.

## License

This project is licensed under the terms provided in the [LICENSE](LICENSE) file.
