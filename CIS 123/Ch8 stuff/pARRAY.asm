INCLUDE Irvine32.inc

ExitProcess PROTO, dwExitCode:dword
MyProc PROTO, LocalVar1:PTR DWORD

.data
Array DWORD 1000h,2000h,3000h

.code
main PROC
	INVOKE MyProc,ADDR Array

	INVOKE ExitProcess,0
main ENDP

ArrayPTR EQU DWORD PTR[ebp-4]

MyProc PROC, Var1:PTR DWORD
	PUSHAD
	mov eax,Var1
	mov ArrayPTR,eax
	mov esi,ArrayPTR
	mov ecx,lengthof Array
	mov ebx,Type Array
	call DumpMem

	POPAD
	ret 4
MyProc ENDP

END main