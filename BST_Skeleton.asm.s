.data 
msg1:       .asciiz "This tree contains: "
msg2:       .asciiz "This tree doesn't contain: "
msg3:       .asciiz "After delete: "
newline:    .asciiz "\n"
space:	    .asciiz " "

.text 
.globl main
main:
	li $a0, 72		# struct bTree* btree = newTree(72);
	jal newTree		#
	move $t0, $v0		# copy the address of bTree to t0
	
	move $a0, $t0		# add(root, 12);
	li $a1, 12		#
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal addNodeToTree	#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer
	
	move $a0, $t0		# add(root, 52);
	li $a1, 52		#
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal addNodeToTree	#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 	
	
	move $a0, $t0		# add(root, 87);
	li $a1, 87		#
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal addNodeToTree	#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	move $a0, $t0		# add(root, 18);
	li $a1, 18		#
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal addNodeToTree	#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	move $a0, $t0		# add(root, 49);
	li $a1, 49		#
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal addNodeToTree	#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
			
	move $a0, $t0		# printTree(bTree);
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal printTree		#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 

# you can add more test cases here

	#add(root, 96)
	move $a0, $t0	
	li $a1, 96
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	jal addNodeToTree
	lw $t0, 0($sp)
	addu $sp, $sp, 4
	
	move $a0, $t0		# printTree(bTree);
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal printTree		#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	#add(root, 37)
	move $a0, $t0		
	li $a1, 37
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	jal addNodeToTree
	lw $t0, 0($sp)
	addu $sp, $sp, 4
	
	move $a0, $t0		# printTree(bTree);
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal printTree		#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	
	#contain(bTree->root, 52)
	move $a0, $t0
	lw $a0, 0($a0)
	li $a1, 52
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	jal contain
	beqz $v0, failure #checking result
	#otherwise returns 1 meaning success
	li $v0, 4
	la $a0, msg1
	syscall
	move $a0, $a1
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j endOfContain
		failure:
			li $v0, 4
			la $a0, msg2
			syscall
			move $a0, $a1
			li $v0, 1
			syscall
			li $v0, 4
			la $a0, newline
			syscall
			j endOfContain
	endOfContain:
		lw $t0, 0($sp)
		addu $sp, $sp, 4
		
	#contain(bTree->root, 3)
	move $a0, $t0
	lw $a0, 0($a0)
	li $a1, 3
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	jal contain
	beqz $v0, failure2
	#otherwise returns 1 meaning success
	li $v0, 4
	la $a0, msg1
	syscall
	move $a0, $a1
	li $v0, 1
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j endOfContain2
		failure2:
			li $v0, 4
			la $a0, msg2
			syscall
			move $a0, $a1
			li $v0, 1
			syscall
			li $v0, 4
			la $a0, newline
			syscall
			j endOfContain2
	endOfContain2:
		lw $t0, 0($sp)
		addu $sp, $sp, 4
		
	#delete(bTree->root, 18)
	move $a0, $t0
	lw $a0, 0($a0)
	li $a1, 18
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	jal delete
	lw $t0, 0($sp)
	addu $sp, $sp, 4
	
	move $a0, $t0		# printTree(bTree);
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal printTree		#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	#delete(bTree->root, 96)
	move $a0, $t0
	lw $a0, 0($a0)
	li $a1, 96
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	jal delete
	lw $t0, 0($sp)
	addu $sp, $sp, 4
	
	move $a0, $t0		# printTree(bTree);
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal printTree		#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	#delete(bTree->root, 87)
	move $a0, $t0
	lw $a0, 0($a0)
	li $a1, 87
	subu $sp, $sp, 4
	sw $t0, 0($sp)
	jal delete
	lw $t0, 0($sp)
	addu $sp, $sp, 4
	
	move $a0, $t0		# printTree(bTree);
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp) 		# save the parameter
	jal printTree		#
	lw $t0, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	li $v0, 10		# exit the program
	syscall
	
# construct a tree
# 
# input: $a0 the value of the root node
#
# output: $v0 the address of the tree

newTree :
	move $t0, $a0		# copy the value of the root node to t0
	
	subu $sp, $sp, 4 	# adjust the stack pointer 
	sw $ra, 0($sp) 		# save the return address on stack 
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $a0, 0($sp) 		# save the parameter 
	
	li $a0, 3		# (struct Node*)malloc(sizeof(struct Node));
	jal malloc		# create a 3 words length space for root node
	move $t1, $v0		# copy the address of root node to t1
	
	sw $t0, 0($t1)		#root->value = value;
	li $t2, 0 
	sw $t2, 8($t1)		#root->rightChild = NULL;
	sw $t2, 4($t1)		#root->leftChild = NULL;
	
	li $a0, 1		# (struct bTree*)malloc(sizeof(struct bTree));
	jal malloc		# create a 1 word length space for bTree
	move $t2, $v0		# copy the address of root node to t2
	
	sw $t1, 0($t2)		# bTree->root = root;
				#$t1 has roots characteristics and $t2 is the bTree of $t1, $t1 inside $t2
	
	move $v0, $t2		# set the return value to v0
	lw $a0, 0($sp) 		# get the parameter 
	addu $sp, $sp, 4		# adjust the stack pointer 
	lw $ra, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	jr $ra
	
# add a node to tree
# 
# input: $a0 the address of the tree
#	 $a1 the value you want to add to the tree

addNodeToTree :
	subu $sp, $sp, 4 	# adjust the stack pointer 
	sw $ra, 0($sp) 		# save the return address on stack 
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $a0, 0($sp) 		# save the parameter 
	
	lw $a0, 0($a0)		# addNode(bTree->root);
	jal addNode
	
	lw $a0, 0($sp) 		# get the parameter 
	addu $sp, $sp, 4	# adjust the stack pointer 
	lw $ra, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	jr $ra

# insertNode function, created to avoid constant call of malloc in every recursive call in addNode
# input:	$a0 the address of the root/current node
#		$a1 the address of the new child node
insert:
	lw $t1, 0($a1)			# $t1 = new->value
	
	Loop:
		lw $t0, 0($a0)		# $t0 = current->value
		
		
		blt $t1, $t0, nodegoLeft	# if current->value > new->value, nodegoLeft
		#otherwise now new->value > current->value
		lw $t0, 8($a0)		# $t0 = current->rightChild
		beq $t0, $zero, insertRight	# if current has no rightChild, insertRight
		#current node has rightchild so recurse now
			move $a0, $t0		# current = current->rightChild
			j Loop	
			insertRight:
				sw $a1, 8($a0)	# current->rightChild = new
				jr $ra		# return
		
		nodegoLeft:
		lw $t0, 4($a0)		# $t0 = current->leftChild
		beq $t0, $zero, insertLeft	# if current node has no leftChild, insertLeft
		#current node has leftChild so recruse now
			move $a0, $t0		# current = current->leftChild
			j Loop	
			insertLeft:
				sw $a1, 4($a0)		# current->leftChild = new
				jr $ra			
	
	exit:
		jr $ra		

# please implement this method
#
# add a node to tree
# 
# input: $a0 the address of the root node
#	 $a1 the value you want to add to the tree
#
# hint: you need to write a recursive call here

addNode :
	subu $sp, $sp, 12	
	sw $a0, 0($sp)	# push root to stack
	sw $a1, 4($sp)	# push value to stack
	sw $ra, 8($sp)	# push return address to stack
	
	li $a0, 3	# malloc(sizeof(struct Node));
	jal malloc	# create memory space for new node

	lw $a0, 0($sp)	# load root from stack
	lw $a1, 4($sp)	# load value from stack
	addi $sp, $sp, 8	# pop root and value from stack

	sw $a1,   0($v0)	# new->value = value;
	sw $zero, 8($v0)	# new->rightChild = NULL;
	sw $zero, 4($v0)	# new->leftChild = NULL;
	#new node address now in $v0
	move $a1, $v0	# move new node to $a1
	jal insert # call insert with parameters of new node ($a1) and root node ($a0)	
	lw $ra, 0($sp)	# load return address from stack
	addi $sp, $sp, 4	# pop return address from stack
	jr $ra              

	
#findNode 
#input :	$a0 the address of root/current node
#		$a1 value of node to find
#output:	$v0 address of node found

findNode:
	findLoop:
		beq $a0, $zero, end	#base case, if node == NULL then end
		lw $t0, 0($a0)		#$t0 = current->value, 72
		beq $t0, $a1, end	#if input value == current-> value, exit
		blt $a1, $t0, branchLeft	#if input value < current->value, branchLeft
		#otherwise input value > current->value so branching right
		lw $a0, 8($a0)	#$t1 = current->rightChild
		j findLoop 	#recurse right subtree
		branchLeft:
			lw $a0, 4($a0)	#current = current->leftChild
			j findLoop	#recurse left subtree
	end:
		move $v0, $a0	#moving found node address to output $v0
		jr $ra
	
		
# please implement this method
#
# delete a node from tree, you still need to use free() to 
# release the memory when a node is removed
# 
# input: $a0 the address of the tree
#	 $a1 the value you want to delete from the tree
#
# hint: like addNodeToTree or printTree method, you may need 
#	to create another recursive method to implement delete

delete:
	subu $sp, $sp, 4	
	sw $ra, 0($sp)		#push return address to stack
	subu $sp, $sp, 4
	sw $a0, 0($sp)		#push tree address to stack
	subu $sp, $sp, 4
	sw $a1, 0($sp)		#push node to be deleted to stack
	jal findNode	#calling findnode with parameters root's address ($a0) and value to be deleted ($a1)
			#to get node to be deleted's address
	#$v0 now has node to be deleted's address
	lw $t0, 4($v0)	#$t0 = current->leftChild
	lw $t1, 8($v0)	#$t1 = current->rightChild
	beqz $t0, rightTakeOver		#if current->leftChild == NULL, rightTakeOver
	beqz $t1, leftTakeOver		#if current->rightChild  == NULL, leftTakeOver
	
	#otherwise has two children, complicated case
	move $s0, $t0	#struct Node *temp = current->leftChild
	lw $t4, 8($s0)	#$t4 = temp->rightChild
	beqz $t4, rightOfLeftNull
	#else
	move $t5, $s0	#struct Node *n = temp
	lw $s0, 8($t5)	#temp = n->rightChild
	goTowardsRight:
		lw $t2, 8($s0)	#$t0 = temp->rightChild
		beqz $t2, goTowardsLeft
		lw $s0, 8($s0)	#temp = temp->rightChild
		lw $t5, 8($t5)	#n = n->rightChild
		j goTowardsRight
	goTowardsLeft:
		lw $t2, 4($s0)	#temp->leftChild
		sw $t2, 8($t5)	#n->rightChild = temp->leftChild
		j delElse
	rightOfLeftNull:
		lw $t2, 4($s0)	#$t2 = temp->leftChild
		sw $t2, 4($v0)	#current->leftChild = temp->leftChild
		j delElse
	delElse:
		lw $t2, 0($s0)	#$t0 = temp->value
		sw $t2, 0($v0)	#current->value = temp->value
		
		#go to free
		move $a0, $s0
		li $a1, 3
		jal free
		
		lw $v0, 4($sp)
		j delEnd
	
	rightTakeOver:
		lw $t2, 8($v0)	#$t2 = current->rightChild
		move $a0, $v0 	#set free parameter to current node that needs to be deleted
		li $a1, 3	#set other free parameter to sixe of node which is 3 words
		jal free
		move $v0, $t2	
		j delEnd		#return $t2 (current->rightChild)
	
	leftTakeOver:
		lw $t3, 4($v0)	#t3 = current->leftChild
		move $a0, $v0	#set free parameter to current node that needs to be deleted
		li $a1, 3	#set other parameter to size of node, 3 words
		jal free
		move $v0, $t3
		j delEnd		#return $t3 (current->leftChild)
		
	delEnd:
		#restore the stack
		lw $a1, 0($sp)
		addiu $sp, $sp, 4
		lw $a0, 0($sp)
		addiu $sp, $sp, 4
		lw $ra, 0($sp)
		addiu $sp, $sp, 4
		jr $ra
		

# please implement this method
#
# check whether the tree contains the input value
# 
# input: $a0 the address of the tree
#	 $a1 the value you want to search from the tree
#
# output: $v0 | 1:if the tree contains this value; 
#	      | 0: if the tree doesn't contain this value
#
# hint: like addNodeToTree or printTree method, you may need 
#	to create another recursive method to implement contain

contain:
	lw $t0, 0($a0)		# $t0 = current->value
	beq $a1, $t0, found	# if the input value matches current node's value
	blt $a1, $t0, containgoLeft	# if input value < current->value, goLeft
	blt $t0, $a1, containgoRight	# if current->value < input value, goRight
	
	
	containgoLeft:
		lw $t1, 4($a0)	#$t4 = current->leftChild
		beqz $t1, notFound	#if current->leftChild == NULL, notFound
		lw $a0, 4($a0)	#current = current->leftChild
		j contain	#recurse with current->leftChild as $a0 and same input value as $a1
	
	containgoRight:
		lw $t1, 8($a0)	#$t6 = current->rightChild
		beqz $t1, notFound	# if current->rightChild == NULL, notFound
		lw $a0, 8($a0)	# current = current->rightChild
		j contain	#recurse with current->rightChild as $a0 and same input value as $a1
	
	found:
		li $v0, 1	#set output as 1, success
		j exitContain
	notFound:
		li $v0, 0	#set output as 0, failure
	
	exitContain:	
		jr $ra

# print the tree
# 
# input: $a0 the address of the tree

printTree:
	subu $sp, $sp, 4 	# adjust the stack pointer 
	sw $ra, 0($sp) 		# save the return address on stack 
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $a0, 0($sp) 		# save the parameter 
	
	lw $a0, 0($a0)		# printInorder(bTree->root);
	jal printInorder
	
	lw $a0, 0($sp) 		# get the parameter 
	addu $sp, $sp, 4	# adjust the stack pointer 
	lw $ra, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	la $a0, newline		# printf("\n");
	li $v0, 4
	syscall
	
	jr $ra

# print the tree in order
# 
# input: $a0 the address of the root node

printInorder:
	move $t0, $a0
	bne $t0, 0, else      	# if $node == null  return
	jr $ra              	# to return
else:
	subu $sp, $sp, 4 	# adjust the stack pointer 
	sw $ra, 0($sp) 		# save the return address on stack 
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp)		# save the parameter on stack 
	
	lw $a0, 4($t0)		# printInorder(node->leftChild); 
	jal printInorder
	
	lw $t0, 0($sp) 		# get the parameter 
	addu $sp, $sp, 4	# adjust the stack pointer 
	lw $ra, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	lw $a0, 0($t0)		# print node->value
	li $v0, 1
	syscall   
	la $a0, space
	li $v0, 4
	syscall
	
	subu $sp, $sp, 4 	# adjust the stack pointer 
	sw $ra, 0($sp) 		# save the return address on stack 
	subu $sp, $sp, 4	# adjust the stack pointer 
	sw $t0, 0($sp)		# save the parameter on stack 
	
	lw $a0, 8($t0)		# printInorder(node->rightChild); 
	jal printInorder
	
	lw $t0, 0($sp) 		# get the parameter 
	addu $sp, $sp, 4	# adjust the stack pointer 
	lw $ra, 0($sp) 		# get the return address
	addu $sp, $sp, 4 	# adjust the stack pointer 
	
	jr $ra

# dynamically allocated memory block
#
# input: $a0 the size of memory block in words
# 
# output: $v0 the address to the allocated memory

malloc:           
	mul $a0, $a0, 4 # the number of bytes you need.
	li $v0,9      # allocate memory
	syscall          
	
	jr $ra

# please implement this method
#	
# free the memory block, here we can simply set
# all bits of the memory blocks to be zero
#
# input: $a0 the address of memory block
#	 $a1 the size of memory block in words

free:
	freeLoop:
		beqz $a1, freeEnd	#if the size of the memoery block is 0, end free call
		addiu $a1, $a1, -1	#reduce memory block size every time it loops to kepp track of how many words to add back
		sw $zero, 0($a0)	#set value of memory block to NULL
		addiu $a0, $a0, 32	#add word back to memory each loop
		j freeLoop
	freeEnd:
		jr $ra
