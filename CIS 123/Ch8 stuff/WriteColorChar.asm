INCLUDE Irvine32.inc

ExitProcess PROTO, dwExitCode:dword

.data
	char BYTE 0
	Prompt BYTE "Enter a Character: ",0

.code
main PROC
	mov edx, OFFSET prompt
	call WriteString
	call ReadChar
	mov char,al
	movZX eax,char
	push eax

	push 4
	push 1

	call WriteColorChar

	INVOKE ExitProcess,0
main ENDP

WriteColorChar PROC
	push ebp
	mov ebp,esp
	push eax
	push ebx
	mov eax,[ebp+12]
	mov ebx,[ebp+8]
	SHL ebx,4
	add eax,ebx
	call SetTextColor
	mov eax,[ebp + 16]
	call WriteChar

	pop ebx
	pop eax
	pop ebp
	ret
WriteColorChar ENDP

END main