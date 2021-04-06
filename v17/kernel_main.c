//extern InterruptTest; 
int dis_pos;
typedef void (*int_handle) ();
void disp_str(char *str);
void atoi(char *str, int num);
void disp_int(int num);
void InterruptTest();
unsigned char gdt_ptr[6];
void Memcpy(void *dst, void *src, int size);
void InitInterruptDesc(int vec_no, int_handle offset); 
typedef struct{
	unsigned short seg_limit_below;
	unsigned short seg_base_below;
	unsigned char  seg_base_middle;
	unsigned char seg_attr1;
	unsigned char seg_limit_high_and_attr2;
	unsigned char seg_base_high;
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

void ReloadGDT()
{
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
	for(int i = 0; i < 80 * 2 * 25; i++){
		disp_str(" ");
	}
	dis_pos = 0;

	disp_str("\n=================\n");
	disp_str("Hello, World!\n");
	//disp_int(23);
	disp_int(0x020A);
	disp_str("\n");
	// 向idt中添加中断门 InterruptTest
	 // InitInterruptDesc(1, InterruptTest);	
	 InitInterruptDesc(0x0, InterruptTest);	

	return;
}

void InitInterruptDesc(int vec_no, int_handle offset)
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
	gate->type_other_attribute = 0x08E;
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
	char *str;
	atoi(str, num);
	disp_str(str);
	return;

}
