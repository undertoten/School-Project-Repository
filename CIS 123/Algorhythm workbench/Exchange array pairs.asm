.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;@author Christian Clark

.data
	arrayW DWORD 100h, 200h, 300h, 400h
	ASize DWORD LENGTHOF arrayW

.code
main proc
	mov ecx,0
	mov eax,0
L1:
	mov eax,[arrayW + (TYPE arrayW * ecx)]
	xchg [arrayW + ((TYPE arrayW * ecx) + TYPE arrayW)],eax
	mov [arrayW + (TYPE arrayW * ecx)],eax
	add ecx,2
	cmp ecx,ASize
	JL L1

	Invoke ExitProcess,0
main endp
end main