.data
prompt: .asciiz "Enter any positive integer N(N >=25):"         #Prompt for user input of a positive integer N (N >= 25)
error_msg: .asciiz "Illegal Number!\n"          #Message indicating an illegal number
newline: .asciiz"\n"

.text
main:

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

find_fibonacci:
move$a0,$v0                     #Move the value in register $v0 to $a0
li$t0,0                         #Load immediate value 0 into $t0
li$t1,1                          #Load immediate value 1 into $t1

move$t3,$a0                     #Move the value in $a0 to $t3
sub$t4,$t3,2                    #Subtract 2 from the value in $t3 and store the result in $t4                 

li$t5,0                         #Load immediate value 0 into $t5
li$v0,1                         #Load immediate value 1 into $v0
move$a0,$t0                     #Move the value in $t0 to $a0
syscall                         #Invoke syscall to print the integer value in $a0

li$v0,4                         #Load immediate value 4 into $v0
la$a0,newline                   #Load address of the 'newline' string into $a0
syscall                         #Invoke syscall to print the newline string

li$v0,1                         #Load immediate value 1 into $v0
move$a0,$t1 	                #Move the value in $t1 to $a0
syscall                         #Invoke syscall to print the integer value in $a0

li$v0,4                         #Load immediate value 4 into $v0
la$a0,newline                   #Load address of the 'newline' string into $a0
syscall                         #Invoke syscall to print the newline character

loop2:
beq $t5,$t4,end_program         # Branch to 'end_program' if $t5 equals $t4
add $t2,$t0,$t1                 #Add values in $t0 and $t1, storing the result in $t2
add $t0,$zero,$t1               #Move the value in $t1 to $t0
add$t1,$zero,$t2                #Move the value in $t2 to $t1

li$v0,1                         # Load immediate value 1 into $v0
move$a0,$t2                     #Move the value in $t2 to $a0
syscall                         #Invoke syscall to print the integer value in $a0

li$v0,4                         #Load immediate value 4 into $v0
la$a0,newline                   #Load address of the 'newline' string into $a0
syscall                         #Invoke syscall to print the newline character

addi$t5,$t5,1                   #Add immediate value 1 to $t5
j loop2                         #Unconditionally jump to 'loop2'

end_program:                    
li$v0,10                        #Load immediate value 10 into $v0
syscall                         #Invoke syscall to terminate the program