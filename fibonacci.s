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

get_input:
li$v0,5                 #load immediate value 5 into $v0
syscall                 #Invoke system call to read an integer from input
move $t0,$v0            #move the input value from $v0 to $t0

blez $t0,Illegal        #Branch to 'Illegal' label if the value in $t0 is less than or equal to zero
li$t1,25                #Load immediate value 25 into register $t1
blt $t0,$t1,Illegal     #Branch to 'Illegal' label if the value in $t0 is less than the value in $t1

li$v0,10                #Load immediate value 10 into register $v0
syscall                 #Invoke system call to terminate the program