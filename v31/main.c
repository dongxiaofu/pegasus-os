#include "main.h"
#include "keymap.h"
#include "string.h"
//
void ReloadGDT()
{
	//disp_str_colour("AAAA", 0x0C);
	//disp_str_colour("AAAA", 0x0A);
	//disp_str_colour("bbbb", 0x0D);
	//disp_int(0x3);
	//disp_str_colour("Hello,World\n", 0x0C);
	//return;
	//Memset(&gdt, 0, sizeof(Descriptor) * 128);
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


	// 系统调用
	// 属性可能需要修改
	//InitInterruptDesc(0x90,sys_get_ticks,0x08,0x0E);	
	// interrupt(): soft_int && (gate.dpl < CPL)
	// InitInterruptDesc(0x90,sys_call,0x08,0x0E);	
	// 0x08--->1000b--->特权级是0
	// 1010b-->0xA--->特权级是1
	// 1110b-->0xE--->特权级应该是3
	InitInterruptDesc(0x90,sys_call,0x0E,0x0E);	
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

	Memset(proc_table, 0, sizeof(proc_table));

	
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
	// 改成0x889也行。
	int tss_attribute = 0x89;		// todo tss的属性怎么确定？
	InitDescriptor(&gdt[TSS_SELECTOR_INDEX], tss_base, tss_size - 1, tss_attribute);				
	for(int i = 0; i < TASK_PROC_NUM + USER_PROC_NUM; i++){			
		// 初始化LDT
		int ldt_size = 2 * sizeof(Descriptor);
		// int ldt_attribute = 0x0c92;          // todo ldt的属性怎么确定？	
		// LDT描述符的属性是在GDT中的描述符的属性，图示：
		// L->DPL，E->TYPE
		//  7 6 5 4 3 2 1 0
		// |P|L|L|S|E|E|E|E|
		// 0x82：1000 0010
		// 改成0x882也可以。
		// 这并不是最终的属性，在初始化进程时，会修改。
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

// 根据段名求物理地址
unsigned int Seg2PhyAddrLDT(unsigned int selector, Proc *proc)
{
	Descriptor desc = proc->ldts[selector >> 3];
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
	ticks = 0;
	counter = 0;
	// 在这个项目的C代码中，全局变量如此赋值才有效。原因未知，实践要求如此。
	//k_reenter = -1;
	k_reenter = 0;
	Proc *proc;
	Task *task;
	unsigned int eflags;
	unsigned char rpl;
	unsigned char dpl;
	char *p_task_stack = proc_stack + STACK_SIZE;
	for(int i = 0; i < TASK_PROC_NUM + USER_PROC_NUM; i++){	
		proc = proc_table + i;
		if(i < TASK_PROC_NUM){
			task = sys_task_table + i;
			eflags = 0x1202;
			rpl = 1;
			dpl = 1;
			proc->ticks = proc->priority = 15;
			//proc->ticks = proc->priority = 2;
			proc->tty_index = 1;
		}else{
			task = user_task_table + i - TASK_PROC_NUM;
			eflags = 0x202;
			//eflags = 0x1202;
			rpl = 3;
			dpl = 3;
			proc->ticks = proc->priority = 10;
			proc->tty_index = i - TASK_PROC_NUM;
		}

		//proc->ldt_selector = LDT_FIRST_SELECTOR + i<<3;
		proc->ldt_selector = LDT_FIRST_SELECTOR + 8 * i;
		proc->pid = i;	
		//proc->ldts[0] = ;
		Memcpy(&proc->ldts[0], &gdt[CS_SELECTOR_INDEX], sizeof(Descriptor));
		// 修改ldt描述符的属性。全局cs的属性是 0c9ah。
		//proc->ldts[0].seg_attr1 = 0xcd;
		//proc->ldts[0].seg_attr1 = 0xda;
		//proc->ldts[0].seg_attr1 = 0xba;			// 1011 1010
		proc->ldts[0].seg_attr1 = 0x9a | (dpl << 5);				// 1001	1010
		Memcpy(&proc->ldts[1], &gdt[DS_SELECTOR_INDEX], sizeof(Descriptor));
		// 修改ldt描述符的属性。全局ds的属性是 0c92h
		// proc->ldts[1].seg_attr1 = 0xd2;
		// proc->ldts[1].seg_attr1 = 0xb2;			// 1011 0010
		proc->ldts[1].seg_attr1 = 0x92 | (dpl << 5);			// 1001 0010
		// proc->ldts[1].seg_attr1 = 0xb2;

		// 初始化进程表的段寄存器
		// 我又看不懂当初写的代码了。
		// 一定要写非常详细的注释。
		// 0101：rpl是01，TI是1，在ldt中的索引是0。
		unsigned short cs = 0x4 | rpl;
		unsigned short ds = 0xC | rpl;
		// proc->s_reg.cs = 0x05;	// 000 0101		
		// proc->s_reg.ds = 0x0D;	// 000 1101		
		// proc->s_reg.fs = 0x0D;	// 000 1101		
		// proc->s_reg.es = 0x0D;	// 000 1101		
		// //proc->s_reg.ss = 0x0D;	// 000 1101	
		// proc->s_reg.ss = 0x0D;	// 000 1100	
		proc->s_reg.cs = cs;
		proc->s_reg.ds = ds;
		proc->s_reg.fs = ds;
		proc->s_reg.es = ds;
		//proc->s_reg.ss = 0x0D;	// 000 1101	
		proc->s_reg.ss = ds;	// 000 1100	
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
		proc->s_reg.eip = (int)task->func_name;
		// proc->s_reg.eip = TestA;

		//proc->s_reg.esp = (int)(proc_stack + 128 * i);
		// proc->s_reg.esp = (int)(proc_stack + 128 * (i+1));
		proc->s_reg.esp = (int)(p_task_stack);
		p_task_stack -= DEFAULT_STACK_SIZE;
		// proc->s_reg.esp = proc_stack + 128;
		// 抄的于上神的。需要自己弄清楚。我已经理解了。
		// IOPL = 1, IF = 1
		// IOPL 控制I/O权限的特权级，IF控制中断的打开和关闭
		//proc->s_reg.eflags = 0x1202;	// 0001 0010 0000 0010
		proc->s_reg.eflags = eflags;


		// ipc start
		//proc->header = {-1, NULL};
		//*(proc->header) = {-1, NULL};
		// proc->header->sender_pid = -1;
		// proc->header->next = 0;
		// struct MsgSender header = {-1, NULL};
		//struct MsgSender header = {-1, 0};
		//proc->header = &header;
		// ipc end

		//proc->tty_index = 0;
	}
	// 启动进程，扣动扳机，砰！		
	//proc_ready_table = &proc_table[1];	
	//proc_ready_table = &proc_table[2];	
	proc_ready_table = proc_table;	


	// 键盘
	Memset(keyboard_buffer.buf, 0, sizeof(keyboard_buffer.buf));
	keyboard_buffer.tail = keyboard_buffer.head = keyboard_buffer.buf;
	keyboard_buffer.counter = 0;
	// 初始键盘中断例程
	//init_keyboard_handler();
	dis_pos = 0;
	// 清屏
	for(int i = 0; i < 80 * 25 * 2; i++){
		disp_str(" ");
	}	
	dis_pos = 0;

	init_keyboard_handler();
	restart();

	while(1){}
}

#define A_PRINT_NUM 3
#define B_PRINT_NUM 3
#define C_PRINT_NUM 3

void TestA()
{
	unsigned int i = 0;
	//Printf("i=%d\n", 98457);
	assert(i==0);
	while(1){
		//Printf("<a ticks:%x\n>", get_ticks());
		//select_console(0);
		//assert(i < 5);
		if( i < A_PRINT_NUM){
			//get_ticks();
			//int t_ipc = get_ticks_ipc();
			//int t_ipc = get_ticks();
			//Printf("a_t_ipc = %x\n", t_ipc);
			//milli_delay(2);
			//Printf("a_t:%x", 2);
			//Printf("%x", 2);
			Printf("%x", get_ticks_ipc());
			//disp_str_colour("A", 0x0A);
			//Printf("%c--", 'A');
			//Printf("flag:%x--,", proc_table[2].p_flag);
			//Printf("send_to:%x--,", proc_table[2].p_send_to);
			//Printf("receive_from:%x--,", proc_table[2].p_receive_from);
			//Printf("%c", '\n');
		}
		i++;
		//dis_pos = 0;
		// select_console(0);
		// int t = get_ticks();
		// if(t < 300){
		// 	out_char(current_tty, 'A');
		// }
		//disp_int(t);
		// out_char(current_tty, 'A');
		//Printf("T:%x", t);
		//milli_delay(10);
		//disp_int(get_ticks());
		//disp_str_colour("A", 0x0A);
		//disp_int(1);
		//disp_str(".");
		//delay(1);
		//milli_delay(10);
		//milli_delay(1);
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
		//Printf("<b ticks:%x\n>", get_ticks());
	// select_console(1);
	unsigned int i = 0;
	while(1){
		//select_console(1);
		//Printf("<b ticks:%x\n>", get_ticks());
		if( i < B_PRINT_NUM){
			//int t_ipc = get_ticks_ipc();
			//int t_ipc = get_ticks();
			//Printf("%x", t_ipc);
			//Printf("%x\n", 3);
			//Printf("i=%d\n", 9);
			Printf("b_t:%x", get_ticks_ipc());
		}
		i++;
		// int t = get_ticks();
		// if(t < 600){
		// 	out_char(current_tty, 'B');
		// }
		//milli_delay(10);
		//disp_int(get_ticks());
		//disp_str("B");
		//disp_str(".");
		//delay(1);
		//milli_delay(20);
		//milli_delay(1);
	}
}

void TestC()
{
		//Printf("<c ticks:%x\n>", get_ticks());
	// select_console(2);
	unsigned int i = 0;
	while(1){
		//select_console(2);
		if( i < C_PRINT_NUM){
			//Printf("i=%d\n", 5);
			//int t_ipc = get_ticks_ipc();
			//int t_ipc = get_ticks();
			int t_ipc = 5;
			Printf("c_t_ipc = %x", t_ipc);
			//Printf("c_t0:%x\n", 3);
			//Printf("c_t:%x\n", get_ticks_ipc());
		}
		i++;
		//Printf("<c ticks:%x\n>", get_ticks());
		// select_console(2);
		// int t = get_ticks();
		// if(t < 900){
		// 	out_char(current_tty, 'C');
		// }
		//milli_delay(10);
		//disp_int(get_ticks());
		//disp_str("C");
		//disp_str(".");
		//delay(1);
		//milli_delay(30);
		//milli_delay(1);
	}
}
// 进程调度次数
//unsigned int counter = 0;
void schedule_process()
{
	Proc *p;
	unsigned int greatest_ticks = 0;
	//proc_ready_table = &proc_table[3];
	//return;
	while(!greatest_ticks){
		//for(p = proc_table; p < proc_table + USER_PROC_NUM; p++){
		for(p = proc_table; p < proc_table + TASK_PROC_NUM + USER_PROC_NUM; p++){
			if(p->p_flag == RUNNING && p->ticks > greatest_ticks){
				greatest_ticks = p->ticks;
				proc_ready_table = p;
			}
		}
		
		//p_flag需要参与运算吗？目前，是否参与都行，看具体需求。
		//while(!greatest_ticks){
		if(!greatest_ticks){
			for(p = proc_table; p < proc_table + TASK_PROC_NUM + USER_PROC_NUM; p++){
				if(p->p_flag == RUNNING){
					p->ticks = p->priority;
				}
			}
		}

	}
	
	//disp_str("[");
	//disp_int(proc_ready_table->pid);
	//disp_str("]");
	//proc_ready_table++;
	//if(proc_ready_table >= proc_table + USER_PROC_NUM){
	//	proc_ready_table = proc_table;
	//}
	//proc_ready_table = &proc_table[1];
	//return;
	//counter++;
	//ticks++;
	//proc_ready_table = &proc_table[counter%3];
	//disp_str("[");
	//disp_int(proc_ready_table->pid);
	//disp_str("]");
	//return;
//	//extern unsigned int counter;
//	if(counter < USER_PROC_NUM - 1){
//		//proc_ready_table = &proc_table[counter++];
//		counter++;
//		proc_ready_table = &proc_table[counter];
//	}else{
//		proc_ready_table = proc_table;
//		counter = 0;
//	}
//	return;
//	counter++;
//	// if(counter == USER_PROC_NUM){
//	if(counter == USER_PROC_NUM - 1){
//		counter = 0;
//		proc_ready_table = proc_table;
//	}
//	// proc_ready_table++;	
//	// counter++;
}


int sys_get_ticks()
{
	//disp_str("@@");
	
	return ticks;
}

void sys_write(char *buf, int len, Proc *proc)
{
	//TTY *tty = &tty_table[proc - proc_table];
	TTY *tty = &tty_table[proc->tty_index];
	int i = len;
	char *p = buf;
	while(i > 0){
		out_char(tty, *p);
		p++;
		i--;
	}	
}

void milli_delay(unsigned int milli_sec)
{
	int t = get_ticks_ipc();

	while(((get_ticks_ipc() - t) / 100 * 1000)  < milli_sec){}
}

void clock_handler()
{
	if(proc_ready_table->ticks > 0){
		proc_ready_table->ticks--;
	}
	ticks++;

	if(k_reenter != 0 ){
		//return proc_ready_tab
		return;
	}
	
	if(proc_ready_table->ticks > 0){
		return;
	}	

	// 调度进程
	schedule_process();
}

// 键盘 start
void keyboard_handler()
{
	//char scan_code = in_byte(0x60);
	//disp_int(scan_code);
	int port = 0x60;
	if(keyboard_buffer.counter < KEYBOARD_BUF_SIZE){
		//unsigned char scan_code = 0x9E;//in_byte(port);
		disable_int();
		// 耗费了巨量时间
		unsigned char scan_code = in_byte(port);
		//scan_code = scan_code;
		//disp_int(scan_code);
		*(keyboard_buffer.head) = scan_code;//in_byte(port);
		keyboard_buffer.head++;
		keyboard_buffer.counter++;
		//if(keyboard_buffer.counter == KEYBOARD_BUF_SIZE){
		//if(keyboard_buffer.head > keyboard_buffer.buf + KEYBOARD_BUF_SIZE){
		if(keyboard_buffer.head >= keyboard_buffer.buf + KEYBOARD_BUF_SIZE){
			keyboard_buffer.head = keyboard_buffer.buf;
		}
		enable_int();
	}
}

unsigned char read_from_keyboard_buf()
//void keyboard_read()
{
	unsigned char scan_code = 0;
	if(keyboard_buffer.counter > 0){
		disable_int();
		//char scan_code = *(keyboard_buffer.tail);
		scan_code = *(keyboard_buffer.tail);

		//disp_int(scan_code);

		keyboard_buffer.tail++;
		keyboard_buffer.counter--;
		//if(keyboard_buffer.counter == 0){
		//if(keyboard_buffer.tail > keyboard_buffer.buf + KEYBOARD_BUF_SIZE){
		if(keyboard_buffer.tail >= keyboard_buffer.buf + KEYBOARD_BUF_SIZE){
			keyboard_buffer.tail = keyboard_buffer.buf;
		}
		enable_int();
	}
	
	return scan_code;
}

void keyboard_read(TTY *tty)
{
	while(keyboard_buffer.counter <= 0){
	}
	unsigned char scan_code = read_from_keyboard_buf();
	// 从映射数组中解析出来的值
	unsigned int key = 0;
	unsigned char make = 0;
	//scan_code = 0x30;
	if(scan_code == 0xE1){
		// 解析Pause
		unsigned char make_code[6] = {0xE1, 0x1D, 0x45, 0xE1, 0x9D, 0xC5};
		char is_pause = 1;
		for(int i = 1; i < 6; i++){
			if(read_from_keyboard_buf() != make_code[i]){
				is_pause = 0;
				break;
			}
		}	
		
		if(is_pause){
			key = PAUSE; 
		}

	}else if(scan_code == 0xE0){
		// 按下
		if(read_from_keyboard_buf() == 0x2A){
			if(read_from_keyboard_buf() == 0xE0){
				if(read_from_keyboard_buf() == 0x37){
					key = PRINT_SCREEN;
					make = 1;
				}
			}
		}

		// 松开
		if(read_from_keyboard_buf() == 0xB7){
			if(read_from_keyboard_buf() == 0xE0){
				if(read_from_keyboard_buf() == 0xAA){
					key = PRINT_SCREEN;
					make = 0;
				}
			}
		}

		if(key == 0){
			is_e0 = 1;
		}
	}

	if(key != PAUSE && key  != PRINT_SCREEN){

		if(scan_code == SHIFT_R1 | scan_code == SHIFT_L1){
			is_shift = 1;
		}

		// 是不是Make Code
		make = (scan_code & 0x80) ? 0 : 1;
		//if(is_shift != 1 && make){
		if(scan_code && make){
			unsigned char cols = 0;
			if(is_shift == 1){
				cols = 1;
				//is_shift = 0;
				//is_disp = 0;
			}
			// is_e0 == 1 不等价于 is_e0
			// 上面说错了 is_e0 是0，if不成立；is_e0非0，if成立。
			//if(is_e0 == 1){
			if(is_e0){
				cols = 2;
				//is_e0 = 0;
				//is_disp = 0;
			}
			key = keymap[MAP_COLS * scan_code + cols];
			//if(scan_code != SHIFT_L1 && scan_code != SHIFT_R1){
			//	unsigned char ch[2];
			//	Memset(ch, 0, 2);
			//	ch[0] = keymap[MAP_COLS * scan_code + cols];
			//	disp_str(ch);
			//	is_shift = 0;
			//	is_e0 = 0;
			//}
			// 处理字符打印等
			// todo key，在上面处理
			in_process(tty, key);
		}
	}	
}

void TaskTTY()
{
	//keyboard_buffer.buf[0] = 0x1E;	
	//keyboard_buffer.buf[1] = 0x30;	
	//keyboard_buffer.buf[2] = 0x2E;	
	//keyboard_buffer.buf[3] = 0x20;	
	//keyboard_buffer.buf[4] = 0x12;	
	//keyboard_buffer.tail = keyboard_buffer.head = keyboard_buffer.buf;
	//keyboard_buffer.counter = 5;

	// // 设置光标位置
		 // Cursor Location High Register
		 //out_byte(0x3D4, 0x0E);
		 ////out_byte(0x3D5, ((VM_BASE_ADDR + dis_pos)/2) >> 8);
		 //out_byte(0x3D5, (VM_BASE_ADDR) >> 8);
		 //// Cursor Location Low Register
		 //out_byte(0x3D4, 0xF);
		 ////out_byte(0x3D5, (VM_BASE_ADDR + dis_pos)/2);
		 //out_byte(0x3D5, VM_BASE_ADDR);


	init_tty();
	select_console(0);
	//Printf("T:%x", 3);
	while(1){
		for(TTY *tty = tty_table; tty < tty_table + TTY_NUM; tty++){
			tty_do_read(tty);
			//tty->counter = 5;
			tty_do_write(tty);
		}
	}
}

void TaskSys()
{
	while(1){
		//Message *msg;
			//Printf("%c--", 'S');
			//Printf("flag:%x--,", proc_table[1].p_flag);
			//Printf("send_to:%x--,", proc_table[1].p_send_to);
			//Printf("receive_from:%x--,", proc_table[1].p_receive_from);
			//Printf("%c", '\n');
		//return;
		Message msg;
		Memset(&msg, 0, sizeof(Message));
		int ret = receive_msg(&msg, ANY);
		if(ret != 0){
			return;
		}
		int type = msg.type;
		int source = msg.source;
		switch(type){
			case TICKS_TASK_SYS_TYPE:
				msg.val = ticks;
				ret = send_msg(&msg, source);
				break;
			default:
				
				break;
		}
	}
}

void init_keyboard_handler()
{
	//unsigned char is_e0 = 0;
	//如果用上面的语句创建is_e0，是局部变量，没有修改全局变量is_e0的值。
	is_e0 = 0;
	//unsigned char is_shift = 0;
	is_shift = 0;
	//unsigned char is_disp = 1;
	//dis_pos = 0;
}

void in_process(TTY *tty, unsigned int key)
{
	// 一个字符占用2个字节。需填充15行。
	// 每行80个字节，共25行。
	// 每行需打印40个字符。
	//for(int i = 0; i < 40*15; i++){
	//	disp_str("A");
	//}
	// 打印字符
	unsigned char ch[2];
	Memset(ch, 0, 2);
	if(!(key & FLAG_EXT)){
		// ch[0] = key;
		// out_char(tty->console, key);
		put_key(tty, key);

		// disp_str(ch);
		
		// //disp_str("pos:");
		// //disp_int(dis_pos);
		// // 设置光标位置
		// // Cursor Location High Register
		// out_byte(0x3D4, 0x0E);
		// out_byte(0x3D5, (dis_pos/2) >> 8);
		// // Cursor Location Low Register
		// out_byte(0x3D4, 0xF);
		// out_byte(0x3D5, dis_pos/2);
		
		// 没有想到更好的方法，只能放到这个函数中，下策。
		is_e0 = 0;
		is_shift = 0;
	}else{
		if(is_shift && (key != SHIFT_L1 && key != SHIFT_R1)){
			switch(key){
				case UP:
					// out_byte(0x3D4, 0xC);
					// out_byte(0x3D5, (80*15) >> 8);
					// out_byte(0x3D4, 0xD);
					// out_byte(0x3D5, 80*15);

					scroll_up(tty);

					is_shift = 0;
					is_e0 = 0;
					break;
				case DOWN:
					
					// out_byte(0x3D4, 0xC);
					// out_byte(0x3D5, (80*0) >> 8);
					// out_byte(0x3D4, 0xD);
					// out_byte(0x3D5, 80*0);

					scroll_down(tty);

					is_shift = 0;
					is_e0 = 0;
					break;
				case ENTER:
					out_char(tty, '\n');
					break;
				case BACKSPACE:
					out_char(tty, '\b');
					break;
				default:
					// 这个break必须有，否则，会报下面的错误。
					// main.c:1053:5: error: label at end of compound statement
					//is_shift = 0;
					//is_e0 = 0;
					break;
					
			}
			//is_shift = 0;
			//is_e0 = 0;
		}else{
			switch(key){
				case ENTER:
					//out_char(tty->console, '\n');
					put_key(tty, '\n');
					break;
				case BACKSPACE:
					//out_char(tty->console, '\b');
					put_key(tty, '\b');
					break;
				case F1:
					select_console(0);
					break;
				case F2:
					select_console(1);
					break;
				case F3:
					select_console(2);
					break;
				default:
					break;
			}
		}	
	}	
}

// 键盘 end

// TTY start

void select_console(unsigned char tty_index)
{
	if(tty_index <0 || tty_index > TTY_NUM - 1){
		return;
	}

	// 不确定这个写法是否能达到预期目的
	current_tty = &tty_table[tty_index];

	flush(current_tty);
}

void flush(TTY *tty)
{
	//set_cursor(VM_BASE_ADDR + tty->console->cursor);
	//set_cursor(tty->console->cursor + 1);
	set_cursor(tty->console->cursor);
	//set_cursor(0);
	//set_console_start_video_addr(VM_BASE_ADDR + tty->console->start_video_addr);
	set_console_start_video_addr(tty->console->start_video_addr);
}

void set_cursor(unsigned int cursor)
{
	//cursor = 80;
	// 设置光标位置
	// Cursor Location High Register
	out_byte(0x3D4, 0x0E);
	out_byte(0x3D5, cursor >> 8);
	// Cursor Location Low Register
	out_byte(0x3D4, 0xF);
	out_byte(0x3D5, cursor);
}

void set_console_start_video_addr(unsigned int start_video_addr)
{
	out_byte(0x3D4, 0xC);
	out_byte(0x3D5, start_video_addr >> 8);
	out_byte(0x3D4, 0xD);
	out_byte(0x3D5, start_video_addr);
}

/*====================================================
把数据放入tty的缓冲区。逻辑如下：
1. 缓冲区未满才放入。
2. 放入head，然后head向后移动一位。
3. counter++。
4. 检查，head == tty_buf_table + 缓冲区长度。
5. 如果上面的条件成立，重置 head = tty_buf_table。
======================================================*/
void put_key(TTY *tty, unsigned char key)
{
	if(tty->counter < KEYBOARD_BUF_SIZE){
		*(tty->head) = key;
		tty->head++;
		tty->counter++;
		if(tty->head == tty->buf + KEYBOARD_BUF_SIZE){
			tty->head = tty->buf;
		}
	}
}

/*====================================================
把tty的屏幕向上滚动一屏。逻辑如下：
1. 如果终端的start_video_addr > original_addr，那么，可以向上滚屏。
2. start_video_addr 是 SCREEN_SIZE 的倍数。
3. 滚屏，涉及到寄存器操作。
======================================================*/
void scroll_up(TTY *tty)
{
	if(tty->console->start_video_addr > tty->console->original_addr){
		set_console_start_video_addr(tty->console->start_video_addr - SCREEN_SIZE);
	}
}

/*====================================================
把tty的屏幕向下滚动一屏。逻辑如下：
1. 剩余的显存大于一屏的空间。
2. 记得不牢，需要再次分析、计算。
3. 剩余的显存大于一屏的空间，怎么写代码？
======================================================*/
void scroll_down(TTY *tty)
{
	if(tty->console->start_video_addr + 2 * SCREEN_SIZE < tty->console->original_addr + tty->console->vm_limit){
		set_console_start_video_addr(tty->console->start_video_addr + SCREEN_SIZE);
	}
}

/*====================================================
耗费最多时间。
把字符写入显存，代替disp_str。逻辑如下：
1. 换行符。最费劲。我的理解，仍有点不透彻。
2. 退格符。
3. 普通字符。
======================================================*/
void out_char(TTY *tty, unsigned char key)
//void out_char(CONSOLE *console, unsigned char key)
{
	// unsigned int addr_in_vm = VM_BASE_ADDR + tty->console->cursor * 2;
	//(unsigned char*) addr_in_vm = (unsigned char *)(VM_BASE_ADDR + tty->console->cursor * 2);
	//unsigned char* addr_in_vm = (unsigned char *)(VM_BASE_ADDR + console->cursor * 2);
	//unsigned char* addr_in_vm = (unsigned char *)(console->cursor * 2);
	//unsigned char* addr_in_vm = (unsigned char *)(console->cursor);
	unsigned char* addr_in_vm = (unsigned char *)(VM_BASE_ADDR + tty->console->cursor * 2);
	//unsigned char* addr_in_vm = (unsigned char *)(VM_BASE_ADDR + 0);

	//key = 'C';
	switch(key){
		case '\n':
			// 换行
			// 看了于上神的代码，我才写出来。唉-----
			if(tty->console->cursor < tty->console->original_addr + tty->console->vm_limit - SCREEN_WIDTH){
				tty->console->cursor = tty->console->original_addr + 
				((tty->console->cursor - tty->console->original_addr)/SCREEN_WIDTH + 1) * SCREEN_WIDTH;
			}
			break;
		case '\b':
			// 退格
			//if(tty->console->cursor > 0){
			if(tty->console->cursor > tty->console->original_addr){
				//*(addr_in_vm - 1) = ' ';
				//*(addr_in_vm - 2) = 0x00;//DEFAULT_COLOUR;
				tty->console->cursor--;
				*(addr_in_vm - 2) = ' ';
				*(addr_in_vm - 1) = 0x00;
				//set_cursor(0);	
				//tty->console->cursor--;
			}
			break;
		default:
			//普通字符
			// 也看了于上神的代码。这个分支，我完全能独立写出来。不要依赖别人代码。
			// 总看别人的代码，那么，这是我自己写的还是抄别人的？
			// 实在实在想不出来，再去看别人的。
			// 这个分支，完全只是普通的逻辑，没有任何领域知识。我应该完全能够独立写出来。
			if(tty->console->cursor + 1 < tty->console->original_addr + tty->console->vm_limit){
				//key = 'F';
				//*(addr_in_vm + 2) = key;
				*addr_in_vm++ = key;
				//*(addr_in_vm + 1) = key;
				//*(addr_in_vm + 2) = DEFAULT_COLOUR;
				//*(addr_in_vm + 1) = DEFAULT_COLOUR;
				*addr_in_vm++ = DEFAULT_COLOUR;
				tty->console->cursor++;
				//console->cursor = console->cursor + 1;
			}
			break;
	}

	// 有bug，导致只能打印部分字符。故，暂时不滚屏。
	// 向下滚屏
	// 什么时候需要滚屏？我又不记得了。独立分析出来！
	// 超过一屏数据时，需要滚屏。
	//while(tty->console->cursor - tty->console->start_video_addr > SCREEN_SIZE){
	//	scroll_down(tty);
	//}

	flush(tty);
}

/*====================================================
把数据从键盘缓冲区读出来放到tty缓冲区。逻辑如下：
1. 键盘缓冲区有数据才读。
2. 遇到ENTER转换成\n。
3. 遇到BACKSPACE转换成\b。
3. 用put_key放入tty缓冲区。
======================================================*/
void tty_do_read(TTY *tty)
{
	// if条件，似乎可以不要
	if(tty == current_tty && keyboard_buffer.counter > 0){
		keyboard_read(tty);
	}
}

/*====================================================
把数据从tty缓冲区读出来写到显存。逻辑如下：

======================================================*/
void tty_do_write(TTY *tty)
{
	//disp_str("111\n");
	while(tty->counter > 0){
		//disp_str("222\n");
		unsigned char key = *(tty->tail);
		//key = 'F';
		tty->tail++;
		tty->counter--;
		if(tty->tail == tty->buf + KEYBOARD_BUF_SIZE){
			tty->tail = tty->buf;
		}
		//key = 'B';
		out_char(tty, key);
	}
}

/*====================================================
初始化CONSOLE。逻辑如下：
1. 难点是，如何确定original_addr?
需要确定，是第几个console。
======================================================*/
//void init_screen(CONSOLE *console)
void init_screen(TTY *tty)
{
	unsigned int index = tty - tty_table;
	//CONSOLE *console = &console_table[index];
	tty->console = console_table + index;
	
	// 把字节数转换为字
	unsigned video_mem_size_by_word = VM_TOTAL >> 1;

	// 单位转换为字
	tty->console->vm_limit = video_mem_size_by_word / TTY_NUM;

	//tty->console->original_addr = VM_BASE_ADDR + index * tty->console->vm_limit;
	tty->console->original_addr = index * tty->console->vm_limit;

	//tty->console->cursor = tty->console->start_video_addr = tty->console->original_addr;
	tty->console->cursor = tty->console->start_video_addr = tty->console->original_addr;

	if(index > 0){
		//disp_str("#");
		//disp_int(index + 1);
		//tty->console->cursor += 2;
	}
}

/*====================================================
初始tty。逻辑如下：

======================================================*/
void init_tty()
{
	for(TTY *tty = tty_table; tty < tty_table + TTY_NUM; tty++){
		// 初始化缓冲区
		tty->head = tty->tail = tty->buf;
		tty->counter = 0;
		// 初始化console
		init_screen(tty);
		if(tty - tty_table > 0){
			out_char(tty, '#');
			out_char(tty, 49 + tty - tty_table);
			//tty->console->cursor++;		
	
		}
	}
}

// TTY end
//
// 只支持%x
void Printf(char *fmt, ...)
{
	char buf[256];
	Memset(buf, 0, 256);
	// 理解这句，耗费了大量时间。
	char *var_list = (char *)((char *)&fmt + 4);
	int len = vsprintf(buf, fmt, var_list);
	//char str[2] = {'A', 0};
	//len = 2;
	write(buf, len);	
	return;
}

int vsprintf(char *buf, char *fmt, char *var_list)
{
	// 指向buf
	char *p;
	// 必须作为全局变量。如果作为局部变量，然后初始化，会覆盖其他数据。
	// 目前的内存机制，就是这样。
	//char inner_buf[DEFAULT_STR_SIZE];
	// Memset(inner_buf, 0, DEFAULT_STR_SIZE);
	char inner_buf[DEFAULT_STR_SIZE];
	char *str = inner_buf;
	 // 转换数字使用
	// 使用256会导致gdt中的数据被擦除，从而导致各种奇怪的问题，比如，proc_ready_table中的数据被修改。
	// 耗费了八个小时左右才发现这个问题。
	//char tmp[256];	
	//char tmp[128];	
	char tmp[64];	
	//char tmp[4];	
	//return 0;
	Memset(tmp, 0, sizeof(tmp));
	//Memset(tmp, 0, 256);
	char *next_arg = var_list;
	int len2 = 0;
	for(p = buf; *fmt; fmt++ ){
		if(*fmt != '%'){
			*p++ = *fmt;
			//p++;
			continue;
		}
		// 跳过%
		fmt++;
		switch(*fmt){
			//case 'd':;
			case 'd':{
				int m = *(int *)next_arg;
				itoa(m, &str, 10);
				//i2a(m, 10, &str);
				//Strcpy(p, str);
				Strcpy(p, inner_buf);
			      	next_arg += 4;
				// len2 = Strlen(str);
				len2 = Strlen(inner_buf);
				p += len2;
				break;
			}
			case 'x':
				atoi(tmp, *(int *)next_arg);
				//Strcpy(buf, tmp);
				Strcpy(p, tmp);
				next_arg += 4;
				len2 = Strlen(tmp);
				p += len2;//Strlen(tmp);	
				break;
			case 's':
				//char *str = *(char **)next_arg;
				Strcpy(p, *(char **)next_arg);
				len2 = Strlen(*(char **)next_arg);
				next_arg += 4;
				//len2 = 6;//Strlen(*(char **)next_arg);
				p += len2;//Strlen(tmp);
				break;
			case 'c':
				//char c = *(char *)next_arg;
				*p = *(char *)next_arg;
				next_arg += 4;
				len2 = 1;
				p += len2;//Strlen(tmp);
				break;
			default:
				break;
		}
	}

	return (p - buf);	
}
// printf end



// debug start
void printx(char *fmt, ...)
{
	char buf[256];
	char *var_list = (char *)((char *)&fmt + 4);
	int len = vsprintf(buf, fmt, var_list);
	write_debug(buf, len);
}

// 系统调用，使用汇编代码实现
// void write_debug(char *buf, int len);
void sys_printx(char *error_msg, int len, Proc *proc)
//void sys_printx(char *error_msg, int caller_pid)
{
	int line_addr;
	int base;
	//Proc *proc = pid2proc(caller_pid);

	if(k_reenter == 0){
		int ds = proc->s_reg.ds;
		base = Seg2PhyAddrLDT(ds, proc);
	}else if(k_reenter > 0){
		base = Seg2PhyAddr(DS_SELECTOR);
	}
	line_addr = base + error_msg;


	// 打印字符串
	TTY *tty = &tty_table[proc->tty_index];
	char *p = (char *)line_addr;
	char magic = *p;
	while(len > 0){
		if(*p == ASSERT_MAGIC || *p == PANIC_MAGIC){
			p++;
			continue;
		}
		out_char(tty, *p);
		p++;
		len--;
	}
	// 字符串中有空格时不能打印出来
	//while(*p != '\0'){
	//	if(*p == ASSERT_MAGIC || *p == PANIC_MAGIC){
	//		p++;
	//		continue;
	//	}
	//	out_char(tty, *p);
	//	p++;
	//}


	//char magic = error_msg[0];
	if(magic == ASSERT_MAGIC){
		if(k_reenter > 0){
			disable_int();
			__asm__("hlt");
		}else{

		}
	}else if(magic == PANIC_MAGIC){
		disable_int();
		__asm__("hlt");
	}

	return;
}

void spin(char *error_msg)
{
	while(1){}
}

void panic(char *error_msg)
{
	printx("%c%s\n", PANIC_MAGIC, error_msg);
	//Printf("%c%s\n", PANIC_MAGIC, error_msg);
}

void assertion_failure(char *exp, char *filename, char *base_filename, unsigned int line)
{
	printx("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
	//Printf("%c%s error in file [%s],base_file [%s],line [%d]\n\n",
	ASSERT_MAGIC, exp, filename, base_filename, 8456);
	spin("Stop Here!\n");
	return;
}


// debug end

Proc *pid2proc(int pid)
{
	Proc *proc = proc_table + pid;
	// todo 用局部变量当返回值，曾经遇到过出错。要当心。
	return proc;
}

int proc2pid(Proc *proc)
{
	int pid = proc - proc_table;
	return pid;
}

// ipc start
int dead_lock(int src, int dest)
{
	Proc *src_proc = pid2proc(src);
	Proc *dest_proc = pid2proc(dest);
	while(1){
		// Proc *src_proc = pid2proc(src);
		// Proc *dest_proc = pid2proc(dest);
		if (dest_proc->p_flag == SENDING){
			if(dest_proc->p_send_to == src){
				// panic("dead lock!\n");
				//Printf("%x---->%x---->", src, dest);
				// 打印死锁环
				Proc *p = dest_proc;
				do{
					// Printf("%x---->%x---->", proc2pid(p), p->p_send_to);
					p = pid2proc(p->p_send_to);	
				}while(p->pid != src);
				//Printf("%x\n", src);
				// Printf("%x---->%x---->", proc2pid(p), src);
				return 1;
			}
			dest_proc = pid2proc(dest_proc->p_send_to);	
		}else{
			break;
		}
	}

	return 0;
}
// send_msg 通过sys_call调用
int sys_send_msg(Message *msg, int receiver_pid, Proc *sender)
{
	Proc *receiver = pid2proc(receiver_pid);
	int sender_pid = proc2pid(sender);
	if(DEBUG == 1){
		Printf("sender = %x, receiver = %x\n", sender_pid, receiver_pid);

		assert((sender_pid == 1) || (sender_pid == 2) || (sender_pid == 3) || (receiver_pid == 15));
		assert((receiver_pid == 1) || (receiver_pid == 2) || (receiver_pid == 3) || (receiver_pid == 15));
	}
	msg->source = sender_pid;
	// 死锁检测
	if(dead_lock(sender_pid, receiver_pid) == 1){
		panic("dead lock\n");
	}

	if(receiver->p_flag == RECEIVING && (receiver->p_receive_from == sender_pid
		|| receiver->p_receive_from == ANY)){
		// 计算msg的线性地址
		int ds = sender->s_reg.ds;
		int base = Seg2PhyAddrLDT(ds, sender);
		int msg_line_addr = base + msg;
		int msg_size = sizeof(Message);
		// 从sender中把消息复制到receiver
		phycopy(receiver->p_msg, msg_line_addr, msg_size);
		// 重置sender
		sender->p_msg = 0;
		sender->p_send_to = 0;
		// 重置receiver
		receiver->p_msg = 0;
		receiver->p_flag = RUNNING;
		receiver->p_receive_from = 0;

		// 解除receiver的阻塞。
		unblock(receiver);

		// 调试函数
		assert(sender->p_msg == 0);
		assert(sender->p_send_to == 0);
		assert(receiver->p_msg == 0);
		assert(receiver->p_flag == 0);
		assert(receiver->p_receive_from == 0);

	}else{
		sender->p_msg = msg;
		sender->p_send_to = receiver_pid;
		sender->p_flag = SENDING;
		// 把sender中的消息放入receiver的p_send_queue把sender中的消息放入receiver的p_send_queue
		//struct MsgSender *current = receiver->header;
		//struct MsgSender *pre = receiver->header;
		// 上面的写法会导致pre、current的内存地址是0。我认为，是它们导致出现死锁。
		// 不在这个项目这样写，没有问题。
		//struct MsgSender *current = receiver->header;
		//struct MsgSender *pre = receiver->header;
		////while(*current != 0x0){
		////while(current != 0x0){
		//while(current->sender_pid != -1){
		//	pre = current;
		//	current = current->next;
		//}
		//// pre->next = {sender_pid, NULL};
		//// pre->next = &{sender_pid, 0x0};
		//pre->next->sender_pid = sender_pid;
		//pre->next->next = 0;

		if(receiver->header == 0x0){
			struct MsgSender msg_sender = {sender_pid, 0};
			//receiver->header->next = &msg_sender;
			receiver->header = &msg_sender;
		}else{
			// struct MsgSender *current = receiver->header->next;
			// struct MsgSender *current = receiver->header->next;
			struct MsgSender *current = receiver->header;
			struct MsgSender *pre = receiver->header;
			//while(*current != 0x0){
			//while(current != 0x0){
			while(current  != 0){
				pre = current;
				current = current->next;
			}
			// pre->next = {sender_pid, NULL};
			// pre->next = &{sender_pid, 0x0};
			pre->next->sender_pid = sender_pid;
			pre->next->next = 0;
		}
		
		// 调试函数
		assert(sender->p_flag == SENDING);
		assert(sender->p_send_to == receiver_pid);
		assert(sender->p_msg == msg);

		assert(receiver->header != 0x0);
		// 阻塞sender
		block(sender);
	}

	return 0;
}

// receive_msg 通过sys_call调用
int sys_receive_msg(Message *msg, int sender_pid, Proc *receiver)
{
	int copy_ok = 0;
	int p_from;
	
	Proc *sender = pid2proc(sender_pid);
	int receiver_pid = proc2pid(receiver);
	if(DEBUG == 1){	
		Printf("sender = %x, receiver = %x\n", sender_pid, receiver_pid);

		assert((sender_pid == 1) || (sender_pid == 2) || (sender_pid == 3) || (sender_pid == 15));
		assert((receiver_pid == 1) || (receiver_pid == 2) || (receiver_pid == 3) || (receiver_pid == 15));
}
	if(sender_pid == ANY){
		//if(receiver->header->next->sender_pid != 0x0){
		if(receiver->header != 0x0){
			// p_from = receiver->header->next->sender_pid;
			p_from = receiver->header->sender_pid;
			// header是头指针；把第一个进程从队列中移除
			// receiver->header->next = receiver->header->next->next;
			receiver->header = receiver->header->next;
			copy_ok = 1;
		}
	}else if(0 <= sender_pid && sender_pid < USER_PROC_NUM + TASK_PROC_NUM){
		if(sender->p_flag == SENDING && (sender->p_send_to == ANY 
					|| sender->p_send_to == receiver_pid)){
			// 遍历receiver的发送消息的进程队列，从中移除sender
			// 本质是，从发送消息的进程队列中移除sender
			struct MsgSender *current = receiver->header;
			struct MsgSender *pre = receiver->header;
			// struct MsgSender current = receiver->header;
			// struct MsgSender pre = receiver->header;
			//while(*current != 0x0){
			// while(current->sender_pid != 0x0){
			while(current != 0x0){
				if(current->sender_pid == sender_pid){
					copy_ok = 1;
					break;
				}
				// 难点：下面这句，应该在break语句的上面还是下面？
				// 心算能力强，心算就能计算出结果。可我的心算能力不强。
				// 在我的设计中，在上面还是下面，结果一样。可能和我的
				// 队列设置了头结点指针有关。
				pre = current;
				current = current->next;
			}
			if(copy_ok == 1){
				// 移除sender
				pre->next = current->next;
				p_from = sender_pid;
			}
		}
	}


	if(copy_ok == 1){
		Proc *p_from_proc = pid2proc(p_from);
		// 计算msg的线性地址
		int ds = receiver->s_reg.ds;
                int base = Seg2PhyAddrLDT(ds, receiver);
                int msg_line_addr = base + msg;
                int msg_size = sizeof(Message);
                // 从receiver中把消息复制到sender
                phycopy(msg_line_addr, p_from_proc->p_msg, msg_size);		

		// 重置sender
                p_from_proc->p_msg = 0;
                p_from_proc->p_flag = RUNNING;
                p_from_proc->p_send_to = 0;
                // 重置receiver
                receiver->p_msg = 0;
                receiver->p_receive_from = 0;
		// 解除sender的阻塞
		// unblock(sender);
		unblock(p_from_proc);

		// 调试函数
		assert(p_from_proc->p_msg == 0);
		assert(p_from_proc->p_flag == RUNNING);
		assert(p_from_proc->p_send_to == 0);

		assert(receiver->p_msg == 0);
		assert(receiver->p_receive_from == 0);

	}else{
		receiver->p_flag = RECEIVING;
		receiver->p_msg = msg;
		
		if(sender_pid == ANY){
			receiver->p_receive_from = ANY;
		}else{
			receiver->p_receive_from = sender_pid;
		}

		// 调试函数
		assert(receiver->p_flag == RECEIVING);
		assert(receiver->p_msg == msg);

		block(receiver);
	}

	return 0;
}

// 系统调用--用汇编实现
// int send_msg(Message *msg, int receiver_pid)
// {

// }

// 系统调用--用汇编实现
// int receive_msg(Message *msg, int sender_pid)
// {

// }

// send_rec封装send_msg和receive_msg，直接被外部使用
// function：选择发送还是接收还是其他;pid，sender或receiver的进程id
int send_rec(int function, Message *msg, int pid)
{
	int ret;
	switch(function){
		case SEND:
			ret = send_msg(msg, pid);
			break;
		case RECEIVE:
			ret = receive_msg(msg, pid);
			break;
		case BOTH:
			// 两个函数都使用pid，正确吗？
			ret = send_msg(msg, pid);	// pid是receiver
			//while(proc_table[1].p_flag != RUNNING){

			//}
			//assert(proc_table[1].p_flag == RUNNING);
			if(ret == 0){
				ret = receive_msg(msg, pid);	// pid是sender
				assert(msg->val != 0);
			}
			break;
		default:
			panic("function is invalid\n");
			break;
	}
	return 0;
}
// 阻塞进程
int block(Proc *proc)
{
	// 判断，调试函数
	//k_reenter--;
	schedule_process();
	return 0;
}
// 解除阻塞
int unblock(Proc *proc)
{
	// do nothing
	return 0;
}

int get_ticks_ipc()
{
	//return ticks;
	Message msg;
	Memset(&msg, 0, sizeof(Message));
	//msg.source = 2;
	msg.type = TICKS_TASK_SYS_TYPE;
	int ret = send_rec(BOTH, &msg, 1);
	int ticks = msg.val;
	return ticks;
}

// 把整型数字转成指定进制的字符串
//void itoa(int value, char *str, int base)
char *itoa(int value, char **str, int base)
{
	int remainder = value % base;
	int queotion = value / base;
	// 这是递归啊，怎么会用while呢？
	//while(queotion > 0){
	//	itoa(queotion, str, base);
	//}
	if(queotion){
		itoa(queotion, str, base);
	}
	// *str++，是这样写吗？没有把握。不是！致命的常规错误，耗费了很长时间。
	// *str++ = remainder + '0';

	*((*str)++) = remainder + '0';
	return *str;
}
// ipc end

char* i2a(int val, int base, char ** ps)
{
	int m = val % base;
	int q = val / base;
	if (q) {
		i2a(q, base, ps);
	}
	*(*ps)++ = (m < 10) ? (m + '0') : (m - 10 + 'A');
	// 等价于
	// unsigned char c = (m < 10) ? (m + '0') : (m - 10 + 'A');
	// *ps++ = &c;

	return *ps;
}
