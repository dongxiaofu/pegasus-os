
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;user page start;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SetupUserPage:
	push ebp
	push ebx
	push esi
	push edi
	push esp

	;清空页目录表
	mov ecx, 4096
	mov eax, UserPageDirectoryTablePhysicalAddress
.ClearPageDirectoryTable:
	mov dword [eax], 0
	add eax, 1
	loop .ClearPageDirectoryTable

	;设置第0个、第768个、第1023个PDE的值
	mov eax, UserPageTablePhysicalAddress
	or eax, PG_P_YES |  PG_RW_RW |  PG_US_SUPER
	mov dword [UserPageDirectoryTablePhysicalAddress + 0x300 * 4], eax
	mov eax, UserPageDirectoryTablePhysicalAddress
	or eax, PG_P_YES |  PG_RW_RW |  PG_US_SUPER
	mov dword [UserPageDirectoryTablePhysicalAddress + 0x3FF * 4], eax

	;设置第一个页表的前256个PTE
	mov ecx, 256
	xor esi, esi
	xor eax, eax
.SetPre256PTE:
	or eax, PG_P_YES |  PG_RW_RW |  PG_US_SUPER
	mov dword [UserPageTablePhysicalAddress + 4 * esi], eax
	add eax, 4096
	inc esi
	loop .SetPre256PTE

	;设置页目录的第769到1022个PDE
	mov ecx, 254
	mov esi, 769
	mov eax, UserPageTablePhysicalAddress + 4096
.SetHigh1GBMemPDE:
	or eax, PG_P_YES |  PG_RW_RW |  PG_US_SUPER
	mov dword [UserPageDirectoryTablePhysicalAddress + 4 * esi], eax
	add eax, 4096
	inc esi
	loop .SetHigh1GBMemPDE

	pop esp
	pop edi
	pop esi
	pop ebx
	pop ebp

	ret

