.data
	inputLong: .asciiz "Input is too long."
	emptyInput: .asciiz "Input is empty."
	invalidNumber: .asciiz "Invalid base-30 number."
	userInput: .space 1000	#reserving the 1000 bytes of memory for userInput
	fourCharacters: .space 4
.text
main:
	#asking the user for input
	li $v0, 8
	la $a0, userInput
	li $a1, 1000	
	syscall
	la $a1, userInput
	li $t9, 0				#if it is 0, then a valid character is not found. 1 means a non-space character is found
