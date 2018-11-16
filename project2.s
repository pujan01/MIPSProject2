.data
	inputLong: .asciiz "Input is too long."
	emptyInput: .asciiz "Input is empty."
	invalidNumber: .asciiz "Invalid base-30 number."
	userInput: .space 1000	#reserving the 1000 bytes of memory for userInput
	fourCharacters: .space 4
.text
main:
