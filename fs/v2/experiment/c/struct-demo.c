#include <stdio.h>

struct Node{
	char name[20];
	int val;
	struct Node *next;
};

//typedef _Node Node;

void dump_node(struct Node *node);

void traverse(struct Node *node);

int main(int argc, char **argv)
{
	struct Node node2 = {"node2", 2, NULL};
	struct Node node1 = {"node1", 1, &node2};

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
