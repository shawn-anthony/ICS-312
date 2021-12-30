Shawn Anthony
ICS 312
Fall 2021
Casanova
Assignment 4


2-byte quantities: 9210 + C123

  9210 = 1001 0010 0001 0000
+ C123 = 1100 0001 0010 0011   
=      1 0101 0011 0011 0011

Carry bit is set

MSB of 9210 is 1, therefore it is less than zero, 2's complement of 9210 is 0110 1101 1111 0000, which is -28144 in decimal
MSB of C123 is 1, therefore it is less than zero, 2's complement of C123 is 0011 1110 1101 1101, which is -16093 in decimal

  -28144
+ -16093
= -34237

-34237 is not between -32768 and 32767
Overflow bit is set

print_int will print: 21299

2-byte quantities: 2100 + 7033

  2100 = 0010 0001 0000 0000 
+ 7033 = 0111 0000 0011 0011
=        1001 0001 0011 0011

Carry bit not set

MSB of 2100 is 0, therefore it is greater than zero, 2100 is 8448 in decimal
MSB of 7033 is 0, therefore it is greater than zero, 7033 is 28723 in decimal

   8448
+ 28723
= 37171

37171 is not between -32768 and 32767
Overflow bit is set
 
print_int will print: -28365

1-byte quantities: B5 + 25

  B5 = 1011 0101 
+ 25 = 0010 0101
=      1101 1010

Carry bit not set

MSB of B5 is 1, therefore it is less than zero, 2's complement of B5 is 6B, which is -59 in decimal
MSB of 25 is 0, therefore it is greater than zero, 25 is 21 in decimal

  -59
+  21
= -38

-38 is between -128 and 127
Overflow bit is not set

print_int will print: -38

1-byte quantities: E1 + D4

  E1 = 1110 0001 
+ D4 = 1101 0100
=    1 1011 0101

Carry bit is set

MSB of E1 is 1, therefore it is less than zero, 2's complement of E1 is 1E, which is -23 in decimal
MSB of D4 is 1, therefore it is less than zero, 2's complement of D4 is 2C, which is -28 in decimal

  -23
+ -28
= -51

-51 is between -128 and 127
Overflow bit is not set

print_int will print: -75