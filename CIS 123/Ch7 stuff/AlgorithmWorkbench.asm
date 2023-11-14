.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	val1 SDWORD 4000h
	val2 SDWORD 4000h
	val3 SDWORD 2000h
	val4 SDWORD 1000h

.code
main proc
	mov eax,val2
	mov ebx,val3
	mov edx,0
	div ebx ;(val2 / val3)
	mov ebx,val1
	mov ecx,val2
	add ebx,ecx ;(val1 + val2)
	mul ebx ;((val2 / val3) * (val1 + val2))
	mov val1,eax ;move into final position

	invoke ExitProcess,0
main endp
end main