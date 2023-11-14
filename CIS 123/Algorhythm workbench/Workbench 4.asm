.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;@author Christian Clark

.data


.code
main proc
	mov al, -127
	add al, -2

	Invoke ExitProcess,0
main endp
end main