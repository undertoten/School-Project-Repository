.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;@author Christian Clark

.data
	arrayW DWORD 100h,200h,300h,400h
	ASize DWORD LENGTHOF arrayW

.code
main proc
	mov ecx,ASize
	mov ebx,0
	mov eax,0
L1:
	add eax,[arrayW+(TYPE arrayW * ebx)]
	inc ebx
	cmp ebx,ecx
	JL L1


	Invoke ExitProcess,0
main endp
end main