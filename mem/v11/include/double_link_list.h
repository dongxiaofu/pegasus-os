#ifndef _PEGASUS_OS_LINK_LIST_H
#define _PEGASUS_OS_LINK_LIST_H

// typedef struct _ListElement{
//   	struct _ListElement *prev;
//   	struct _ListElement *next;
//   	void *val;
// } *ListElement;
// 
// typedef struct _DoubleLinkList{
//   	ListElement head;
//   	ListElement tail;
// } *DoubleLinkList;

// DoubleLinkList initDoubleLinkList();
// void appendToDoubleLinkList(DoubleLinkList list, void *value);
// void insertToDoubleLinkList(DoubleLinkList list, void *value);
// void *popFromDoubleLinkList(DoubleLinkList list);
struct list_head {
    struct list_head *next;
    struct list_head *prev;
};

/* 新建一个list头部 */
#define LIST_HEAD(name)		\
    struct list_head name = { &(name), &(name) }

#endif
