Shawn Anthony
ICS 312
Fall 2021
Casanova
Assignment 2


Exercise #1: Memory Layout

A       db      "d", 0, "af", 27o, 0
B       dw      011FAh
C       times 2 dw      -15
D       db      043h, 0AAh
E       dw  009h
F       dw  -34o, 0

Question #1

A                 B     C           D     E     F
64 00 61 66 17 00 FA 11 F1 FF F1 FF 43 AA 09 00 E4 00
 
Question #2

A - No change

B - Yes, it would be different

C - Yes, it would be different

D - No change

E - Yes, it would be different

F - Yes, it would be different




Exercise #2: Memory and Registers


L1    L2                L3       L4
01 B3 68 65 6C 6C 6F 00 A1 B2 C3 13 00 FA

mov     eax, [L3]
inc     eax
mov     [L2], eax
mov     bx, [L4]
mov     eax, L3
mov     ecx, [L1]
add     bl, cl
mov     [eax], bx


mov     eax, [L3]:
		- eax: 00 C3 B2 A1 
		- RAM: 01 B3 68 65 6C 6C 6F 00 A1 B2 C3 13 00 FA

inc     eax
		- eax: 00 C3 B2 A2
		- RAM: 01 B3 68 65 6C 6C 6F 00 A1 B2 C3 13 00 FA

mov     [L2], eax
		- eax: 00 C3 B2 A2
		- RAM: 01 B3 A2 B2 C3 00 6F 00 A1 B2 C3 13 00 FA

mov     bx, [L4]
		-  bx: FA 00
		- RAM: 01 B3 A2 B2 C3 00 6F 00 A1 B2 C3 13 00 FA

mov     eax, L3
		- eax: eax points to 9th byte
		- RAM: 01 B3 A2 B2 C3 00 6F 00 A1 B2 C3 13 00 FA

mov     ecx, [L1]
		- ecx: 00 00 B3 01
		- RAM: 01 B3 A2 B2 C3 00 6F 00 A1 B2 C3 13 00 FA

add     bl, cl
		-  bl: 01 - added cl to bl and put back into bl (00 + 01) 
		- RAM: 01 B3 A2 B2 C3 00 6F 00 A1 B2 C3 13 00 FA

mov     [eax], bx
		-  bx: FA 01 - bx moved to eax pointing at 9th byte
		- RAM: 01 B3 A2 B2 C3 00 6F 00 01 FA C3 13 00 FA


Final Memory Content - 01 B3 A2 B2 C3 00 6F 00 01 FA C3 13 00 FA

