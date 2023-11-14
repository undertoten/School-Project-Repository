.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

;@author christian clark

.data
	arrayW WORD 1000h,2000h,3000h,8000h ;array to transfer
	arrayDW DWORD 4 DUP(?) ;array that is being copied to
	count DWORD 0	;count variable
	sizearr DWORD ?	;array size variable

.code
main PROC
	mov ECX,LENGTHOF arrayW ;moving the length of the inital array to to the ecx
	mov sizearr,ecx	;then copying the result to the sizearr variable
L1:	;the beginning of the loop
	mov ebx,count
	movsx eax,[arrayW+(TYPE arrayW * ebx)]	;moving the current value to eax with movsx
	mov [arrayDW+(TYPE arrayDW * ebx)],eax	;moving the result to the 2nd array
	inc count
	mov ebx,count	;using ebx to compare against the size of the array
	cmp ebx,sizearr
	JZ final	;if we reached the max of the array then quit, else continue copying
	jmp L1
final:

	INVOKE ExitProcess, 0
main ENDP
END main