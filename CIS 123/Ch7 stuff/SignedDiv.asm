;modified code from page 264 in the book

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	wordVal SWORD -276 ; FEECh
	val1 SWORD 0

.code
main proc
	mov eax,0 ; EAX = 00000000h
	mov ax,wordVal ; EAX = 0000FEECh (+155)
	cwd ; EAX = 0000FEECh (-101) DX=FFFFh
	mov bx,10 ; EBX is the divisor
	idiv bx ; divide EAX by BX
	mov val1, ax

	invoke ExitProcess,0
main endp
end main