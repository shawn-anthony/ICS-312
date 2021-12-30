; Shawn Anthony
; ICS 312
; HW 3 ex1
; This program takes two integer inputs from the user, then prints the ascii value of the sum
; of both integers + 65

%include "asm_io.inc"

segment .data
  msg1  db  "Enter an integer: ", 0
  msg2  db  "The output character is ", 0

segment .bss
  integer1  resd 1  ;first integer
  integer2  resd 1  ;second integer
  result  resd  1   ;result

segment .text
    global asm_main
asm_main:
    enter 0,0              ;setup
    pusha
    mov   eax, msg1        ;msg1 in eax
    call  print_string     ;msg1 printed
    call  read_int	   ;user input in eax
    mov   [integer1], eax  ;eax stored in integer1
    mov   eax, msg1        ;msg1 in eax
    call  print_string	   ;msg1 printed
    call  read_int	   ;user input in eax
    mov   [integer2], eax  ;eax stored in integer2
    mov   eax, 65	   ;eax set to 65
    add   eax, [integer1]  ;eax = eax + integer1
    add   eax, [integer2]  ;eax = eax + integer2
    mov   [result], eax    ;store eax into result
    mov   eax, msg2        ;msg2 in eax
    call  print_string     ;msg2 printed
    mov   byte al, 39      ;moving ' into al
    call  print_char       ;printing '
    mov   eax, [result]    ;result in eax
    call  print_char       ;result printed
    mov   byte al, 39      ;moving ' into al
    call  print_char       ;printing '
    call  print_nl 	   ;newline printed
    popa      		   ;cleanup
    mov eax, 0
    leave
    ret
