.data
prompt: .asciiz "Enter any positive integer N(N >=25):"         #Prompt for user input of a positive integer N (N >= 25)
error_msg: .asciiz "Illegal Number!\n"          #Message indicating an illegal number

.text
.globl main         #The entry point of the program

li$v0,4             #Load immediate value 4 into $v0
la$a0,prompt        #Load address of the 'prompt' message into $a0
syscall             #Invoke syscall to print the prompt message

li$v0,5             #Load immediate value 5 into $v0
syscall             #Invoke syscall to read an integer from input
move $t0,$v0        #Move the input value from $v0 to $t0

loop1:
bgt $t0,24,find_fibonacci       #Branch if the value in $t0 is greater than 24 to the 'find_fibonacci' label

li$v0,4                         #Load immediate value 4 into $v0
la$a0,error_msg                   #Load address of the 'error_msg' message into $a0
syscall                         #Invoke syscall to print the error_msg 

li$v0,4                         #Load immediate value 4 into $v0
la$a0,prompt                    #Load address of the 'prompt' message into $a0
syscall                         #Invoke syscall to print the prompt message

li$v0,5                         #Load immediate value 5 into $v0
syscall                         #Invoke syscall to read an integer from input
move$t0,$v0                     #Move the input value from $v0 to $t0

j loop1                         #Unconditionally jump to the 'loop1' label

