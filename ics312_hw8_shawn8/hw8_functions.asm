;Shawn Anthony
;ICS 312
;Homework 8
;Only the code specified by assignment written by me, rest was provided

%include "asm_io.inc"
%define _malloc  malloc
extern	_malloc

segment .data
	getInputArray_not_implemented		db	"getInputArray not implemented!", 0
	findFirstIndex_not_implemented		db	"findFirstIndex not implemented!", 0
	findAllIndices_not_implemented		db	"findAllIndices not implemented!", 0

segment .text

global getInputArray
global findFirstIndex
global findAllIndices

;;;  Helper function to allocate memory         ;;;
;;;   - arg#1: number of bytes to allocate      ;;;
;;;  returns a pointer to allocated memory zone ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

allocate_memory:
        enter   4,0
        pusha
        pushf

        push    dword [ebp+8]
        call    _malloc
        pop     ecx
        mov     [ebp-4], eax
        popf
        popa
        mov     eax, [ebp-4]
        leave
        ret


;;;  getInputArray function (IMPLEMENTED)  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

getInputArray:
	enter	4, 0		;Create 1 local variable
	call	read_int	;Read the array size into eax
	mov 	ebx, [ebp+8]	;Point ebx to ebp+8
	mov     [ebx], eax	;Save size into ebx
	push 	eax		;Push eax onto stack for allocate_memory call
	call 	allocate_memory	;Allocate memory based on integer in eax
	add	esp, 4		;Clean stack pointer
	mov	ecx, [ebx]	;Move the size into ecx for loop counter
	mov	edx, eax	;Move eax pointer into edx for value manipulation
	mov	[ebp-4], eax	;Store pointer in ebp-4 to restore later

loop:
	call 	read_int	;Read in an integer
	mov	byte [edx], al	;Move value into edx
	inc	edx		;Increment edx to point to next spot in array
	loop	loop		;Loop until our ecx counter is 0

	mov	eax, [ebp-4]	;Restore pointer using ebp-4
	leave
	ret

;;;  findFirstIndex function (IMPLEMENTED)  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

findFirstIndex:
	enter	0,0
	mov	edi, 0		;Set up edi as counter

index_loop:
	cmp	edi, [ebp+12]	;Check if counter and number of elements is the same
	jz	no_match	;If we have checked all elements, jump to branch for no match
	mov	ecx, [ebp+8]	;Set ecx to value of first parameter ebp+8
	add	ecx, edi	;Point ecx to next index
	mov	ebx, [ecx]	;Move value of ecx into ebx
	movzx	ebx, bl 	;Zero extend bl into ebx
	push	ebx		;Push ebx onto stack
	call 	[ebp+16]	;Call function on stack at ebp+16
	add	esp, 4		;Clean up stack pointer
	cmp 	eax, 1		;Compare eax to one to check function return value
	jz	end		;If eax is one, jump to end
	inc	edi		;Increment counter
	jmp	index_loop	;Jump back to top to iterate through elements

no_match:
	mov	eax, -1		;Set return value if no match
	jmp	end_no_match	;Jump past end to finish no_match branch

end:
	mov	eax, edi	;Set return value if it is a match

end_no_match:

	leave
	ret

;;;  findAllIndices function (TO BE IMPLEMENTED)  ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

findAllIndices:
	enter	0, 0

	mov	eax, findAllIndices_not_implemented
	call	print_string
	call	print_nl
	mov	eax, -42

	leave
	ret	
