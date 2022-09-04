#include <stdio.h>

typedef struct Node{
	char name[20];
	int val;
	struct Node *next;
}Node2;

//typedef _Node Node;

void dump_node(struct Node *node);
void dump_node2(struct Node node);

void traverse(struct Node *node);

int main(int argc, char **argv)
{
	struct Node node2 = {"node2", 2, NULL};
	struct Node node1 = {"node1", 1, &node2};
	
	struct Node arr[2] = {node2, node1};	

	dump_node2(node1);

	dump_node(&node1);
	dump_node(&node2);
	printf("\n\n");
	traverse(&node1);	
	
	return 0;
}


void dump_node(struct Node *node)
{
	printf("node:%s,%d\n", node->name, node->val);
	return;
}

void dump_node2(struct Node node)
{
	printf("node:%s,%d\n", node.name, node.val);
	return;
}

void traverse(struct Node *node)
{
	struct Node *current = node;
	while(current != NULL){
	//while(current != 0){
		dump_node(current);
		current = current->next;
	}
	return;
}
