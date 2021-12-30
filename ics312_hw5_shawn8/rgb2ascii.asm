;Shawn Anthony
;ICS 312
;Casanova
;Assignment 5
;Fall 2021


%include "asm_io.inc"

segment	.data
	char0	db	".", 0		;Char for 0 to 84
	char1	db	"`", 0		;Char for 85 to 169
	char2	db	",", 0		;Char for 170 to 254
	char3	db	":", 0		;Char for 255 to 339
	char4	db	"i", 0		;Char for 340 to 424
	char5	db	"l", 0		;Char for 425 to 508
	char6	db	"w", 0		;Char for 509 to 594
	char7	db	"X", 0		;Char for 595 to 679
	char8	db	"W", 0		;Char for 680 to 765

segment	.bss
	rgb	resd	1		;Rgb luminance value
	height	resd	1		;Image height
	width	resd	1		;Image Width

segment	.text
	global	asm_main

asm_main:
	enter	0,0
	pusha				;Setup
	mov 	edx, 0			;Check new lines
	mov 	ecx, 0			;Check width
	call 	read_int 		;Read width
	mov 	[width], eax 		;Atore width
	call 	read_int 		;Read height
	mov	[height], eax		;Store height

check:					;Jump here after print
	cmp	edx, [height]		;Check if edx equal to height
	je 	end			;If edx is equal, jump to end
	cmp	ecx, [width]		;Check if ecx equal to width
	je	newline			;if ecx is equal, jump to newline
	mov 	dword [rgb], 0 		;Set rgb to 0

	call 	read_int 		;Read first value
	mov 	[rgb], eax 		;Rgb = eax
	call 	read_int 		;Read second value
	add 	[rgb], eax 		;Rgb = rgb + eax
	call 	read_int 		;Read third value
	add 	[rgb], eax 		;Rgb = rgb + eax

	cmp 	dword [rgb], 84 	;Compare rgb to 84
	jle 	period 			;Rgb <= 84 jump to period

	cmp 	dword [rgb], 169 	;Compare rgb to 169
	jle 	backtick 		;Rgb <= 169 jump to backtick

	cmp 	dword [rgb], 254 	;Compare rgb to 254
	jle 	comma 			;Rgb <= 254 jump to comma

	cmp 	dword [rgb], 339 	;Compare rgb to 339
	jle 	colon 			;Rgb <= 339 jump to colon

	cmp 	dword [rgb], 424 	;Compare rgb to 424
	jle 	i 			;Rgb <= 424 jump to i

	cmp 	dword [rgb], 509 	;Compare rgb to 509
	jle 	l 			;Rgb <= 509 jump to l

	cmp 	dword [rgb], 594 	;Compare rgb to 594
	jle 	w 			;Rgb <= 594 jump to w

	cmp 	dword [rgb], 679 	;Compare rgb to 679
	jle 	X 			;Rgb <= 679 jump to X

	cmp 	dword [rgb], 765 	;Compare rgb to 765
	jle 	W 			;Rgb <= 765 jump to W

	jmp	end

period:					;Rgb 0 - 84
	mov 	eax, char0		;Eax points to char0
	call 	print_string 		;Print char0
	call 	print_string
	inc	ecx
	jmp 	check	 		;Jump back to check

backtick:				;Rgb 85 - 169
	mov 	eax, char1	 	;Eax points to char1
	call 	print_string 		;Print char1
	call 	print_string
	inc	ecx
	jmp 	check	 		;Jump back to check

comma:					;Rgb 170 - 254
	mov 	eax, char2 		;Eax points to char2
	call 	print_string 		;Print char2
	call 	print_string
	inc	ecx
	jmp 	check 			;jump back to check again

colon:					;Rgb 255 - 339
	mov 	eax, char3 		;Eax points to char3
	call 	print_string 		;Print char3
	call 	print_string
	inc	ecx
	jmp 	check 			;Jump back to check

i:					;Rgb 340 - 424
	mov 	eax, char4 		;Eax points to char4
	call 	print_string 		;Print char4
	call 	print_string
	inc	ecx
	jmp 	check			;Jump back to check

l:					;Rgb 425 - 509
	mov 	eax, char5 		;Eax points to char5
	call 	print_string 		;print c5 twice
	call 	print_string
	inc	ecx
	jmp 	check			;Jump back to check

w:					;Rgb 510 - 594
	mov 	eax, char6 		;Eax points to char6
	call 	print_string		;Print char6
	call 	print_string
	inc	ecx
	jmp 	check			;Jump back to check

X:					;Rgb 595 - 679
	mov 	eax, char7 		;Eax points to char7
	call 	print_string 		;Print char7
	call 	print_string
	inc	ecx
	jmp 	check			;Jump back to check

W:					;Rgb 680 - 765
	mov 	eax, char8		;Eax points to char8
	call 	print_string 		;Print char8
	call 	print_string
	inc	ecx
	jmp 	check			;jump back to check

newline:
	inc	edx			;Increment newline
	call	print_nl
	mov	ecx, 0			;Reset to 0
	jmp	check

end:					;End
	popa				;Cleanup
	mov	eax, 0
	leave
	ret
