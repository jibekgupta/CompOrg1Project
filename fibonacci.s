.data
prompt: .asciiz "Enter any positive integer N(N >=25):"
error_msg: .asciiz "Illegal Number!\n"

.text
.globl main


# Print the string stored at the 'prompt' memory location
li$v0,4
la $a0, prompt
syscall

get_input:
li$v0,5                 #load immediate value 5 into $v0
syscall                 #Invoke system call to read an integer from input
move $t0,$v0            #move the input value from $v0 to $t0

blez $t0,illegal        #Branch to 'Illegal' label if the value in $t0 is less than or equal to zero
li$t1,25                #Load immediate value 25 into register $t1
blt $t0,$t1,illegal     #Branch to 'Illegal' label if the value in $t0 is less than the value in $t1

li$v0,10                #Load immediate value 10 into register $v0
syscall                 #Invoke system call to terminate the program

illegal:
li$v0,4                 #Load immediate value 4 into $v0
la$a0, error_msg        #Load address of the 'error_msg' string into $a0
syscall                 #Invoke syscall to print the error message

j get_input              #Jump (unconditional) to the 'get_input' label

