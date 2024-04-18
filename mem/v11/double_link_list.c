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
#include "stddef.h"

#define MALLOC(size)	alloc_memory(1, KERNEL)

void initDoubleLinkList(DoubleLinkList *list)
{
	assert(list != 0);

	list->head.prev = NULL;
	list->tail.next = NULL;
	list->head.next = &list->tail;
	list->tail.prev = &list->head;
}

// 链表是空时返回1，不是空时返回0。
char isListEmpty(DoubleLinkList *list)
{
	if(list->head.next == &list->tail && list->tail.prev == &list->head){
		return 1;
	}else{
		return 0;
	}
}

char findElementInList(DoubleLinkList *list, void *value)
{
	assert(list != 0x0);
	assert(value != 0x0);

	char result = 0;
	ListElement *target = (ListElement *)value;

	enum intr_status old_status = intr_disable();

	ListElement *cur = list->head.next;
	while(cur != &list->tail){
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
	element->prev = list->tail.prev;
	element->next = &list->tail;
	list->tail.prev->next = element;
	list->tail.prev = element;
	intr_set_status(old_status);
}

void insertToDoubleLinkList(DoubleLinkList *list, void *value) 
{
	enum intr_status old_status = intr_disable();
	
	if(findElementInList(list, value) == 1)	return;

	ListElement *element = (ListElement *)value;
	element->next = list->head.next;
	element->prev = &list->head;
	list->head.next = element;

	intr_set_status(old_status);
}

void *popFromDoubleLinkList(DoubleLinkList *list)
{
	if(isListEmpty(list) == 1)	return NULL;
	// list->prev是最后一个节点。
	ListElement *lastNode = list->tail.prev;
	lastNode->prev->next = &list->tail;

	return lastNode;
}
