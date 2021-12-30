;Shawn Anthony
;ICS 312
;HW 3 ex2
;Uses offsets to manipulate a string in the designated way before using a single print call to output the final
;string after manipulation

%include "asm_io.inc"
segment .data
	a dd 0
	e dd 0
	
segment .text 

global asm_main 

asm_main: 
enter 0,0 
pusha 

cmp     dword [e], 1 
jnz     label_10 
mov eax,3 
mov [a], eax 
jmp     label_20 

label_10: 
mov eax,4 
mov [a], eax 

label_20: 
mov eax, [a] 
call print_int 
call print_nl 

popa 
mov eax,0 
leave 
ret