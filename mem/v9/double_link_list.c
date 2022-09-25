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
	list->head.prev = 0x0;
	list->tail.next = 0x0;
	list->head.next = &list->tail;
	list->tail.prev = &list->head;
}

// char isListEmpty(DoubleLinkList list)
char isListEmpty(DoubleLinkList *list)
{
	// return list->head->next == list->tail;
	// if(list.head.next == &list.tail && list.tail.prev == &list.head){
	if(list->head.next == &list->tail){
		return 1;
	}else{
		return 0;
	}
}

void appendToDoubleLinkList(DoubleLinkList *list, void *value)
{
//	ListElement *element = (ListElement *)MALLOC(sizeof(struct _ListElement));
//	Memset(element, 0, sizeof(struct _ListElement));
//	element->val = value;
	// (ListElement *) element = (ListElement *)value;
	ListElement *element = (ListElement *)value;
	element->prev = list->tail.prev;
	if(list->tail.prev != 0x0)	list->tail.prev->next = element;
	list->tail.prev = element;
	element->next = &list->tail;
}

void insertToDoubleLinkList(DoubleLinkList *list, void *value) 
{
//	ListElement *element = (ListElement *)MALLOC(sizeof(struct _ListElement));
//	element->val = value;

	// (ListElement *) element = (ListElement *)value;
	ListElement *element = (ListElement *)value;
	element->next = list->head.next;
	if(list->head.next != 0x0)	list->head.next->prev = element;
	list->head.next = element;
	element->prev = &list->head;
}

// ListElement popFromDoubleLinkList(DoubleLinkList list)
void *popFromDoubleLinkList(DoubleLinkList *list)
{
	if(isListEmpty(list) == 1)	return 0x0;

	ListElement *element = list->tail.prev;

	if(list->tail.prev->prev != 0x0)	list->tail.prev->prev->next = &list->tail;
	list->tail.prev = list->tail.prev->prev;

	return element;
//	return element->val;
}

unsigned char findElementInList(void *element, DoubleLinkList list)
{
	ListElement *cur = list.head.next;
	while(cur != &list.tail){
		if((unsigned int)cur == (unsigned int)element){
			return 1;
		}
	}

	return 0;
}
