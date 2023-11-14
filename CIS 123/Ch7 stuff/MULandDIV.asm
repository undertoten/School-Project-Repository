; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	val1 DWORD 0
	val2 DWORD 3000h
	val3 DWORD 2000h
	val4 DWORD 1000h

.code
main proc
	mov eax,val2 
	mov ebx,val3
	mul ebx ;(val2 * val3)
	mov edx,val4
	sub edx,3 ;(val4 - 3)
	mov ebx,edx
	mov edx,0
	div ebx ;((val2 * val3) / (val4 - 3))
	mov val1,eax ;move into final position

	invoke ExitProcess,0
main endp
end main