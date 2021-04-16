//extern InterruptTest; 
int dis_pos;
int ticks = 0;
//static unsigned int counter = 0;
unsigned int counter;
typedef void (*int_handle) ();
void disp_str(char *str);
// void disp_str_colour(char *str, int colour);
void disp_str_colour2(int str, int colour);
void disp_str_colour(char *str, int colour);

// 内部中断 start
void divide_zero_fault();
void single_step_fault();
void non_maskable_interrupt();
void breakpoint_trap();
void overflow_trap();
void bound_range_exceeded_fault();
void invalid_opcode_fault();
void coprocessor_not_available_fault();
void double_fault_exception_abort();
void coprocessor_segment_overrun();
void invalid_task_state_segment_fault();
void segment_not_present_fault();
void stack_exception_fault();
void general_protection_exception_fault();
void page_fault();
void coprocessor_error_fault();
void align_check_fault();
void simd_float_exception_fault();
// 内部中断 end


// 外部中断 start
void hwint0();
void hwint1();
// 外部中断 end

void atoi(char *str, int num);
void disp_int(int num);
void InterruptTest();
void exception_handler(int vec_no, int error_no, int eip, int cs, int eflags);
unsigned char gdt_ptr[6];
void Memcpy(void *dst, void *src, int size);
void Memset(void *dest, char character, int size);
//void InitInterruptDesc(int vec_no, int_handle offset); 
void InitInterruptDesc(int vec_no, int_handle offset, int privilege, int type);
// 初始化内部中断
void init_internal_interrupt();

void test();

void spurious_irq(int irq);
void init_propt();

const int INIT_MASTER_VEC_NO = 0x20;
const int INIT_SLAVE_VEC_NO = 0x28;

// 描述符在gdt中的索引
// #define CS_SELECTOR_INDEX 1;
#define CS_SELECTOR_INDEX 1
#define DS_SELECTOR_INDEX 6
#define GS_SELECTOR_INDEX 7

#define TSS_SELECTOR_INDEX 8
#define LDT_FIRST_SELECTOR_INDEX 9

// 选择子
//#define CS_SELECTOR 0x1000;
#define CS_SELECTOR 0x08
#define DS_SELECTOR 0x30
//#define GS_SELECTOR 0x38
#define GS_SELECTOR 0x3b
#define TSS_SELECTOR 0x40	//1000  000 ---> 100 0000
#define LDT_FIRST_SELECTOR 0x48


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

// 进程表 start
typedef struct{
	// 中断处理程序压栈，手工压栈
	//unsigned short gs;	
	//unsigned short fs;	
	//unsigned short es;	
	//unsigned short ds;
	
	unsigned int gs;	
	unsigned int fs;	
	unsigned int es;	
	unsigned int ds;	
	// pushad压栈，顺序固定	
	unsigned int edi;	
	unsigned int esi;	
	unsigned int ebp;	
	// 在这里消耗了很多时间。为啥需要在这里补上一个值？这是因为popad依次出栈的数据中有这么个值，
	// 如果不补上这一位，出栈时数据不能依次正确更新到寄存器中。
	unsigned int kernel_esp;	
	unsigned int ebx;	
	unsigned int edx;	
	unsigned int ecx;	
	unsigned int eax;
	// 中断发生时压栈
	unsigned int eip;
	unsigned int cs;
	//unsigned short cs;
	unsigned int eflags;
	//unsigned short ss;
	unsigned int esp;	// 漏掉了这个。iretd会出栈更新esp。
	unsigned int ss;
}Regs;

typedef struct{
	Regs s_reg;
	// ldt选择子
	unsigned short ldt_selector;
	// ldt
	Descriptor ldts[2];	
	unsigned int pid;		
}Proc;

// 进程表 end

// 变量--进程
TSS tss;
#define PROC_NUM 3
Proc proc_table[PROC_NUM];
Proc *proc_ready_table;
typedef void (*Func)();

typedef struct{
	Func func_name;
	unsigned short stack_size;
}Task;

// 进程A、B、C的堆栈大小
#define A_STACK_SIZE 128
#define B_STACK_SIZE 128
#define C_STACK_SIZE 128
// 进程栈
#define STACK_SIZE (A_STACK_SIZE + B_STACK_SIZE + C_STACK_SIZE)

// 初始化描述符
// void InitDescriptor(void *desc, unsigned int base, unsigned int limit, unsigned short attribute);
void InitDescriptor(Descriptor *desc, unsigned int base, unsigned int limit, unsigned short attribute);
// 根据段名求物理地址
unsigned int Seg2PhyAddr(unsigned int selector);
// 根据虚拟地址求物理地址
// unsigned int VirAddr2PhyAddr(unsigned int base, unsigned int offset);
unsigned int VirAddr2PhyAddr(unsigned int base, void *offset);
// 内核的入口函数
void kernel_main();
// 进程A的进程体
void TestA();
void TestB();
void TestC();
// 启动进程
void restart();
void delay(int time);
// 调度进程
void schedule_process();
// 进程A的堆栈
int proc_stack[STACK_SIZE];

//Task task_table[PROC_NUM] = {
Task task_table[3] = {
	{TestA, A_STACK_SIZE},
	{TestB, B_STACK_SIZE},
	{TestC, C_STACK_SIZE},
};
void ReloadGDT()
{
	//disp_str_colour("AAAA", 0x0C);
	//disp_str_colour("AAAA", 0x0A);
	//disp_str_colour("bbbb", 0x0D);
	//disp_int(0x3);
	//disp_str_colour("Hello,World\n", 0x0C);
	//return;
	Memcpy(&gdt,
		(void *)(*((int *)(&gdt_ptr[2]))),
		*((short *)(&gdt_ptr[0]))
	);
	short *pm_gdt_limit = (short *)(&gdt_ptr[0]);
	int *pm_gdt_base = (int *)(&gdt_ptr[2]);
	
	//*pm_gdt_limit = 128 * sizeof(Descriptor) * 64 - 1;
	*pm_gdt_limit = 128 * sizeof(Descriptor) - 1;
	*pm_gdt_base = (int)&gdt;
	
	// 修改idt_ptr
	short *pm_idt_limit = (short *)(&idt_ptr[0]);
	int *pm_idt_base = (int *)(&idt_ptr[2]);
	*pm_idt_limit = 256 * sizeof(Gate) - 1;
	*pm_idt_base = (int)&idt;

	//for(int i = 0; i < 10; i++){
	//	for(int j = 0; j < 160; j++){
	//		disp_str(" ");
	//	}

	//}
	//for(int i = 0; i < 80 * 2 * 5; i++){
	//dis_pos = 0;
	for(int i = 0; i < 80 * 2 * 25; i++){
		//disp_str(" ");
	}
	//dis_pos = 0;
	// disp_int(0x8);
	// return;
	//disp_str_colour("Hello, World!", 0x74);
	//disp_str_colour("Hello, World!===========I am successful!", 0x0B);
	//disp_str("\n=================\n");
	//disp_str("Hello, World!\n");
	//disp_int(23);
	//disp_int(0x020A);
	//disp_str("\n");
	//return;
	// 向idt中添加中断门 InterruptTest
	 // InitInterruptDesc(1, InterruptTest);	
	 //InitInterruptDesc(0x0, InterruptTest);	
	// 内部中断
	init_internal_interrupt();
	// 外部中断
	init_propt();	
	return;
}

void InitInterruptDesc(int vec_no, int_handle offset, int privilege, int type)
{
	Gate *gate = &idt[vec_no];
	//idt[vec_no].paramCount = 0;
	//// idt[vec_no].offset_below = offset;
	//int base = (int)offset;
	//idt[vec_no].offset_below = base & 0xffff;
	//idt[vec_no].selector = 1;
	//idt[vec_no].offset_high = base >> 16;
	//// 先这样，以后再拆分成TYPE和特权级
	//idt[vec_no].type_other_attribute = 0x08E;
	

	gate->paramCount = 0;
	// gate->offset_below = offset;
	int base = (int)offset;
	gate->offset_below = base & 0xffff;
	gate->selector = 0x8;
	gate->offset_high = base >> 16;
	// 先这样，以后再拆分成TYPE和特权级
	// gate->type_other_attribute = 0x08E;
	gate->type_other_attribute = (privilege << 4) | type;
}


void atoi(char *str, int num)
{
	char *p = str;
	*p++ = '0';
	*p++ = 'x';
	char ch;
	char flag = 0;	

	if(num == 0){
		*p++ = '0';
	}else{
		for(int i = 28; i >= 0; i-=4){
			ch = (num >> i) & 0xF;
			if(flag == 0 && ch == 0) continue;
			flag = 1;
			ch = ch + '0';
			if(ch > '9'){
				ch += 7;	
			}	
			*p++ = ch;
		}
	}	
	
	*p = 0;

	return;
}

void disp_int(int num)
{
	//char *str = "";
	char str[16];
	atoi(str, num);
	//disp_str_colour("ABC", 0x0A);
	// disp_str(str);
	disp_str_colour(str, 0x0B);
	//return;

}

void exception_handler(int vec_no, int error_no, int eip, int cs, int eflags)
{
	char *msg[] = {
		"# Divide by zero:",
		"# Single step:",
		"# Non-maskable  (NMI):",
		"# Breakpoint:",
		"# Overflow trap:",
		"# BOUND range exceeded (186,286,386):",
		"# Invalid opcode (186,286,386):",
		"# Coprocessor not available (286,386):",
		"# Double fault exception (286,386):",
		"# Coprocessor segment overrun (286,386):",
		"# Invalid task state segment (286,386):",
		"# Segment not present (286,386):",
		"# Stack exception (286,386):",
		"# General protection exception (286,386):",
		"# Page fault (286,386):",
		//"# Reserved:",
		"# Coprocessor error (286,386):",

		"#AC :",
		"#MC :",
		"#XF :",
	};
	dis_pos = 0;
	// 清屏
	for(int i = 0; i < 80 * 25 * 2; i++){
		disp_str(" ");
	}	

	dis_pos = 0;
	// int colour = 0x74;
	int colour = 0x0A;
	char *error_msg = msg[vec_no];
	disp_str_colour(error_msg, colour);
	disp_str("\n\n");
	disp_str_colour("vec_no:", colour);
	disp_int(vec_no);
	disp_str("\n\n");
	
	if(error_no != 0xFFFFFFFF){
		disp_str_colour("error_no:", colour);
        	disp_int(error_no);
        	disp_str("\n\n");
	}

	disp_str_colour("cs:", colour);
	disp_int(cs);
	disp_str("\n\n");

	disp_str_colour("eip:", colour);
        disp_int(eip);
        disp_str("\n\n");

	disp_str_colour("eflags:", colour);
        disp_int(eflags);
        disp_str("\n\n");	

	return;
}

void init_internal_interrupt()
{
	InitInterruptDesc(0,divide_zero_fault,0x08,0x0E);
	InitInterruptDesc(1,single_step_fault,0x08,0x0E);
	InitInterruptDesc(2,non_maskable_interrupt,0x08,0x0E);
	InitInterruptDesc(3,breakpoint_trap,0x08,0x0E);
	InitInterruptDesc(4,overflow_trap,0x08,0x0E);
	InitInterruptDesc(5,bound_range_exceeded_fault,0x08,0x0E);
	InitInterruptDesc(6,invalid_opcode_fault,0x08,0x0E);
	InitInterruptDesc(7,coprocessor_not_available_fault,0x08,0x0E);
	InitInterruptDesc(8,double_fault_exception_abort,0x08,0x0E);
	InitInterruptDesc(9,coprocessor_segment_overrun,0x08,0x0E);
	InitInterruptDesc(10,invalid_task_state_segment_fault,0x08,0x0E);
	InitInterruptDesc(11,segment_not_present_fault,0x08,0x0E);
	InitInterruptDesc(12,stack_exception_fault,0x08,0x0E);
	InitInterruptDesc(13,general_protection_exception_fault,0x08,0x0E);
	InitInterruptDesc(14,page_fault,0x08,0x0E);
	InitInterruptDesc(16,coprocessor_error_fault,0x08,0x0E);
	InitInterruptDesc(17,align_check_fault,0x08,0x0E);
	InitInterruptDesc(18,simd_float_exception_fault,0x08,0x0E);	
}

void test()
{
	disp_str("A");
	disp_int(0x6);
	disp_str("\n");
	//return;
	//disp_str_colour2(0x9988, 0x74);
	dis_pos = 0;
	for(int i = 0; i < 80 * 25 * 2; i++){
                disp_str(" ");
        }
        dis_pos = 0;
	//return;
        disp_str_colour("Hello, World!", 0x0F);
	disp_str("\n");
        disp_int(0x89);
	disp_str("\n");
        disp_str_colour("Hello, World!", 0x0F);
        disp_str_colour("Hello, World!", 0x74);
	disp_str("\n");
        disp_str_colour("Hello, World!===========I am successful!", 0x0F);
        disp_str("\n=================\n");
        disp_str("Hello, World!\n");
        disp_int(23);
	disp_str("\n");
        disp_int(0x020A);
        disp_str("\n");
}


void disp_str_colour3(char *str, int colour)
{

}

void spurious_irq(int irq)
{
	disp_str_colour("\n------------irq start---------------\n", 0x0B);
	disp_int(irq);
	ticks++;
	disp_str("[");
	disp_int(ticks);
	disp_str("]");
	disp_str_colour("\n------------irq end---------------\n", 0x0C);
}

void init_propt()
{
	InitInterruptDesc(INIT_MASTER_VEC_NO + 0, hwint0 ,0x08,0x0E);	
	InitInterruptDesc(INIT_MASTER_VEC_NO + 1, hwint1 ,0x08,0x0E);	
	
	// 初始化tss
	int tss_size = sizeof(TSS);
	Memset(&tss, 0, tss_size);
	tss.iobase = tss_size;
	tss.ss0 = DS_SELECTOR;
	int ds_phy_addr = Seg2PhyAddr(DS_SELECTOR);
	// int tss_base = VirAddr2PhyAddr(ds_phy_addr, tss);		
	int tss_base = VirAddr2PhyAddr(ds_phy_addr, &tss);		
	// int tss_attribute = 0x0c92;		// todo tss的属性怎么确定？
	// 难点。抄的于上神的。
	int tss_attribute = 0x89;		// todo tss的属性怎么确定？
	InitDescriptor(&gdt[TSS_SELECTOR_INDEX], tss_base, tss_size - 1, tss_attribute);				
	for(int i = 0; i < PROC_NUM; i++){			
		// 初始化LDT
		int ldt_size = 2 * sizeof(Descriptor);
		// int ldt_attribute = 0x0c92;          // todo ldt的属性怎么确定？	
		int ldt_attribute = 0x82;          // todo ldt的属性怎么确定？	
		// int ldt_base = VirAddr2PhyAddr(ds_phy_addr, proc_table[0].ldts);
		//int ldt_base = VirAddr2PhyAddr(ds_phy_addr, proc_table.ldts);
		int ldt_base = VirAddr2PhyAddr(ds_phy_addr, proc_table[i].ldts);
		InitDescriptor(&gdt[LDT_FIRST_SELECTOR_INDEX+i], ldt_base, ldt_size - 1, ldt_attribute);
	}
	// gs
	InitDescriptor(&gdt[7], 0xb8000, 0x0FFFF, 0x0F2);
}

// 初始化描述符。又花了很多时间才写出来。还参照了我之前写的汇编代码。
// Descriptor
void InitDescriptor(Descriptor *desc, unsigned int base, unsigned int limit, unsigned short attribute)
{
	// desc->seg_limit_below = limit & 0xFFFF;
	desc->seg_limit_below = (limit & 0xFFFF);
	desc->seg_base_below = base & 0xFFFF;
	//desc->seg_base_middle = (base >> 16) & 0xF;
	desc->seg_base_middle = (base >> 16) & 0xFF;
	desc->seg_attr1 = attribute & 0xFF;
	desc->seg_limit_high_and_attr2 = (((attribute >> 8) & 0xF) << 4) | ((limit >> 16) & 0x0F); 	
	//desc->seg_limit_high_and_attr2 = ((attribute >> 8) & 0xF0) | ((limit >> 16) & 0x0F); 	
	//desc->seg_base_high = (base >> 24) & 0xF;
	desc->seg_base_high = (unsigned char)((base >> 24) & 0xFF);
}

// 根据段名求物理地址
unsigned int Seg2PhyAddr(unsigned int selector)
{
	Descriptor desc = gdt[selector >> 3];
	//int addr = ((desc & 0xFFFF0000) >> 16) | (((desc >> 32) & 0xFF) << 16) | (((desc >> 56) & 0xFF) << 24);
	//int addr = desc.seg_base_below | (desc.seg_base_middle << 16) | (desc.seg_base_high << 24);
	//int addr = (desc.seg_base_below & 0xFFFF) | ((desc.seg_base_middle & 0xFF0000)) | ((desc.seg_base_high & 0xFF000000));
	int addr=(desc.seg_base_below & 0xFFFF) | ((desc.seg_base_middle << 16) & 0xFF0000) 
		| (unsigned char)((desc.seg_base_high<<24) & 0xFF000000);
	return addr;
}
 // 根据虚拟地址求物理地址
unsigned int VirAddr2PhyAddr(unsigned int base, void *offset)
{
	int addr = base + (int)offset;
	return addr;
}


void kernel_main()
{
	counter = 0;
	Proc *proc = proc_table;
	for(int i = 0; i < PROC_NUM; i++){	
		//proc->ldt_selector = LDT_FIRST_SELECTOR + i<<3;
		proc->ldt_selector = LDT_FIRST_SELECTOR + 8 * i;
		proc->pid = i;	
		//proc->ldts[0] = ;
		Memcpy(&proc->ldts[0], &gdt[CS_SELECTOR_INDEX], sizeof(Descriptor));
		// 修改ldt描述符的属性。全局cs的属性是 0c9ah。
		//proc->ldts[0].seg_attr1 = 0xcd;
		//proc->ldts[0].seg_attr1 = 0xda;
		proc->ldts[0].seg_attr1 = 0xba;
		Memcpy(&proc->ldts[1], &gdt[DS_SELECTOR_INDEX], sizeof(Descriptor));
		// 修改ldt描述符的属性。全局ds的属性是 0c92h
		// proc->ldts[1].seg_attr1 = 0xd2;
		proc->ldts[1].seg_attr1 = 0xb2;
		// proc->ldts[1].seg_attr1 = 0xb2;

		// 初始化进程表的段寄存器
		proc->s_reg.cs = 0x05;	// 000 0101		
		proc->s_reg.ds = 0x0D;	// 000 1101		
		proc->s_reg.fs = 0x0D;	// 000 1101		
		proc->s_reg.es = 0x0D;	// 000 1101		
		//proc->s_reg.ss = 0x0D;	// 000 1101	
		proc->s_reg.ss = 0x0D;	// 000 1100	
		// 需要修改gs的TI和RPL	
		// proc->s_reg.gs = GS_SELECTOR;	
		// proc->s_reg.gs = GS_SELECTOR | (0x101);
		//proc->s_reg.gs = GS_SELECTOR;
		//proc->s_reg.gs = GS_SELECTOR & (0x001);
		// 0x3b--> 0011 1011 --> 0011 1 011
		// 1001
		proc->s_reg.gs = GS_SELECTOR & (0xFFF9);
		// proc->s_reg.gs = 0x0D;
		// 初始化进程表的通用寄存器
		// proc->s_reg.eip = (int)TestA;
		//proc->s_reg.eip = (int)task_table.func_name;
		proc->s_reg.eip = (int)task_table[i].func_name;
		// proc->s_reg.eip = TestA;

		//proc->s_reg.esp = (int)(proc_stack + 128 * i);
		proc->s_reg.esp = (int)(proc_stack + 128 * (i+1));
		// proc->s_reg.esp = proc_stack + 128;
		// 抄的于上神的。需要自己弄清楚。我已经理解了。
		// IOPL = 1, IF = 1
		// IOPL 控制I/O权限的特权级，IF控制中断的打开和关闭
		proc->s_reg.eflags = 0x1202;	
		
		proc++;
		// error: lvalue required as increment operand
		//task_table++;
	}
	// 启动进程，扣动扳机，砰！		
	//proc_ready_table = &proc_table[1];	
	//proc_ready_table = &proc_table[2];	
	proc_ready_table = proc_table;	
	dis_pos = 0;
	// 清屏
	for(int i = 0; i < 80 * 25 * 2; i++){
		disp_str(" ");
	}	
	dis_pos = 2;
	restart();

	while(1){}
}

void TestA()
{
	while(1){
		disp_str_colour("A", 0x0B);
		disp_int(1);
		disp_str(".");
		delay(1);
	}
}

void delay(int time)
{
	for(int i = 0; i < time; i++){
		for(int j = 0; j < 10; j++){
			for(int k = 0; k < 10000; k++){
			}
		}
	}
}

void TestB()
{
	while(1){
		disp_str("B");
		disp_int(2);
		disp_str(".");
		delay(1);
	}
}

void TestC()
{
	while(1){
		disp_str("C");
		disp_int(3);
		disp_str(".");
		delay(1);
	}
}
// 进程调度次数
//unsigned int counter = 0;
void schedule_process()
{
	//disp_str("[");
	//disp_int(proc_ready_table->pid);
	//disp_str("]");
	//proc_ready_table++;
	//if(proc_ready_table >= proc_table + PROC_NUM){
	//	proc_ready_table = proc_table;
	//}
	//proc_ready_table = &proc_table[1];
	//return;
	counter++;
	proc_ready_table = &proc_table[counter%3];
	disp_str("[");
	disp_int(proc_ready_table->pid);
	disp_str("]");
	return;
//	//extern unsigned int counter;
//	if(counter < PROC_NUM - 1){
//		//proc_ready_table = &proc_table[counter++];
//		counter++;
//		proc_ready_table = &proc_table[counter];
//	}else{
//		proc_ready_table = proc_table;
//		counter = 0;
//	}
//	return;
//	counter++;
//	// if(counter == PROC_NUM){
//	if(counter == PROC_NUM - 1){
//		counter = 0;
//		proc_ready_table = proc_table;
//	}
//	// proc_ready_table++;	
//	// counter++;
}
