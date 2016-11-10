.data

.text

li $s0, 0 # sum
li $t0, -1 # x

    forLoop:
        addi $t0, $t0, 2
 	beq $t0, 11, exit     	
	li  $t1, 0 # y
	
	whileLoop:
	    bgt  $t1, $t0, forLoop
	    add  $s0, $s0, $t1
	    addi $t1, $t1, 1
	    j whileLoop

    exit:  	
    	li $v0, 10
    	syscall 