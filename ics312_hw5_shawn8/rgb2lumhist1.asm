;Shawn Anthony
;ICS 312
;Casanova
;Assingment 5
;Fall 2021


%include "asm_io.inc"

segment .data
	bin times 75 dd 0
	low dd 0
	high dd 9
	count dd 0
	luminance db "luminance ", 0
	hyphen db "-", 0
	colon db ": ", 0


segment .bss
	width resd 1 		;Width of the image
	height resd 1 		;Height of the image

segment .text
	global asm_main
asm_main:
	enter	0,0     	;Setup
	pusha
	call read_int 		;Image Width
	mov [width], eax 	;Store in width
	call read_int		;Image Height
	mov [height], eax 	;Store in height
	mov esi, [width] 	;Move width into esi
	mov edi, [height] 	;Move height into edi
height_loop:

width_loop:

	call read_int 		;Get the first value
	mov ebx, eax 		;Ebx = eax
	call read_int 		;Get the second value
	add ebx, eax 		;Ebx = ebx + eax
	call read_int 		;Get third value
	add ebx, eax 		;Ebx = ebx + eax

	cmp ebx, 740		;Check for special case luminance
	jae bin74		;Jump to special case bin
	mov eax, ebx 		;Move luminance into eax
	mov ecx, 10 		;Ecx = 10
	mov edx, 0 		;Edx = 0
	div ecx 		;Divide eax by ecx
	mov ecx, bin 		;Move address of bin into ecx
	mov ebx, 8 		;Ebx = 4
	mul ebx 		;Multiply eax by 4
	add ecx, eax 		;Add eax to the bin address
	mov ebx, [ecx] 		;Move new address into ebx
	inc ebx 		;Increment by 1
	mov [ecx], ebx 		;Move ebx into ecx

	jmp loops
bin74:				;Bin for 740-765 luminance special case
	mov ecx, bin 		;Address of bin in ecx
	mov ebx, 8		;ebx = 4
	mov eax, 74		;eax = 74
	mul ebx 		;Multiply by 4
	add ecx, eax 		;Eax in ecx (adress of bin)
	mov ebx, [ecx] 		;Value of ecx in ebx
	inc ebx 		;Increment by one
	mov [ecx], ebx 		;Ebx in ecx
loops:
	dec esi			;Width loop
	cmp esi, 0		;Check if end of line
	jne width_loop
	mov esi, [width]	;Reset width for next line

	dec edi			;Height loop
	cmp edi, 0		;Check if end of image
	jne height_loop
print_loop:
	mov eax, luminance	;Luminance in eax
	call print_string	;Print eax
	mov eax, [low]		;Low value in eax
	call print_int		;Print eax
	mov eax, [hyphen]	;Hyphen value in eax
	call print_char		;Print eax
	mov eax, [high]		;High value in eax
	call print_int		;Print eax
	mov eax, colon		;Colon value in eax
	call print_string	;Print eax
	mov eax, [count]	;Value of count in eax
	mov ebx, 8		;Ebx = 4
	mul ebx			;Multiply eax by 4
	mov ebx, bin		;Ebx = bin address
	add eax, ebx		;Eax = eax + ebx
	mov eax, [eax]		;Eax = value in eax
	call print_int		;Print luminance bin count
	call print_nl		;Print newline
	mov eax, [low]		;Low in eax
	add eax, 10		;Increment value of low to next bin
	mov [low], eax		;Eax stored in low
	mov eax, [high]		;High in eax
	add eax, 10		;Increment value of high to next bin
	mov [high], eax		;Eax stored in high
	mov eax, [count]	;Value of count in eax
	inc eax			;Increment by 1
	mov [count], eax	;Value of count = eax
	cmp eax, 75		;Check if all bins have been printed
	jne print_loop
	popa			;Cleanup
	mov	eax, 0
	leave
	ret

