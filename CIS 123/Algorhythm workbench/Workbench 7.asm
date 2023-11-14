.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;@author Christian Clark

.data
	var1 DWORD 1000h
	var2 DWORD 2000h
	var3 DWORD 3000h

.code
main proc
	mov ebx,var2
	neg ebx
	add ebx, 7
	sub ebx, var3
	add ebx, var1
	mov eax,ebx


	Invoke ExitProcess,0
main endp
end main