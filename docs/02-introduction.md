# Introduction to 8085 Microprocessor

---
## Review Section: Number Systems

Before studying the 8085 microprocessor, you must be comfortable with the number systems it uses. All data and addresses inside the 8085 are stored and manipulated in binary, but programmers write them in hexadecimal.

---
### Binary Number System (Base 2)

Uses only two digits: 0 and 1. Each position represents a power of 2.

```
Binary:  1     0     1     1     0     1     0     1
Power:  2^7   2^6   2^5   2^4   2^3   2^2   2^1   2^0
Value:  128    0    32    16     0     4     0     1  = 181 in decimal
```
---
### Hexadecimal Number System (Base 16)

Uses digits 0 to 9 and letters A to F. One hex digit represents exactly 4 binary bits (one nibble). This makes it compact and directly tied to binary.

| Hex | Decimal | Binary |
|-----|---------|--------|
| 0   | 0       | 0000   |
| 1   | 1       | 0001   |
| 2   | 2       | 0010   |
| 3   | 3       | 0011   |
| 4   | 4       | 0100   |
| 5   | 5       | 0101   |
| 6   | 6       | 0110   |
| 7   | 7       | 0111   |
| 8   | 8       | 1000   |
| 9   | 9       | 1001   |
| A   | 10      | 1010   |
| B   | 11      | 1011   |
| C   | 12      | 1100   |
| D   | 13      | 1101   |
| E   | 14      | 1110   |
| F   | 15      | 1111   |

In 8085 assembly, hexadecimal values are written with the suffix **H** (e.g., `3AH`, `FFH`, `2050H`).

---
### Converting Between Number Systems

**Binary to Hex:** Group bits into groups of 4 from right to left, then convert each group.
```
Binary: 1011 0101
Groups:  B     5
Hex: B5H
```

**Hex to Binary:** Expand each hex digit into 4 bits.
```
Hex:    4    F
Binary: 0100 1111 = 01001111B
```

**Hex to Decimal:** Multiply each digit by its power of 16.
```
2AH = (2 × 16) + (10 × 1) = 32 + 10 = 42
```
---
###  Two's Complement (Signed Numbers)

The 8085 represents negative numbers using two's complement notation. This is essential for understanding the Sign Flag and signed arithmetic.

**To find the two's complement of a number:**
1. Write the number in binary.
2. Invert all bits (1's complement).
3. Add 1 to the result.

**Example:** Find the two's complement of +5 (to represent -5).
```
+5 in binary:   0000 0101
Invert bits:    1111 1010  (1's complement)
Add 1:          1111 1011  (2's complement = -5)
```

**In an 8-bit signed number:**
- If bit 7 (MSB) is 0, the number is positive (range: 0 to +127).
- If bit 7 (MSB) is 1, the number is negative (range: -128 to -1).
---
###  BCD (Binary Coded Decimal)

BCD stores each decimal digit as a 4-bit binary group. This is important for the Auxiliary Carry Flag and the DAA instruction.
```
Decimal 39 in BCD:  0011 1001
                      3     9
```
---
## Binary Information and Representation

### Table 1: Binary Information Group Representations and Terms

| Number of Bits | Common Representation Terms |
|---|---|
| 1 | Bit / Digit / Flag |
| 4 | Nibble |
| 8 | Byte / Octet / Character |
| 16 | Double Byte / Word |
| 32 | Double Word / Long Word |
| 64 | Quad Word / Very Long Word |

A 16-bit word is made up of four nibbles and two bytes. The leftmost bit is the Most Significant Bit (MSB) and the rightmost bit is the Least Significant Bit (LSB).

```
MSB                                LSB
B7   B6   B5   B4   B3   B2   B1   B0
|    |    |    |    |    |    |    |   
 <-Upper Nibble->   | <-Lower Nibble->
|<------------ BYTE ---------------->|
```

---
## What is a Microprocessor?

A microprocessor is a multipurpose, programmable, clock driven, register based electronic device that reads binary instructions from a storage device called memory, accepts binary data as input, processes data according to those instructions, and provides the result as output.

**Examples:** 8085, 8086

---
###  What is a Microcomputer System?

A microprocessor does not work alone. It is the central processing unit (CPU) of a **microcomputer system**, which consists of:

- **Microprocessor (CPU):** The 8085, which fetches, decodes, and executes instructions.

- **Memory:** ROM (Read Only Memory) to store programs permanently, and RAM (Random Access Memory) for temporary data storage during execution.

- **Input/Output (I/O) Ports:** Interfaces that connect the CPU to the outside world (keyboards, displays, sensors).

- **System Buses:** The electrical pathways that connect all components.

```
          +------------------+
          |   8085 CPU       |
          +--------+---------+
                   |
     +-------------+-------------+
     |             |             |
+----+----+   +----+----+   +----+----+
|  ROM    |   |  RAM    |   | I/O     |
| (Program|   | (Data)  |   | Ports   |
|  Store) |   |         |   |         |
+---------+   +---------+   +---------+
```
---
## Table: Important Intel Microprocessors

| Microprocessor | Year | Word Length | Memory Addressing Capacity | Pins | Clock | Remarks |
|---|---|---|---|---|---|---|
| 4004 | 1971 | 4-bit | 1 KB | 16 | 750 KHz | First Microprocessor |
| 8085 | 1976 | 8-bit | 64 KB | 40 | 3-6 MHz | Popular 8-bit Microprocessor |
| 8086 | 1978 | 16-bit | 1 MB | 40 | 5-8 MHz | Widely used in PC/XT |
| 80286 | 1982 | 16-bit | 16 MB real, 4 GB virtual | 68 | 6-12.5 MHz | Widely used in PC/AT |
| 80386 | 1985 | 32-bit | 4 GB real, 64 TB virtual | 132 (14x14 PGA) | 20-33 MHz | Contains MMU on chip |
| 80486 | 1989 | 32-bit | 4 GB real, 64 TB virtual | 168 (17x17 PGA) | 25-100 MHz | Contains MMU, cache and FPU; 1.2 million transistors |
| Pentium | 1993 | 32-bit | 4 GB (32-bit address bus, 64-bit data bus) | 237 PGA | 60-200 MHz | Contains 2 ALUs, 2 caches, FPU; 3.1 million transistors|
| Pentium Pro | 1995 | 32-bit | 64 GB real (36-bit address bus) | 387 PGA | 150-200 MHz | Data flow processor with on-die L2 cache |
| Pentium II | 1997 | 32-bit | 64 GB | 242 SEC | 233-450 MHz | All Pentium Pro features plus MMX technology; 7.5 million transistors |
| Pentium III | 1999 | 32-bit | 64 GB | 370 PGA | 500 MHz to 1.4 GHz | Improved Pentium II with 70 new SIMD instructions  |
| Pentium 4 | 2000 | 32-bit | 64 GB | 423 PGA | 1.3 GHz to 3.8 GHz | Improved Pentium III; NetBurst microarchitecture |
| Itanium | 2001 | 64-bit | 64-bit address space | 418 FC-PGA | 733 MHz to 1.0 GHz | 64-bit EPIC Processor |

---
### Abbreviations Used

| Abbreviation | Full Form |
|---|---|
| PGA | Pin Grid Array |
| SEC | Single Edge Connector |
| FC-PGA | Flip Chip Pin Grid Array |
| MMX | Multi Media Extensions |
| EPIC | Explicitly Parallel Instruction Computing |
| SIMD | Single Instruction Multiple Data |
| ALU | Arithmetic and Logic Unit |
| MMU | Memory Management Unit |
| FPU | Floating Point Unit |

---
## Terms Used in Microprocessor

**Instruction Set:** The group of commands that the microprocessor can understand is called the instruction set. It is the interface between hardware and software.

**Bus:** A set of conductors intended to transmit data, address, or control information between different elements in a microprocessor system. The 8085 has three types of buses:

- **Data Bus (D0-D7):** 8-bit, bidirectional. Carries data between the CPU, memory, and I/O.

- **Address Bus (A0-A15):** 16-bit, unidirectional. Carries memory or I/O port addresses from the CPU.

- **Control Bus:** Carries control signals such as RD (Read), WR (Write), ALE, and IO/M.

**IPC (Instructions Per Cycle):** A measure of how many instructions a CPU can execute in a single clock cycle.

**Clock Speed:** The number of operations per second the processor can perform. Expressed in megahertz (MHz) or gigahertz (GHz). Also called the Clock Rate.

**Bandwidth:** The number of bits processed in a single instruction.

**Word Length:** The number of bits the processor can process at a time. The 8085 processes 8 bits at a time. Word length ranges from 4 bits to 64 bits across different processors.

**Data Types:** The microprocessor supports multiple data type formats, including binary, hexadecimal, BCD, ASCII, and signed/unsigned numbers.

---
###  The Multiplexed Address/Data Bus (AD0-AD7) in 8085

The 8085 has only 40 pins. To save pins, the lower 8 bits of the address (A0-A7) are multiplexed with the 8-bit data bus (D0-D7) on the same 8 pins, labeled **AD0-AD7**.

To separate addresses from data, the 8085 uses the **ALE (Address Latch Enable)** signal:

1. At the beginning of a machine cycle, ALE goes HIGH. The 8 bits on AD0-AD7 are **address bits** (A0-A7). An external latch (e.g., 74LS373) captures these bits.

2. ALE then goes LOW. The same AD0-AD7 pins now carry **data** (D0-D7).

The upper 8 address bits (A8-A15) are always available on dedicated pins and are never multiplexed.

```
AD0-AD7 pins:
  ALE HIGH  >  A0-A7  (address, latched externally)
  ALE LOW   >  D0-D7  (data transferred)
```

---
##  8085 Memory Organization

The 8085 has a 16-bit address bus, so it can address 2^16 = **65,536 memory locations** (64 KB), ranging from address **0000H to FFFFH**.

```
Memory Map:
0000H  +-------------------+
       |  ROM / EPROM      |  (Program storage - typically lower half)
       |  (Read Only)      |
       |                   |
       +-------------------+
       |  RAM              |  (Data storage - typically upper half)
       |  (Read/Write)     |
       |                   |
FFFFH  +-------------------+
```

- **ROM** stores the program permanently (it is not erased when power is off).

- **RAM** stores data and intermediate results during program execution (lost when power is off).

- The exact boundary between ROM and RAM depends on the hardware design.

---
##  Machine Cycles and T-States

Understanding how the 8085 executes instructions helps in writing efficient programs.

**T-State:** The smallest unit of time in the 8085, equal to one clock period. At 3 MHz, one T-state = 1/3 microsecond.

**Machine Cycle:** A group of T-states used to complete one specific operation. The five types are:

| Machine Cycle | Abbreviation | Typical T-States | Description |
|---|---|---|---|
| Opcode Fetch | OF | 4 | Reads the instruction opcode from memory |
| Memory Read | MR | 3 | Reads a data byte from memory |
| Memory Write | MW | 3 | Writes a data byte to memory |
| I/O Read | IOR | 3 | Reads data from an I/O port |
| I/O Write | IOW | 3 | Writes data to an I/O port |

**Instruction Cycle:** The total time taken to complete one instruction. It consists of one or more machine cycles.

Example: `MVI A, 45H` (Move Immediate to Accumulator)
- Takes 2 machine cycles: 1 Opcode Fetch + 1 Memory Read = 7 T-states total.

---
## Registers in 8085

The 8085 has a total of 18 registers (including internal ones). Below is the complete register architecture.

---
### (a) General Purpose Registers

The 8085 has six general purpose registers to store 8-bit data, identified as **B, C, D, E, H, and L**. These can be combined as register pairs (BC, DE, and HL) to perform 16-bit operations.

| Register | Size | Pair | Pair Size |
|---|---|---|---|
| B | 8-bit | BC | 16-bit |
| C | 8-bit | BC | 16-bit |
| D | 8-bit | DE | 16-bit |
| E | 8-bit | DE | 16-bit |
| H | 8-bit | HL | 16-bit |
| L | 8-bit | HL | 16-bit |

The **HL pair** is special: it most commonly acts as a memory pointer (the M operand in many instructions refers to the memory location whose address is in HL).

---
### (b) Specific Purpose Registers

#### Accumulator (A)

The accumulator is an 8-bit register that is part of the Arithmetic and Logic Unit (ALU). The result of all arithmetic and logical operations is stored in the accumulator. It is also referred to as register A.

The Accumulator and the Flag register together form the **PSW (Program Status Word)**, which is a 16-bit register pair. This pair is used with the `PUSH PSW` and `POP PSW` instructions.

---
#### Flag Register

The flag register is a special purpose 8-bit register. Only 5 of its 8 bits are used as flags. The other three bits are fixed (unused).

Flags are **set** (value = 1) or **reset** (value = 0) automatically after certain operations based on the result in the accumulator.

**Flag Register Bit Layout:**

| B7 | B6 | B5 | B4 | B3 | B2 | B1 | B0 |
|---|---|---|---|---|---|---|---|
| S | Z | 0 | AC | 0 | P | 1 | CY |

> Note: B5 and B3 are always 0, and B1 is always 1 in the 8085 flag register.

##### The 5 Flags

**Sign Flag (S) at B7:**
Reflects the sign of the result in the accumulator (bit 7 of the result).
- Set (1) = result is negative (MSB = 1, two's complement negative).
- Reset (0) = result is positive (MSB = 0).

**Zero Flag (Z) at B6:**
- Set (1) = the result is zero (all 8 bits are 0).
- Reset (0) = the result is non-zero.
- Useful for checking equality: subtract two numbers; if Z is set, they are equal.

**Auxiliary Carry Flag (AC) at B4:**
- Set (1) = a carry was generated out of bit 3 into bit 4 during an arithmetic operation.
- Used internally by the `DAA` instruction for BCD arithmetic.
- **This is the only flag that cannot be tested directly with a conditional jump instruction.**

**Parity Flag (P) at B2:**
- Set (1) = the result has an even number of 1-bits (even parity).
- Reset (0) = the result has an odd number of 1-bits (odd parity).

**Carry Flag (CY) at B0:**
- Set (1) = an arithmetic operation produced a carry out of bit 7 (result exceeded 8 bits), or a borrow in subtraction.
- Reset (0) = no carry or borrow occurred.
- Also affected by rotate instructions (RLC, RRC, RAL, RAR).

---
## Example: Flag Register After Addition of Two Binary Numbers

Let's trace what happens when we add 10111010B and 01101001B:

```
  1 0 1 1 1 0 1 0   (BAH = 186 decimal)
+ 0 1 1 0 1 0 0 1   (69H = 105 decimal)
-----------------
1 0 0 1 0 0 0 1 1   (Result = 123 decimal, but with a carry out)
```

Result in accumulator (lower 8 bits): **00100011B = 23H**
Carry out (9th bit): 1

Flag register after this operation:

| B7 (S) | B6 (Z) | B5 | B4 (AC) | B3 | B2 (P) | B1 | B0 (CY) |
|---|---|---|---|---|---|---|---|
| 0 | 0 | 0 | 1 | 0 | 0 | 1 | 1 |

**Sign Flag (S) = 0:** Result bit 7 is 0, so the result is treated as positive.

**Zero Flag (Z) = 0:** The result (23H) is not zero, so this flag is reset.

**Auxiliary Carry Flag (AC) = 1:** Bit 3 generated a carry to bit 4 during the addition, so this flag is set.

**Parity Flag (P) = 0:** The result 00100011B has three 1-bits (odd parity), so this flag is reset.

**Carry Flag (CY) = 1:** The addition produced a carry beyond bit 7 (result exceeded 8 bits), so this flag is set.

---
####  Internal Temporary Registers (W and Z)

The 8085 contains two internal 8-bit registers called **W** and **Z**. These are not accessible by the programmer. They are used internally by the CPU to temporarily hold data and addresses during multi-byte instruction execution. Students should know they exist even though they cannot be used directly.

---
####  Instruction Register (IR)

When the CPU fetches an instruction opcode from memory, it is loaded into the 8-bit **Instruction Register (IR)**. The Instruction Decoder then decodes the opcode in IR to determine what operation to perform. Programmers cannot access this register.

---
### (c) Memory Registers (16-bit)

Two 16-bit registers are used to hold memory addresses.

**Program Counter (PC):**
Points to the memory address of the next instruction byte to be fetched. It is automatically incremented by 1 after each byte is fetched, so it always points to the next byte.

- At power on or RESET, the PC is initialized to **0000H**, so execution always starts from address 0000H.

- Branching instructions (JMP, CALL, RET) load a new value into the PC to change the flow of execution.

**Stack Pointer (SP):**
Points to the top of the **stack**, which is a region of RAM used for temporary storage during subroutine calls and PUSH/POP operations.

- The stack in the 8085 **grows downward** (toward lower memory addresses).

- During a **PUSH** operation: SP is first decremented by 1, the high-order byte is stored, SP is decremented again by 1, and the low-order byte is stored.

- During a **POP** operation: the low-order byte is read and SP is incremented by 1, then the high-order byte is read and SP is incremented again by 1.

- The SP is always decremented/incremented by **2** for each PUSH/POP since a register pair (2 bytes) is stored/retrieved.

The SP must be initialized by the programmer before using PUSH, POP, or CALL instructions.

```
Before PUSH B:    After PUSH B:
Stack in RAM:      Stack in RAM:

SP  > [  ]         [  ]
      [  ]   SP  > [C]   < Low byte of BC (C register)
      [  ]         [B]   < High byte of BC (B register)
```

---
##  Section: Machine Code vs Assembly Language

Understanding the relationship between what a programmer writes and what the CPU actually executes is fundamental.

**Machine Code:** 

The binary (or hexadecimal) codes that the CPU directly understands and executes. Every instruction is stored in memory as one, two, or three bytes of machine code.

**Assembly Language:** 

A human readable symbolic representation of machine code. Mnemonics (short abbreviations) replace binary opcodes, and labels replace numeric addresses.

**Assembler:** A program that translates assembly language source code into machine code.

```
Assembly Language          Machine Code (Hex)
-------------------       ------------------
MVI A, 45H            >    3E
                      >    45 
MOV B, A              >    47
ADD B                 >    80
HLT                   >    76
```

The machine code shown above is what is actually stored in memory and executed by the 8085. The assembly language is what the programmer writes.

---
**Instruction Byte Formats:**

| Format | Size | Structure | Example |
|---|---|---|---|
| 1-byte instruction | 1 byte | Opcode only | MOV A, B (opcode: 78H) |
| 2-byte instruction | 2 bytes | Opcode + 8-bit data/address | MVI A, 45H (opcode: 3EH, data: 45H) |
| 3-byte instruction | 3 bytes | Opcode + 16-bit address (low byte first) | LDA 2050H (opcode: 3AH, low: 50H, high: 20H) |

> Important: In 3-byte instructions, the 16-bit address is stored in **little endian** order: the low byte comes first in memory, followed by the high byte.
---
