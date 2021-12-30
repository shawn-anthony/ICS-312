;Shawn Anthony
;ICS 312
;Homework 6
;Fall 2021
;Casanova

%include "asm_io.inc"

segment .data
    message  db      "Enter an integer: ", 0
    num      dd      0
    hexTable db      "0123456789ABCDEF", 0

segment .bss

segment .text
    global asm_main

asm_main:
    enter   0, 0                        ;Setup
    pusha

    mov     eax, message                ;Move message into eax
    call    print_string                ;Print message stored in eax
    call    read_int                    ;Read user input and store in eax
    mov     [num], eax                  ;Move user input stored in eax to num
    mov     ecx, 8           	        ;Initialize loop variable

loop:
    mov     ebx, dword[num]             ;Move user input into ebx
    rol     ebx, 4                      ;Rotate left by 4 to isolate the highest order bit in lowest order bit spot
    mov     dword[num], ebx             ;Save this new valur back into num for future iteration
    and     ebx, 0x000000F              ;And ebx with 0x000000F to clear all the but last byte
    mov     al, byte[hexTable + ebx]    ;Use the value remaining in ebx to access the right value in our hex table
    call    print_char                  ;Print the char
    dec     ecx                         ;Decrement ecx for loop logic
    cmp     ecx, 0                      ;Check if we have handled every byte
    jg      loop                        ;Jump back to start of loop if we haven't
    call    print_nl                    ;Print a newline for readability

    popa	                        ;Cleanup
    mov     eax, 0
    leave
    ret
