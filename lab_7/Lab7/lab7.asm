#
# Calculate sum from A to B.
#
# Authors: 
#	Julian Modanese, Nicolas Münchinger
#
#

.text
main:
	#
	# Your code goes here...
	#

	# Put your sum S into register $t2
	
	addi $t0, $0, 1 # this is our input A
	addi $t1, $0, 2 # this is our input B
	# check inputs for special cases:
	beq $t0, $t1, a_eq_b
	
	slt $t3, $t0, $t1
	beq $t3, $0, end # at this point we already know A!=B, so slt=0 -> B<A
	
	# we know A < B now, so let's get to the loop
	j loop
	
a_eq_b:
	add $t2, $0, $t0
	j end

loop:
	add $t2, $t2, $t0
	slt $t3, $t0, $t1
	beq $t3, $0, end
	addi $t0, $t0, 1
	j loop

end:	
	j end	# Infinite loop at the end of the program. 
