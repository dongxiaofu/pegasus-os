//#include "double_link_list.h"
// #include "include/double_link_list.h"
//#include <stdlib.h>
// #include <stdio.h>

#include "stdio.h"
#include "string.h"
#include "mem.h"
#include "mm.h"
#include "const.h"
#include "type.h"
#include "protect.h"
//#include "fs.h"
#include "double_link_list.h"

#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "proto.h"
#include "global.h"
// #define MALLOC(size)	malloc(size)
#define MALLOC(size)	alloc_memory(1, KERNEL)

/**************************************test case start****************************/
// void printList(DoubleLinkList list)
// {
// 	ListElement node = list->head->next;
// 	while(node != list->tail){
// 		// printf("%d,", *(node->element));
// 		printf("e = %d\n", *((int *)(node->element)));
// 		node = node->next;
// 	}
// 
// 	printf("\n\n");
// }	
// 
// int main2(int argc, char **argv)
// {
// 	DoubleLinkList list = initDoubleLinkList();
// 	int a,b,c, d;
// 	a = 8;
// 	b = 9;
// 	c = 10;
// 	d = 11;
// 
// 	ListElement nodeA = (ListElement)MALLOC(sizeof(ListElement));
// 	ListElement nodeB = (ListElement)MALLOC(sizeof(ListElement));
// 	ListElement nodeC = (ListElement)MALLOC(sizeof(ListElement));
// 	ListElement nodeD = (ListElement)MALLOC(sizeof(ListElement));
// 	nodeA->val = &a;
// 	nodeB->val = &b;
// 	nodeC->val = &c;
// 	nodeD->val = &d;
// 	ListElement nodeE;
// 
// 	appendToDoubleLinkList(list,nodeA);
// 	appendToDoubleLinkList(list,nodeB);
// 	appendToDoubleLinkList(list,nodeC);
// 	printList(list);
// 	insertToDoubleLinkList(list,nodeD);
// 	printList(list);
// 	nodeE = popFromDoubleLinkList(list);
// 	printf("e = %d\n", *((int *)(nodeE->val)));
// 
// 	return 0;
// }
/**************************************test case end****************************/

void initDoubleLinkList(DoubleLinkList *list)
{
	assert(list != 0);

	list->prev = list->next = list;
}

char isListEmpty(DoubleLinkList *list)
{
	if(list->next == list){
		return 1;
	}else{
		return 0;
	}
}

char findElementInList(DoubleLinkList *list, void *value)
{
	assert(list != 0x0);
	assert(value != 0x0);

	ListElement *cur = list->next;
	// 空链表。
	if(cur == list){
		return 0;
	}

	char result = 0;

	enum intr_status old_status = intr_disable();

	ListElement *target = (ListElement *)value;

	while(cur != list){
		if(cur == target){
			result = 1;
			break;
		}

		cur = cur->next;
	}

	intr_set_status(old_status);

	return result;
}

void appendToDoubleLinkList(DoubleLinkList *list, void *value)
{
	assert(list != 0x0);
	assert(value != 0x0);
	if(findElementInList(list, value) == 1)	return;

	ListElement *element = (ListElement *)value;

	enum intr_status old_status = intr_disable();
	
	if(isListEmpty(list)){
		list->next = element;
		list->prev = element;
		element->prev = list;
		element->next = list;
	}else{
		list->prev->next = element;
		element->prev = list->prev;
	
		element->next = list;
		list->prev = element;
	}
	
	intr_set_status(old_status);
}

void insertToDoubleLinkList(DoubleLinkList *list, void *value) 
{
	enum intr_status old_status = intr_disable();
	
	if(findElementInList(list, value) == 1)	return;

	ListElement *element = (ListElement *)value;

	if(isListEmpty(list)){
		list->next = element;
		list->prev = element;
		element->prev = list;
		element->next = list;
	}else{
		element->next = list->next;
		list->next = element;
		element->prev = list;
	}

	intr_set_status(old_status);
}

void *popFromDoubleLinkList(DoubleLinkList *list)
{
	if(isListEmpty(list) == 1)	return 0x0;

	// list->prev是最后一个节点。
	ListElement *lastNode = list->prev;
	// 倒数第二个节点是lastNode->prev.
	list->prev = lastNode->prev;
	lastNode->prev->next = list;

	return lastNode;
}
