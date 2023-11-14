.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;@author Christian Clark

.data


.code
main proc
	mov eax,0
	mov al,0
	sub al,-1

	Invoke ExitProcess,0
main endp
end main