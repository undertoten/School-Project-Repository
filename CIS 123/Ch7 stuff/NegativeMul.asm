; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	val1 WORD 0

.code
main proc
	mov ax,-5 ;ax=-5
	mov bx,3 ;bx=3
	mul bx ;ax=-15
	mov val1,ax ;val1=-15

	invoke ExitProcess,0
main endp
end main