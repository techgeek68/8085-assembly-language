# 8085 assembly programs

This repo holds a complete set of 8085 microprocessor lab programs for a BSc CSIT / BCA microprocessor laboratory course. Every program was checked instruction by instruction, hand traced on sample data, and corrected where the original working papers contained bugs. A full errata log of what was fixed and why is kept in `ERRATA.md`.

Memory is assumed available from 8000H to FFFFH unless a program states otherwise. All data, addresses, and opcodes are in hexadecimal. Every program ends with HLT, on the assumption that it runs under a monitor program or is single stepped on a trainer kit or simulator such as GNUSim8085.

## Index

1. Store 8 bit data in memory (direct addressing).
   - [Program1.asm](Programs/Program1.asm)
2. Store 8 bit data in memory (indirect addressing).
   - [Program2.asm](Programs/Program2.asm)
3. Exchange the contents of two memory locations (direct addressing).
   - [Program3.asm](Programs/Program3.asm)
4. Exchange the contents of two memory locations (indirect addressing).
   - [Program4.asm](Programs/Program4.asm)
5. Add two 8 bit numbers.
   - [Program5.asm](Programs/Program5.asm)
6. Subtract two 8 bit numbers.
   - [Program6.asm](Programs/Program6.asm)
7. Find the one's complement of a number.
   - [Program7.asm](Programs/Program7.asm)
8. Find the two's complement of a number.
   - [Program8.asm](Programs/Program8.asm)
9. Add a block of ten 8 bit numbers with carry.
   - [Program9.asm](Programs/Program9.asm)
10. Add ten packed BCD numbers.
    - [Program10.asm](Programs/Program10.asm)
11. Multiply two 8 bit numbers by repeated addition.
    - [Program11.asm](Programs/Program11.asm)
12. Add two 16 bit numbers (using DAD, recommended method).
    - [Program12.asm](Programs/Program12.asm)
13. Add two 16 bit numbers (byte by byte method, for comparison).
    - [Program13.asm](Programs/Program13.asm)
14. Subtract two 16 bit numbers.
    - [Program14.asm](Programs/Program14.asm)
15. Add corresponding elements of two 16 bit tables.
    - [Program15.asm](Programs/Program15.asm)
16. Divide two 8 bit numbers.
    - [Program16.asm](Programs/Program16.asm)
17. Count positive and negative numbers in an array.
    - [Program17.asm](Programs/Program17.asm)
18. Count even and odd numbers in an array.
    - [Program18.asm](Programs/Program18.asm)
19. Set a bit for numbers greater than a given value.
    - [Program19.asm](Programs/Program19.asm)
20. Conditional data transfer within a range.
    - [Program20.asm](Programs/Program20.asm)
21. Find the largest number in an array.
    - [Program21.asm](Programs/Program21.asm)
22. Find the smallest number in an array.
    - [Program22.asm](Programs/Program22.asm)
23. Sort an array in ascending order (bubble sort).
    - [Program23.asm](Programs/Program23.asm)
24. BCD to binary conversion.
    - [Program24.asm](Programs/Program24.asm)
25. Binary to BCD conversion.
    - [Program25.asm](Programs/Program25.asm)
26. Convert a hexadecimal digit to its ASCII code.
    - [Program26.asm](Programs/Program26.asm)
27. Generate the Fibonacci series up to eight terms.
    - [Program27.asm](Programs/Program27.asm)
28. Factorial of a number.
    - [Program28.asm](Programs/Program28.asm)
29. Multiply two 8 bit numbers by the double and add method.
    - [Program29.asm](Programs/Program29.asm)
30. Check whether a number is a palindrome.
    - [Program30.asm](Programs/Program30.asm)
31. Generate a square wave using a delay subroutine.
    - [Program31.asm](Programs/Program31.asm)
32. Multiply two 16 bit numbers.
    - [Program32.asm](Programs/Program32.asm)
33. Sum only the odd numbers in an array.
    - [Program33.asm](Programs/Program33.asm)

## Notes on correctness

Several of these programs replace earlier versions that were found to be buggy during review: an off by one loop counter in the bubble sort (Program23), a similar off by one in the sixteen bit table addition (Program15), a boundary condition error in the greater than comparison (Program19), a missing explicit zero write on the reject path in the range transfer (Program20), and a few others. The full list, with the reasoning behind each fix, is in `ERRATA.md`.

## Contributors

1. Prepared by P. Anup

## Issues

For any problem or suggestion, please open an issue on this repository.

## License

Licensed under the MIT license.

> Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
>
> The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
>
> THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
