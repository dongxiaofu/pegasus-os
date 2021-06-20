#include "const.h"
#include "proto.h"
#include "string.h"
#include "keymap.h"
#include "keyboard.h"
#include "console.h"


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

void init_propt()
{
	// 时钟中断
	InitInterruptDesc(INIT_MASTER_VEC_NO + 0, hwint0 ,0x08,0x0E);	
	// 键盘中断
	InitInterruptDesc(INIT_MASTER_VEC_NO + 1, hwint1 ,0x08,0x0E);	
	// 硬盘中断
	InitInterruptDesc(INIT_SLAVE_VEC_NO + 6, hwint14 ,0x08,0x0E);	

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
