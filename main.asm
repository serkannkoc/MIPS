# 150118073 Serkan Koç
# 150120056 Haldun Halil Olcay
# 150119639 Erdem Pehlivanlar
# 150119657 Abdulkerim Talha Timur
.data       
	# menu
	welcome:  .asciiz "Welcome to our MIPS project!\n"
	menu:     .asciiz "Main Menu: \n1. Find Palindrome \n2. Reverse Vowels \n3. Find Distinct Prime \n4. Lucky Number \n5. Exit\n"
	option:   .asciiz "Please select an option: "
	bye:      .asciiz "Program ends. Bye :)"
	error:    .asciiz "Error: your number should be between 1-5\n"
	
	# question 1
	

	# question2
        input_msg: 
	.asciiz "Input: "
	str:
	.space 1000
	volwes: 
	.space 1000

        # question 3                         
	prompt: .asciiz "Enter a number: "
	yes:    .asciiz "Square-free number\n"
	no:     .asciiz "!! Not a square-free number\n"
	
	# question 4  
	
.text      

main:	
	li   $v0, 4    	  	 # Syscall to print "menu:"
	la   $a0, welcome  
        syscall
      
menuloop:
	li   $v0, 4    	  	 # Syscall to print "menu:"
	la   $a0, menu  
        syscall
        
        li   $v0, 4    	  	 # Syscall to print "option input"
	la   $a0, option
        syscall
        
        li   $v0, 5     	 # Syscall to read an integer
	syscall
	
	addi $t0, $zero, 1
	beq $t0, $v0, part1	# input ==? 1
	addi $t0,$t0 , 1
	beq $t0, $v0, part2 	# input ==? 2
	addi $t0,$t0, 1
	beq $t0, $v0, part3	# input ==? 3
	addi $t0,$t0, 1
	beq $t0, $v0, part4	# input ==? 4
	addi $t0,$t0, 1
	beq $t0, $v0, Exit	# input ==? 5
	
	beq $t0, $v0, Exit    # input other than 1-5
    	addi $t0,$t0, 1
    	ble $t0, $v0, Error

    	part1: j Q1
   	part2: j Q2
    	part3: j Q3
    	part4: j Q4

    	Error:     li   $v0, 4               # Syscall to print "menu:"
        la   $a0, error
            syscall
            j menuloop
	
	Exit: 	li   $v0, 4    	  		 # Syscall to print "bye"
		la   $a0, bye
        	syscall
        	
		li $a0, 0	#clear registers
		li $a1, 0        	
		li $t0, 0
		li $t1, 0
		li $t2, 0
		li $t3, 0
		li $t4, 0
		li $t5, 0
		li $t6, 0
		li $t7, 0
		li $t8, 0
		li $t9, 0

		li $s0, 0
		li $s1, 0
		li $s2, 0
		li $s3, 0
		li $s4, 0
		li $s5, 0
		li $s6, 0
		li $s7, 0
        
		li $v0, 10	#End of program
		syscall
	
#################################################################################
Q1:
	j menuloop
	
#################################################################################
Q2: 
li $v0, 4 # print input message to console
	la $a0, input_msg
	syscall
	
	li $v0, 8 # read string from console
	la $a0, str
	li $a1, 1000
	syscall
	la $a2, volwes
	
	
store_vowels:
	addi $sp, $sp, -8 # arranging stack for the i  and j
	sw $s1, 4($sp)
	sw $s0, 0($sp)
	add $s0, $zero, $zero # i = 0
	add $s1, $zero, $zero # j = 0
L1:
	add $t1, $s0, $a0 # address of str[i] in $t1
	lbu $t2, 0($t1) # loading the value of str[i] to $t2
	beq $t2, $zero, reset_i # if str[i] = '0' end loop
	add $t4, $s1, $a2 # address of volwes[j] in $t4
	lbu $t5, 0($t4) # loading the value of volwes[j] to $t5
	
			#this code segment checks ascii values of the vowels with the input char
	li $t3, 0x61
	beq $t2, $t3, vowel
	li $t3, 0x65
	beq $t2, $t3, vowel
	li $t3, 0x69
	beq $t2, $t3, vowel
	li $t3, 0x6f
	beq $t2, $t3, vowel
	li $t3, 0x75
	beq $t2, $t3, vowel
	li $t3, 0x41
	beq $t2, $t3, vowel
	li $t3, 0x45
	beq $t2, $t3, vowel
	li $t3, 0x49
	beq $t2, $t3, vowel
	li $t3, 0x4f
	beq $t2, $t3, vowel
	li $t3, 0x55
	beq $t2, $t3, vowel
	j not_vowel
	
vowel: #storing the vowels
	sb $t2, ($t4)	# vowel[j++] = str[i];
	addi $s1, $s1, 1 # j++
	addi $s0, $s0, 1 # i++
	j L1
	
not_vowel:
	addi $s0, $s0, 1 # i++
	j L1
	
reset_i:
	add $s0, $zero, $zero # i = 0
	j place_vowels
place_vowels:
	add $t1, $s0, $a0 # address of str[i] in $t1
	lbu $t2, 0($t1) # loading the value of str[i] to $t2
	add $t4, $s1, $a2 # address of volwes[j] in $t4
	lbu $t5, -1($t4) # loading the value of volwes[j] to $t5
	beq $t2, $zero, L2 # if str[i] = '0' end loop
			
			#this code segment checks ascii values of the vowels with the input char
	li $t3, 0x61
	beq $t2, $t3, vowel_2
	li $t3, 0x65
	beq $t2, $t3, vowel_2
	li $t3, 0x69
	beq $t2, $t3, vowel_2
	li $t3, 0x6f
	beq $t2, $t3, vowel_2
	li $t3, 0x75
	beq $t2, $t3, vowel_2
	li $t3, 0x41
	beq $t2, $t3, vowel_2
	li $t3, 0x45
	beq $t2, $t3, vowel_2
	li $t3, 0x49
	beq $t2, $t3, vowel_2
	li $t3, 0x4f
	beq $t2, $t3, vowel_2
	li $t3, 0x55
	beq $t2, $t3, vowel_2
	j not_vowel_2

vowel_2: #adding the reverse order vowels
	sb $t5, ($t1)	#str[i] = vowel[--j]
	subi $s1, $s1, 1 #--j
	addi $s0, $s0, 1 #i++
	j place_vowels

not_vowel_2:
	addi $s0, $s0, 1 # i++
	j place_vowels


	
L2:	lw $s0, 0($sp)
	lw $s1, 4($sp)
	addi $sp, $sp, 8
	
	
	li $v0, 4 # print the string to console
	la $a0, str
	syscall
	
	j menuloop
#################################################################################
Q3:
	# Prompt for input
    	li $v0, 4
    	la $a0, prompt
    	syscall

    	# Read input
    	li $v0, 5
    	syscall
    	move $s0, $v0 #input is moved to s0
    	move $s5, $v0

	    # If n is even, divide by 2  
    				 
    	andi $t0, $s0, 1 # if last bit is 0 it is even if 1 it is odd # if (n % 2 == 0)
    	beq $t0, 0, even # if number is even go to even 
    	j odd # jump to odd

even:
	srl $s0, $s0, 1 #if even divide by 2 # n = n/2;

odd:
    	# Check if 2 divides n again
    	andi $t0, $s0, 1 #if it divides by 2 again than we divided our number by 2 two times which means it is not suare free number #if (n % 2 == 0)
    	beq $t0, 0, not_square_free #return false;

   	 # Check for prime factors
   	 li $s1, 3 # i = 3
loop:
    	# Check if i is greater than sqrt(n)
   	 move $t0, $s1 # t0 = i
   	 move $a0, $s0 # a0 = number
  	 jal isqrt # jump to square root method
   	 move $t1, $v0 # move returned value to t1
    	bgt $s1, $t1, square_free # if i>sqrt(num) jump to square free

    	# Check if i is a prime factor
    	move $s2, $s0
   
    	div $s2, $s0, $s1 #if (n % i == 0)
    	mfhi $t0 #load remainder
   	bne $t0, $0, x #continue looping

    	div $s0, $s0, $s1 #n = n/i;
    	mfhi $t0
    
    	move $s3,$s0
    	div $s3, $s0, $s1 #if (n % i == 0)
    	mfhi $t0
    
    	beq $t0, $0, not_square_free #return false;

x:
    	addi $s1, $s1, 2
    	j loop

square_free: # print out yes to console
    	li $v0, 4
    	la $a0, yes
    	syscall
    	j exit

not_square_free: # print out no to console
    	li $v0, 4
    	la $a0, no
    	syscall
    	j menuloop

exit:
    	j menuloop

isqrt:
  	# v0 - return / root
  	# t0 - bit
  	# t1 - num
  	# t2,t3 - temps
  	move  $v0, $zero        # initalize return
  	move  $t1, $a0          # move a0 to t1

  	addi  $t0, $zero, 1
  	sll   $t0, $t0, 30      # shift to second-to-top bit

isqrt_bit:
  	slt   $t2, $t1, $t0     # num < bit
  	beq   $t2, $zero, isqrt_loop

  	srl   $t0, $t0, 2       # bit >> 2
  	j     isqrt_bit

isqrt_loop:
  	beq   $t0, $zero, isqrt_return

  	add   $t3, $v0, $t0     # t3 = return + bit
  	slt   $t2, $t1, $t3
  	beq   $t2, $zero, isqrt_else

  	srl   $v0, $v0, 1       # return >> 1
  	j     isqrt_loop_end

isqrt_else:
  	sub   $t1, $t1, $t3     # num -= return + bit
  	srl   $v0, $v0, 1       # return >> 1
  	add   $v0, $v0, $t0     # return + bit

isqrt_loop_end:
  	srl   $t0, $t0, 2       # bit >> 2
  	j     isqrt_loop

isqrt_return:
  	jr  $ra

#################################################################################
Q4:
    	j menuloop
