Shawn Anthony
ICS 312
Fall 2021
Casanova
Assignment 1

Exercise #1: Conversions

1)
hex     3B83 into binary

3 = 0011
B = 1011
8 = 1000
3 = 0011

3B83 = 0011 1011 1000 0011 binary 


2)
hex     B17 into decimal

B = 11 * 16^2 = 2816
1 = 1  * 16^1 = 16
7 = 7  * 16^0 = 7

2816 + 16 + 7 = 2839

B17 = 2839 decimal


3)
binary  1100110010111 into hex

0001 = 1
1001 = 9
1001 = 9
0111 = 7

1100110010111 = 1997 hex


4)
binary  0101010 into decimal

0 = 0 * 2^6 = 0
1 = 1 * 2^5 = 32
0 = 0 * 2^4 = 0
1 = 1 * 2^3 = 8
0 = 0 * 2^2 = 0
1 = 1 * 2^1 = 2
0 = 0 * 2^0 = 0

0 + 32 + 0 + 8 + 0 + 2 + 0 = 42

0101010 = 42 decimal


5)
decimal 211 into binary

211 / 2 = 105 remainder 1
105 / 2 = 52  remainder 1
52  / 2 = 26  remainder 0
26  / 2 = 13  remainder 0
13  / 2 = 6   remainder 1
6   / 2 = 3   remainder 0
3   / 2 = 1   remainder 1
1   / 2 = 0   remainder 1

211 = 1101 0011 decimal


6)
decimal 502 into hex

502 / 16 = 31 remainder 6
31  / 16 = 1  remainder F
1   / 16 = 0  remainder 1

502 = 1F6 hex


Exercise #2: Binary and Hex Arithmetic
Give the result for each of the operations below

1)
binary: 110101 + 10010111

   cc ccc
  00110101
+ 10010111
  11001100

110101 + 10010111 = 1100 1100 binary

2)
hex:    71A1E10A + D842A618

  c   c  c
   71A1E10A
+  D842A618
  149E48722

71A1E10A + D842A618 = 149E48722 hex


Exercise #3: Two's Complement
Give the binary 16-bit two’s complement representation of the following decimal integers

1)
145

145 = 0000000010010001 binary
0000000010010001 = 1111111101101110 1's complement
1111111101101110 + 1 = 1111111101101111 2's complement
1111111101101111 = -145 decimal

145 = 1111111101101111 binary 2's complement


2)
-5

5 = 0000000000000101 binary
0000000000000101 = 1111111111111010 1's complement
1111111111111010 + 1 = 1111111111111011 2's complement
1111111111111011 = -5 decimal

-5 = 0000000000000101 binary 2's complement


3)
-71

71 = 0000000001000111 binary
0000000001000111 = 1111111110111000 1's complement
1111111110111000 + 1 = 1111111110111001 2's complement
1111111110111001 = -71 decimal

-71 = 0000000001000111 binary 2's complement

Exercise #4: Two's Complement
Give the hexadecimal 32-bit two’s complement representation of the following decimal integers

1)
-7

7 = 7 hex
7 = 8 1's complement
8 + 1 = 9 2's complement 
9 = 0xFFFFFFF9 32 bit 2's complement

-7 = 0xFFFFFFF9 32 bit 2's complement


2)
-77

77 = 4D hex
4D = B2 1's complement
B2 + 1 = B3 2's complement
B3 = 0xFFFFFFB3 32 bit 2's complement

-77 = 0xFFFFFFB3 32 bit 2's complement


3)
248

248 = F8 hex
F8 = F07 1's complement
F07 + 1 = F08 2's complement
F08 = 0xFFFFFF08 32 bit 2's complement

248 = 0xFFFFFF07 32 bit 2's complement


Exercise #5: Two's Complement
Give the decimal value of the following 12-bit two’s complement hexadecimal representations

1)
C73

C73 = 3187 decimal
3187 decimal = 1100 0111 0011 binary
0011 1000 1100 = binary 1's complement
0011 1000 1100 + 1 = 0011 1000 1101 binary 2's complement
0011 1000 1101 = -3187 decimal

C73 = -3187 decimal 2's complement

2)
6FD

6FD = 1789 decimal
1789 decimal = 0110 1111 1101 binary
1001 0000 0010 = binary 1's complement
1001 0000 0010 + 1 = 1001 0000 0011 binary 2's complement
1001 0000 0011 = -1789 decimal

6FD = -1789 decimal 2's complement