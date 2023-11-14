.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:dword

;@author Christian Clark

.data
	val2 WORD 200h
	val4 WORD 400h

.code
main proc
	mov bx,300h
	add bx,val2
	mov ax,bx
	sub ax,val4


	Invoke ExitProcess,0
main endp
end main