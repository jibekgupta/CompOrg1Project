.data
prompt: .asciiz "Enter any positive integer N(N >=25):"
error_msg: .asciiz "Illegal Number!\n"

.text
.globl main

main:
# Print the string stored at the 'prompt' memory location
li$v0,4
la $a0, prompt
syscall
