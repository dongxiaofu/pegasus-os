typedef struct{
        unsigned short seg_limit_below;
        unsigned short seg_base_below;
        unsigned char  seg_base_middle;
        unsigned char seg_attr1;
        unsigned char seg_limit_high_and_attr2;
        unsigned char seg_base_high;
        //char seg_base_high;
}Descriptor;

Descriptor gdt[128];

unsigned char idt_ptr[6];
//门描述符
typedef struct{
        unsigned short offset_below;
        unsigned short selector;
        unsigned char paramCount;
        unsigned char type_other_attribute;
        unsigned short offset_high;
}Gate;

Gate idt[256];


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



typedef void (*int_handle) ();
void InitInterruptDesc(int vec_no, int_handle offset, int privilege, int type);
// 初始化内部中断
void init_internal_interrupt();
