.data
prompt: .asciiz "Enter any positive integer N(N >=25):"         #Prompt for user input of a positive integer N (N >= 25)
error_msg: .asciiz "Illegal Number!\n"          #Message indicating an illegal number

.text
.globl main         #The entry point of the program
