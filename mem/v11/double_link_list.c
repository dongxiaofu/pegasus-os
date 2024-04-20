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
			int k = 8;
			if(value == 0xc03ff218 || value == 0xc03ff220){
				k = 12;
			}
	element->prev = list->tail.prev;
	element->next = &list->tail;
	list->tail.prev->next = element;
	list->tail.prev = element;
	intr_set_status(old_status);
}

void insertToDoubleLinkList(DoubleLinkList *list, void *value) 
{
	enum intr_status old_status = intr_disable();
			int k = 8;
			if(value == 0xc03ff218 || value == 0xc03ff220){
				k = 12;
			}
	
	if(findElementInList(list, value) == 1)	return;

	ListElement *element = (ListElement *)value;
	element->next = list->head.next;
	element->prev = &list->head;
	// 花了不少时间才发现这个错误。
	list->head.next->prev = element;
	list->head.next = element;

	intr_set_status(old_status);
}

void *popFromDoubleLinkList(DoubleLinkList *list)
{
	enum intr_status old_status = intr_disable();
	//asm volatile("cli");
	if(isListEmpty(list) == 1)	return NULL;
	ListElement *firstNode = list->head.next;
	if(firstNode->next == 0 || firstNode == 0){
		disp_str("head\n");
	}	
	list->head.next = firstNode->next;
	firstNode->next->prev = &list->head;
	
	firstNode->prev = firstNode->next = NULL;
	intr_set_status(old_status);
	//asm volatile("sti");
	//TODO 非常有用的调试代码，帮我解决了花了很多时间的问题。
//	catch_error();
//	if(test_ticks == 0x31C){
//		asm("xchgw %bx, %bx");
//	}

	return firstNode;
}
