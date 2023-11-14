INCLUDE Irvine32.inc

ExitProcess PROTO, dwExitCode:dword
AddThree PROTO, varx:DWORD, vary:DWORD, varz:DWORD

.data
	Prompt1 BYTE "Please Enter Number 1: ",0
	Prompt2 BYTE "Please Enter Number 2: ",0
	Prompt3 BYTE "Please Enter Number 3: ",0
	Output BYTE "The Sum is: ",0
	var1 DWORD 0
	var2 DWORD 0
	var3 DWORD 0
	sum DWORD 0

.code
main PROC
	mov edx,OFFSET prompt1
	call WriteString
	call ReadDec
	mov var1,eax

	mov edx,OFFSET prompt2
	call WriteString
	call ReadDec
	mov var2,eax

	mov edx,OFFSET prompt2
	call WriteString
	call ReadDec
	mov var3,eax

	INVOKE AddThree,var1,var2,var3
	mov sum,eax

	mov edx,OFFSET Output
	call WriteString
	call WriteDec

	INVOKE ExitProcess,0
main ENDP

AddThree PROC,varx:DWORD,vary:DWORD,varz:DWORD
	mov eax,varx
	add eax,vary
	add eax,varz

	ret
AddThree ENDP

END main