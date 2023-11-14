.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
array DWORD 1000h,2000h,3000h,4000h
arraySize DWORD LENGTHOF array

.code
main proc
	mov ECX, arraySize;count size
	sub ecx,1
	mov eax,4 ; EAX holds the array index
L1:
	mov edx,array[eax]
	mov array[eax-4],edx
	add eax,4
	loop L1

	invoke ExitProcess,0
main endp
end main