#A�list is defined here
.data
my_array: .word 10, 9, 2, 3, 1, 4, 6, 7, 32
.text
la $s0, my_array    # based address of list loaded into $s0
addi $s1, $zero, 9  # $s1 is set to the size of the list 

# Now you have the size and the base address of the list
# You should implement sorting algorithms that provided to you in assignment guide
# After sorting the array you should be able to find the median of the list
# Continue to write your code here

li $t0, 0 # i

    loop1:
    	bge  $t0, $s1, median 
	move $t1, $t0 # j
	move $t2, $t1 # temp_mininum_index
	loop2:
	    bge  $t1, $s1, loop2End
	    
	    sll  $t4, $t1, 2
	    add  $t4, $t4, $s0
	    lw   $t5, 0($t4) # my_array[j]
	    
	    sll  $t4, $t2, 2
	    add  $t4, $t4, $s0 
	    lw   $t6, 0($t4) # my_array[temp_minimum_index]

	    bge  $t5, $t6, ifend
	    move $t2, $t1
	    ifend:
	    
	    addi $t1, $t1, 1	    	
	    j loop2
	loop2End:
	
	sll  $t4, $t0, 2
	add  $t4, $t4, $s0
        lw   $t3, 0($t4)
        
        sll  $t5, $t2, 2
        add  $t5, $t5, $s0
        lw   $t6, 0($t5)
        
        sw   $t6, 0($t4)
        sw   $t3, 0($t5)
    	
    	addi $t0, $t0, 1
    	j loop1
    

median:
    div  $t4, $s1, 2
    sll  $t4, $t4, 2
    add  $t4, $t4, $s0
    lw   $s2, 0($t4)
	
    li   $v0, 1
    move $a0, $s2
    syscall
	        
exit:  	
    li $v0, 10
    syscall 