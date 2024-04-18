#ifndef _PEGASUS_OS_PROTECT_H
#define _PEGASUS_OS_PROTECT_H

typedef struct{
        unsigned short seg_limit_below;
        unsigned short seg_base_below;
        unsigned char  seg_base_middle;
        unsigned char seg_attr1;
        unsigned char seg_limit_high_and_attr2;
        unsigned char seg_base_high;
        //char seg_base_high;
}Descriptor;


//门描述符
typedef struct{
        unsigned short offset_below;
        unsigned short selector;
        unsigned char paramCount;
        unsigned char type_other_attribute;
        unsigned short offset_high;
}Gate;

// tss
typedef struct{
        // 上一个任务的TSS指针
        unsigned int last_tss_ptr;
        unsigned int esp0;
        unsigned int ss0;
        unsigned int esp1;
        unsigned int ss1;
        unsigned int esp2;
        unsigned int ss2;
        unsigned int cr3;
        unsigned int eip;
        unsigned int eflags;
        unsigned int eax;
        unsigned int ecx;
        unsigned int edx;
        unsigned int ebx;
        unsigned int esp;
        unsigned int ebp;
        unsigned int esi;
        unsigned int edi;
        unsigned int es;
        unsigned int cs;
        unsigned int ss;
        unsigned int ds;
        unsigned int fs;
        unsigned int gs;
        unsigned int ldt;
        unsigned int trace;
        unsigned int iobase;
}TSS;

typedef struct _ListElement{
  	struct _ListElement *prev;
  	struct _ListElement *next;
} ListElement;

typedef struct _List{
	ListElement head;
	ListElement tail;
} List;

typedef List DoubleLinkList;

// TODO 似乎还可以优化。
//typedef struct _DoubleLinkList{
//  //	ListElement head;
//  //	ListElement tail;
//  	struct _ListElement *prev;
//  	struct _ListElement *next;
//} DoubleLinkList;

// 内存块描述符
typedef struct _mem_block_desc
{
	int size;
	int cnt;
	DoubleLinkList free_list;
} mem_block_desc;

typedef struct _mem_block
{ 
	ListElement element;
} mem_block;

typedef struct _arena
{
	mem_block_desc *desc;
	int cnt;
	char large;
}arena;

void initDoubleLinkList(DoubleLinkList *list);
char isListEmpty(DoubleLinkList *list);
char findElementInList(DoubleLinkList *list, void *value);
void appendToDoubleLinkList(DoubleLinkList *list, void *element);
void insertToDoubleLinkList(DoubleLinkList *list, void *element);
// void appendToDoubleLinkList(DoubleLinkList *list, void *value);
// void insertToDoubleLinkList(DoubleLinkList *list, void *value);
void *popFromDoubleLinkList(DoubleLinkList *list);

void init_memory_block_desc(mem_block_desc *mem_block_decs_array);

// 内存块种类数量
#define MEM_BLOCK_DESC_KIND_NUM	10

#endif
