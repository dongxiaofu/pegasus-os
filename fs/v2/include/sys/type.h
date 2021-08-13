#ifndef _PEGASUS_OS_TYPE_H
#define _PEGASUS_OS_TYPE_H

typedef void (*Func)();

typedef void *system_call;

typedef void (*int_handle)();

typedef struct {
    unsigned int m40;
    unsigned int m41;
    unsigned int m42;
    unsigned int m43;
    unsigned int m44;
    unsigned int m45;
} u4;

typedef struct {
    unsigned int m30;
    unsigned int m31;
    unsigned int m32;
    unsigned int m33;
} u3;

typedef struct {
    unsigned int m20;
    unsigned int m21;
    unsigned int m22;
    unsigned int m23;
} u2;

typedef struct {
    unsigned int m10;
    unsigned int m11;
    unsigned int m12;
    unsigned int m13;
    unsigned int m14;
} u1;

typedef struct {
    u1 u10;
//    u1 u11;
//    u1 u12;

    u2 u20;
//    u2 u21;
//    u2 u22;

    u3 u30;
    u4 u40;
} u;
// todo 根据目前的需求，下面的成员都是必需的。
typedef struct {
    int source;             // 谁发送的消息
    int type;               // 这条消息要求接收者做什么。例如，获取时钟中断次数。
    int val;                // 消息中的数据。

    u u0;
} Message;

// 能用相同的结构体组合表示不同的数据吗？例如，用u0.u1.m10表示len和inode。
// A消息传递过程，B消息传递过程。A的len会覆盖B的len吗？

#define LEN u0.u10.m10
#define BUF u0.u10.m11
#define DEVICE u0.u10.m12
#define POSITION u0.u10.m13
#define BUF_LEN u0.u10.m14

// do_rdwt中使用
#define HD_OPERATE_TYPE u0.u20.m20
// 存储 struct inode * 应该用什么数据类型？
#define INODE u0.u20.m21
#define SENDER u0.u20.m22

// exec中使用
#define NAME_LEN u0.u3.m30
#define PATHNAME  u0.u3.m31

// 杂项
#define FD u0.u4.m40
#define STATUS u0.u4.m41
#define RETVAL u0.u4.m42
#define PID u0.u4.m43


#define CNT u0.u4.m42
#define PID u0.u4.m43



// elf start
typedef unsigned int Elf32_Addr;
typedef unsigned short Elf32_Half;
typedef unsigned int Elf32_Off;
typedef int Elf32_Sword;
typedef unsigned int Elf32_Word;

typedef struct {
    unsigned char e_ident[EI_NIDENT];     /* Magic number and other info */
    Elf32_Half e_type;                 /* Object file type */
    Elf32_Half e_machine;              /* Architecture */
    Elf32_Word e_version;              /* Object file version */
    Elf32_Addr e_entry;                /* Entry point virtual address */
    Elf32_Off e_phoff;                /* Program header table file offset */
    Elf32_Off e_shoff;                /* Section header table file offset */
    Elf32_Word e_flags;                /* Processor-specific flags */
    Elf32_Half e_ehsize;               /* ELF header size in bytes */
    Elf32_Half e_phentsize;            /* Program header table entry size */
    Elf32_Half e_phnum;                /* Program header table entry count */
    Elf32_Half e_shentsize;            /* Section header table entry size */
    Elf32_Half e_shnum;                /* Section header table entry count */
    Elf32_Half e_shstrndx;             /* Section header string table index */
} Elf32_Ehdr;

typedef struct {
    Elf32_Word p_type;                 /* Segment type */
    Elf32_Off p_offset;               /* Segment file offset */
    Elf32_Addr p_vaddr;                /* Segment virtual address */
    Elf32_Addr p_paddr;                /* Segment physical address */
    Elf32_Word p_filesz;               /* Segment size in file */
    Elf32_Word p_memsz;                /* Segment size in memory */
    Elf32_Word p_flags;                /* Segment flags */
    Elf32_Word p_align;                /* Segment alignment */
} Elf32_Phdr;

// elf end

// todo 不会用enum，用常量代替。
#define CLOSE   1
#define EXEC    2
#define EXIT    3
#define FORK    4
#define GET_PID 5
#define OPEN    6
#define READ    7
#define UNLINK  8
#define WAIT    9
#define WRITE 10

#define NO_TASK -1

#define SYSCALL_RET 101

#endif
