#ifndef _PEGASUS_OS_HD_H
#define _PEGASUS_OS_HD_H

// 打开8258A的从片级联
void enable_8259A_casecade_irq();
// 打开8259A的从片硬盘中断
void enable_8259A_slave_winchester_irq();

// 初始硬盘
void init_hd();
// 硬盘驱动
void hd_handle();

#endif
