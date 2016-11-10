#A�list is defined here
.data
my_array: .word 10, 9, 2, 3, 1, 4, 6, 7, 32
.text
la $s0, my_array    # based address of list loaded into $s0
addi $s1, $zero, 9  # $s1 is set to the size of the list 

# Now you have the size and the base address of the list
# You should be able to find the mean of the list and the diffence between maximum and minimum elements in the list.
# Continue to write your code here

li   $t0, 0      # sum of list
move $t1, $s0    # memory adrees of item
mul  $t2, $s1, 4 
add  $t2, $t2, 4
add  $t2, $t2, $s0 # max register place
    
    sumLoop:
    	beq  $t1, $t2, mean
    	lw   $t3, 0($t1) # item value
    	add  $t0, $t0, $t3
    	addi $t1, $t1, 4
    	j sumLoop
    	
    mean:
    	div  $s2, $t0, $s1
    	li   $v0, 1
    	move $a0, $s2
    	syscall

li   $s4, 0      # max value
move $t1, $s0    # memory adrees of item

li   $s5, 100    # min value
move $t4, $s0    # memory adrees of item
  	
    maxLoop:
    	beq  $t1, $t2, minLoop
    	lw   $t3, 0($t1) # item value
    	addi $t1, $t1, 4
    	ble  $t3, $s4, maxLoop
    	move $s4, $t3
    	j maxLoop

     minLoop:
    	beq  $t4, $t2, diff
    	lw   $t3, 0($t4) # item value
    	addi $t4, $t4, 4
    	bge  $t3, $s5, minLoop
    	move $s5, $t3
    	j minLoop
    	
    diff:
	sub  $s3, $s4, $s5
	li   $v0, 1
	move $a0, $s3
	syscall
    
    exit:
    	li $v0, 10
    	syscall
    	
    
    	 