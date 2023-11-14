; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	byteArray BYTE 81h,20h,33h

.code
main proc
	mov esi,0
	shr byteArray[esi],1 ;shifts highest byte
	rcr byteArray[esi+1],1 ;shifts middle byte
	rcr byteArray[esi+2],1 ;shifts lowest byte

	invoke ExitProcess,0
main endp
end main