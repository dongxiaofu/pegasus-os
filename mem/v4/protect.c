#include "stdio.h"
#include "string.h"
#include "const.h"
#include "type.h"
#include "protect.h"
#include "process.h"
#include "keyboard.h"
#include "console.h"
#include "global.h"
#include "proto.h"

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
    int addr = (desc.seg_base_below & 0xFFFF) | ((desc.seg_base_middle << 16) & 0xFF0000) | (unsigned char)((desc.seg_base_high << 24) & 0xFF000000);
    return addr;
}

// 根据段名求物理地址
unsigned int Seg2PhyAddrLDT(unsigned int selector, Proc *proc)
{
    Descriptor desc = proc->ldts[selector >> 3];
    //int addr = ((desc & 0xFFFF0000) >> 16) | (((desc >> 32) & 0xFF) << 16) | (((desc >> 56) & 0xFF) << 24);
    //int addr = desc.seg_base_below | (desc.seg_base_middle << 16) | (desc.seg_base_high << 24);
    //int addr = (desc.seg_base_below & 0xFFFF) | ((desc.seg_base_middle & 0xFF0000)) | ((desc.seg_base_high & 0xFF000000));
    int addr = (desc.seg_base_below & 0xFFFF) | ((desc.seg_base_middle << 16) & 0xFF0000) | (unsigned char)((desc.seg_base_high << 24) & 0xFF000000);
    return addr;
}

// 根据虚拟地址求物理地址
unsigned int VirAddr2PhyAddr(unsigned int base, void *offset)
{
    int addr = base + (int)offset;
    return addr;
}

unsigned int v2l(int pid, void *offset)
{
    Proc *proc = pid2proc(pid);
    // int ds = proc->s_reg.ds;
    int ds = 1;
    int base = Seg2PhyAddrLDT(ds, proc);
    int line_addr = base + offset;
    return line_addr;
}

void init_propt()
{
    // 时钟中断
    InitInterruptDesc(INIT_MASTER_VEC_NO + 0, hwint0, 0x08, 0x0E);
    // 键盘中断
    InitInterruptDesc(INIT_MASTER_VEC_NO + 1, hwint1, 0x08, 0x0E);
    // InitInterruptDesc(INIT_MASTER_VEC_NO + 1, hwint14, 0x08, 0x0E);
    // 硬盘中断
    InitInterruptDesc(INIT_SLAVE_VEC_NO + 6, hwint14, 0x08, 0x0E);

    // Memset(proc_table, 0, sizeof(proc_table));
    Memset(proc_table, 0, sizeof(Proc) * (TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM));

    // 初始化tss
    int tss_size = sizeof(TSS);
    Memset(&tss, 0, tss_size);
    tss.iobase = tss_size;
    tss.ss0 = DS_SELECTOR;
    int ds_phy_addr = Seg2PhyAddr(DS_SELECTOR);
//    int tss_base = VirAddr2PhyAddr(ds_phy_addr, &tss);
	unsigned int tss_base = &tss;
    // int tss_attribute = 0x0c92;		// todo tss的属性怎么确定？
    // 难点。抄的于上神的。
    // 改成0x889也行。
    int tss_attribute = 0x89; // todo tss的属性怎么确定？
    InitDescriptor(&gdt[TSS_SELECTOR_INDEX], tss_base, tss_size - 1, tss_attribute);
	int ldt_index = -1;
    //for (int i = 0; i < TASK_PROC_NUM + USER_PROC_NUM; i++) {
   // for (int i = 0; i < TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM; i++)
//    for (int i = TASK_PROC_NUM; i < TASK_PROC_NUM + USER_PROC_NUM + FORKED_USER_PROC_NUM; i++)
    // gs
    // InitDescriptor(&gdt[7], 0xb8000, 0x0FFFF, 0x0F2);
	unsigned int video_base = 0xc000000 + 0xb8000;
    InitDescriptor(&gdt[7], video_base, 0x0FFFF, 0x0F2);
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
    unsigned int base = (unsigned int)offset;
    gate->offset_below = base & 0xffff;
    gate->selector = 0x8;
    gate->offset_high = base >> 16;
    // 先这样，以后再拆分成TYPE和特权级
    // gate->type_other_attribute = 0x08E;
    gate->type_other_attribute = (privilege << 4) | type;
}

void ReloadGDT()
{
    Memcpy(&gdt,
           (void *)(*((unsigned int *)(&gdt_ptr[2]))),
           *((short *)(&gdt_ptr[0])));
    short *pm_gdt_limit = (short *)(&gdt_ptr[0]);
    unsigned int *pm_gdt_base = (unsigned int *)(&gdt_ptr[2]);

    //*pm_gdt_limit = 128 * sizeof(Descriptor) * 64 - 1;
    *pm_gdt_limit = 128 * sizeof(Descriptor) - 1;
    *pm_gdt_base = (unsigned int)&gdt;

    // 修改idt_ptr
    short *pm_idt_limit = (short *)(&idt_ptr[0]);
    unsigned int *pm_idt_base = (unsigned int *)(&idt_ptr[2]);
    *pm_idt_limit = 256 * sizeof(Gate) - 1;
    *pm_idt_base = (unsigned int)&idt;

    //for(int i = 0; i < 10; i++){
    //	for(int j = 0; j < 160; j++){
    //		disp_str(" ");
    //	}

    //}
    //for(int i = 0; i < 80 * 2 * 5; i++){
    //dis_pos = 0;
    for (int i = 0; i < 80 * 2 * 25; i++)
    {
        //disp_str(" ");
    }
    // 内部中断
    init_internal_interrupt();
    // 外部中断
    init_propt();
    return;
}
