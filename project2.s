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

length_loop:
	lb $a0,($a1)        			# read the character
	addi $a1, $a1, 1
	
	beq $a0, 0, loop1_exit_check		#if it is a null character check if the input is empty
	beq $a0, 10, loop1_exit_check		#if there is an end line character then I will check if the input is empty or if it has valid input
	
	beq $a0, 32, length_loop		#if there is a space in front or back of the input, we just carry on with the loop
	
	beq $t9, 1, inputLongError 		# this code is executed if there is no space or endline. 
						#for the first time, the value in $t9 = 0, hence inputLongError is not thrown
						#however, if we get here for the second time, it means that a non-space character was found 
						# already, soo an input too long error is thrown. 
	li $t9, 1				# $t9 = 1 means that a non-space character is discovered
	# in these lines I am storing 4 characters after a non-space character is found in  another string named fourCharacters. 
	la $s6, fourCharacters
	#storing the first non-space character to the starting address of fourCharacters
	lb $a0, -1($a1)
	sb $a0, 0($s6)
