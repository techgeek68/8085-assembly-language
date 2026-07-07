# LAB 3: Addressing Modes in 8085 Microprocessor

---
## What is an Addressing Mode?

An addressing mode specifies where the operand (data) for an instruction is located and how the CPU finds it. Different instructions need to access data in different ways: sometimes the data is in a register, sometimes in memory, sometimes written directly in the instruction itself.

Understanding addressing modes helps you:
  
  - Choose the right instruction for the situation.
  
  - Understand why some instructions are 1, 2, or 3 bytes long.
  
  - Read and write assembly programs with confidence.

The 8085 microprocessor uses five addressing modes.

---
## Instruction Size and Addressing Mode Relationship

| Addressing Mode | Typical Instruction Size | Reason |
|---|---|---|
| Implied | 1 byte | No operand to encode; the instruction itself tells everything |
| Register | 1 byte | Register number is encoded inside the opcode |
| Immediate (8-bit) | 2 bytes | Opcode + 1 data byte |
| Immediate (16-bit) | 3 bytes | Opcode + 2 data bytes (low byte first) |
| Direct | 3 bytes | Opcode + 16-bit address (low byte first) |
| Register Indirect (M) | 1 byte | Address is already in HL; no extra bytes needed |
| Register Indirect (LDAX/STAX) | 1 byte | Register pair specified inside opcode |

---
## 1. Immediate Addressing Mode

In immediate addressing mode, the **operand is a constant value written directly inside the instruction**. The data travels with the instruction itself and is fetched from program memory when the instruction is loaded.

The word "immediate" means the data is immediately available in the instruction byte stream, with no need to look it up elsewhere.

**Instruction size:**

- 8-bit immediate data: instruction is 2 bytes (1 opcode + 1 data byte).

- 16-bit immediate data: instruction is 3 bytes (1 opcode + 2 data bytes, low byte first).

---
### Examples

```asm
MVI B, 45H     ; 2-byte: Move the constant 45H directly into register B
MVI A, 00H     ; 2-byte: Load 0 into the Accumulator
LXI H, 3050H  ; 3-byte: Load the constant 3050H into the HL register pair
LXI SP, 27FFH ; 3-byte: Initialize the Stack Pointer to 27FFH
ADI  05H       ; 2-byte: Add the constant 05H to the Accumulator
ANI  0FH       ; 2-byte: AND the Accumulator with the constant 0FH
```
---
### Memory Representation of a 3-Byte Immediate Instruction

```
Address   Content
2000H     21H     < Opcode for LXI H
2001H     50H     < Low byte of 3050H (stored first)
2002H     30H     < High byte of 3050H (stored second)
```
---
## 2. Register Addressing Mode

In register addressing mode, both the source and destination operands are CPU registers. No memory access is needed to get the data. The CPU fetches the data directly from registers, making these instructions the fastest to execute.

The register names are encoded inside the 1-byte opcode, so no additional bytes are needed.

Instruction size: Always 1 byte.

---
### Examples

```asm
MOV A, B   ; Copy the contents of register B into register A
MOV H, L   ; Copy the contents of L into H
ADD B      ; Add the contents of B to the Accumulator; result in A
SUB C      ; Subtract C from the Accumulator
ANA D      ; AND the Accumulator with register D
INR A      ; Increment the Accumulator by 1
DCR B      ; Decrement register B by 1
XRA A      ; XOR A with itself (clears A to 00H quickly)
```
---
### Programs
---
**a. Load 15H into register A and then copy it into register B.**

```asm
MVI A, 15H   ; Immediate mode: load constant 15H into A
MOV B, A     ; Register mode: copy A into B
```

> Note: `MVI A, 15H` uses Immediate Addressing Mode (constant data in the instruction). `MOV B, A` uses Register Addressing Mode (data is in a register).
---
**b. Add two 8 bit numbers: 04H and 03H.**

```asm
MVI A, 04H   ; Immediate: A = 04H
MOV B, A     ; Register: B = A (B = 04H)
MVI A, 03H   ; Immediate: A = 03H
ADD B        ; Register: A = A + B = 03H + 04H = 07H
HLT          ; Stop
```
---
**c. Subtract two numbers using register addressing.**

```asm
MVI A, 09H   ; A = 09H
MVI B, 04H   ; B = 04H
SUB B        ; A = A - B = 09H - 04H = 05H
HLT
```
---
## 3. Direct Addressing Mode

In direct addressing mode, the 16-bit memory address of the operand is written directly in the instruction. The CPU uses this address to access the memory location and read or write the data.

The address takes 2 bytes in the instruction (low byte first, then high byte), making these instructions **3 bytes** total.

Instruction size: Always 3 bytes (1 opcode + 2 address bytes).

---
### Examples
```asm
LDA  2050H     ; Load the byte stored at memory address 2050H into A
STA  3000H     ; Store the byte in A into memory address 3000H
LHLD 4000H     ; Load: L <- memory[4000H], H <- memory[4001H]
SHLD 5000H     ; Store: memory[5000H] <- L, memory[5001H] <- H
```
---
### Memory Layout for LDA 2050H
```
Address   Content
1000H     3AH     <- Opcode for LDA
1001H     50H     <- Low byte of address 2050H
1002H     20H     <- High byte of address 2050H
...
2050H     7BH     <- The data that will be loaded into A
```
---
###  Port Addressing (a special case of Direct Addressing)

The `IN` and `OUT` instructions use an 8-bit port address. This is sometimes called **I/O Direct Addressing**. The 8-bit port address is the second byte of a 2-byte instruction.

```asm
IN   01H   ; Read data from I/O port 01H into the Accumulator
OUT  02H   ; Write the Accumulator contents to I/O port 02H
```

The 8085 can address up to 256 I/O ports (00H to FFH) separately from its 64 KB memory address space, using the IO/M' control signal to distinguish between memory and I/O operations.

---
### Program: Read a value from memory, double it, and store it back

```asm
; Value is at 2050H. Doubled result goes to 2051H.

LDA  2050H    ; Direct: A = value at 2050H
ADD  A        ; Register: A = A + A (doubles it)
STA  2051H    ; Direct: store result at 2051H
HLT
```
---
## 4. Register Indirect Addressing Mode

In the register indirect addressing mode, the memory address of the operand is held in a register pair, not written in the instruction. The instruction specifies the register pair, and the CPU uses the value in that pair as the address to go to in memory.

This is called "indirect" because you access the address through (via) a register, not directly.

Instruction size: Usually 1 byte (the register pair is encoded in the opcode).

---
### The M Operand and the HL Pair

The most common form of register indirect addressing in the 8085 uses the **HL register pair** as the memory pointer. In instructions, the memory location pointed to by HL is referred to as **M**.

```asm
MOV A, M    ; A <- memory[HL]   (Read from address in HL into A)
MOV M, A    ; memory[HL] <- A   (Write A into address in HL)
ADD M       ; A <- A + memory[HL]
```
---
### Using BC and DE as Pointers (LDAX and STAX)

The `LDAX` and `STAX` instructions allow BC or DE to serve as the memory pointer:

```asm
LDAX B      ; A <- memory[BC]   (Load A from address in BC)
LDAX D      ; A <- memory[DE]   (Load A from address in DE)
STAX B      ; memory[BC] <- A   (Store A at address in BC)
STAX D      ; memory[DE] <- A   (Store A at address in DE)
```
---
###  Why Register Indirect Addressing is Powerful

Direct addressing can only access one fixed address per instruction. Register Indirect addressing lets you **change the address at runtime** by changing the value in the register pair. This enables loops that process arrays of data.

```asm
; Sum 5 bytes stored at 3000H, 3001H, 3002H, 3003H, 3004H
; Store the total at 3005H

LXI  H, 3000H   ; HL = start address of array
MVI  B, 05H     ; B = count of bytes to add
MVI  A, 00H     ; A = running total = 0

LOOP: ADD  M    ; A = A + memory[HL]  (Register Indirect)
      INX  H    ; HL = HL + 1 (point to next element)
      DCR  B    ; Decrement count
      JNZ  LOOP ; Repeat if more bytes remain
      STA  3005H ; Store total at 3005H (Direct)
      HLT
```

In this program, `ADD M` uses Register Indirect addressing eight times (using different addresses stored in HL each time), even though only one instruction was written. This would require 5 separate `ADD` instructions with 5 different addresses if only Direct Addressing were used.

---
###  Stack Pointer as an Indirect Register

The `PUSH` and `POP` instructions implicitly use the **Stack Pointer (SP)** as a memory pointer. This is also a form of Register Indirect addressing, though it is usually classified separately as Stack Addressing or treated as Implied Addressing because the programmer does not specify SP explicitly.

```asm
PUSH B    ; memory[SP-1] <- B, memory[SP-2] <- C, SP = SP - 2
POP  H    ; L <- memory[SP], H <- memory[SP+1], SP = SP + 2
```
---
## 5. Implied / Implicit Addressing Mode

In the implied (also written as implicit) addressing mode, the operand is not stated anywhere in the instruction. The instruction itself implies which register or data is involved. In most cases, the operand is the Accumulator (A) or the carry flag.

Instruction size: Always 1 byte.

### Examples

```assembly
CMA     ; Complement the Accumulator (operand = A, implied)
RRC     ; Rotate Accumulator A right by one bit (implied)
RLC     ; Rotate Accumulator A left by one bit (implied)
RAL     ; Rotate A left through carry (implied)
RAR     ; Rotate A right through carry (implied)
STC     ; Set the Carry flag (flag implied)
CMC     ; Complement the Carry flag (flag implied)
NOP     ; No operation (no operand, no register)
HLT     ; Halt (no operand)
EI      ; Enable Interrupts (implied)
DI      ; Disable Interrupts (implied)
XCHG    ; Exchange HL with DE (both register pairs implied)
```
---
###  Distinguishing Implied from Register Addressing

It can be confusing to tell Implied from Register addressing. The key difference:

- **Register Addressing:** The instruction has a register field in the opcode that could be a different register. For example, `INR B`, `INR C`, `INR D` are all valid variations of the same mnemonic because the register is a variable part.

- **Implied Addressing:** There is only one valid form of the instruction. `CMA` always and only complements the Accumulator. There is no `CMA B`. The Accumulator is fixed and implied.

---
##  Choosing the Right Addressing Mode

| Situation | Best Mode | Reason |
|---|---|---|
| Loading a known constant into a register | Immediate | The value is known at assembly time |
| Copying data between registers | Register | Fastest; no memory access needed |
| Reading/writing a specific known address | Direct | Address is fixed and known |
| Processing an array or table in memory | Register Indirect | Change HL in a loop to walk through addresses |
| Complementing the Accumulator | Implied | Only one form exists; no operand needed |

---
##  WAP Using All Five Addressing Modes

The following program demonstrates all five addressing modes working together:

```asm
; Program: Read a byte from 2050H, add 10H to it,
;          AND it with 0FH, and store the result at 2051H.

LXI  H, 2050H   ; Immediate: HL = 2050H (load address constant)
MOV  A, M       ; Register Indirect: A = memory[HL] = memory[2050H]
ADI  10H        ; Immediate: A = A + 10H (add constant)
MOV  B, A       ; Register: B = A (copy between registers)
ANI  0FH        ; Immediate: A = A AND 0FH (mask lower nibble)
XRA  B          ; Register: A = A XOR B (combine results)
CMA             ; Implied: A = complement of A
STA  2051H      ; Direct: memory[2051H] = A
HLT             ; Implied: stop execution
```

---
| Instruction | Addressing Mode Used |
|---|---|
| `LXI H, 2050H` | Immediate |
| `MOV A, M` | Register Indirect |
| `ADI 10H` | Immediate |
| `MOV B, A` | Register |
| `ANI 0FH` | Immediate |
| `XRA B` | Register |
| `CMA` | Implied |
| `STA 2051H` | Direct |
| `HLT` | Implied |

---
