#include <stdio.h>
#include<malloc.h>

struct Node {
	int value;
	struct Node* leftChild;
	struct Node* rightChild;
};

struct bTree {
	struct Node* root;
};

//please implement all the four functions
struct bTree* newTree(int value) {
	struct Node* this = (struct Node*)malloc(sizeof(struct Node)); //creating space in memory for a node, this is pointer var to that memory address created
	if (this == NULL) {
		return NULL;
	}
	this->value = value;
	this->leftChild = NULL;
	this->rightChild = NULL;
	struct bTree* that = (struct bTree*)malloc(sizeof(struct bTree));
	that->root = this;
	return that;
}

int add(struct Node* current, int value) {
	struct Node* new = (struct Node*)malloc(sizeof(struct Node));
	new->value = NULL;
	new->leftChild = NULL;
	new->rightChild = NULL;
	if (new == NULL) {
		return 0;
	}
	if (value < current->value) {
		if (current->leftChild) {
			current = current->leftChild;
			add(current, value);
		}
		else {
			new->value = value;
			current->leftChild = new;
		}
	}
	else if (value > current->value) {
		if (current->rightChild) {
			current = current->rightChild;
			add(current, value);
		}
		else {
			new->value = value;
			current->rightChild = new;
		}
	}
	return 1;
}

struct Node* findMin(struct Node* current){
    while  (current->leftChild != NULL){
        current = current->leftChild;
    }
    return current;
}
//you need to use free() to release the memory when a node is removed
struct Node* deleteNode(struct Node* current, int value) {

        if(current->value > value){
            current->leftChild = deleteNode(current->leftChild, value);
        }
        else if(value > current->value){
            current->rightChild = deleteNode(current->rightChild, value);
        }
        else{
                if(current->leftChild == NULL){
                    struct Node *temp = current->rightChild;
                    free(current);
                    return temp;
                }
                else if(current->rightChild == NULL){
                    struct Node *temp = current->leftChild;
                    free(current);
                    return temp;
                }
                else{
                    struct Node *temp = findMin(current->rightChild);
                    current->value = temp->value;
                    current->rightChild = deleteNode(current->rightChild, temp->value);
                }
        }

    return current;
}

int removeNode(struct Node* current, int value) {
    struct Node *placeholder = deleteNode(current, value);
    return 1;
}

int contain(struct Node* current, int value) {
	if (current->value == value){
        return 1;
	}
	else if(value < current->value){
        if(current->leftChild == NULL){
            return 0;
        }
        else{
            contain(current->leftChild, value);
        }
	}
	else if(value > current->value){
        if(current->rightChild == NULL){
            return 0;
        }
        else{
            contain(current->rightChild, value);
        }
	}
	else{
        return 0;
	}
}



void printInorder(struct Node* node)
{
	if (node == NULL)
		return;

	printInorder(node->leftChild);


	printf("%d ", (node->value));


	printInorder(node->rightChild);
}



int printTree(struct bTree* root) {
	printInorder(root->root);
	printf("\n");
	return 1;
}

int main() {
	struct bTree* tree = newTree(72);
	struct Node* root = tree->root;
	add(root, 12);
	add(root, 52);
	add(root, 87);
	add(root, 18);
	add(root, 49);
	add(root, 43);
	add(root, 82);
	add(root, 34);
	add(root, 73);
	add(root, 21);

	printTree(tree);

	add(root, 96);     //3 add() test cases
	printTree(tree);
	add(root, 10);
	printTree(tree);
	add(root, 50);
	printTree(tree);

	if (contain(root, 73) == 1) {
		printf("This tree contains 73\n");
	}
	else {
		printf("This tree doesn't contains 73\n");
	}

	if (contain(root, 22) == 1) {
		printf("This tree contains 22\n");
	}
	else {
		printf("This tree doesn't contain 22\n");
	}

	if (contain(root, 50) == 1) {           //2 contain() test cases
		printf("This tree contains 50\n");
	}
	else {
		printf("This tree doesn't contains 50\n");
	}
	if (contain(root, 2) == 1) {
		printf("This tree contains 2\n");
	}
	else {
		printf("This tree doesn't contain 2\n");
	}

	removeNode(root, 18);
	printf("After delete 18\n");
    printTree(tree);

    removeNode(root, 49);
	printf("After delete 49\n");
	printTree(tree);

	removeNode(root, 10);           //2 removeNode() test cases
	printf("After delete 10\n");
	printTree(tree);

	removeNode(root, 96);
	printf("After delete 96\n");
	printTree(tree);
	return 0;
}
