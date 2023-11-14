.386
.model	flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

;This was the first project ive done so i'm just resubmitting this for the ch4 homework
;@author Christian Clark

.data
	num1 DWORD 0
	num2 DWORD 0
	sum DWORD 0
	check DWORD 0

.code
main PROC
	jmp start
add1:	
	mov eax,num1
	add eax,num2 ;adds 2nd number to first number then stores result in EAX
	mov num1,eax
	mov eax,num2
	mov sum,eax
	cmp eax,check	;compares current value to the check value
	jl add2	;if we havent reached the check value yet, go to the next add function
	jmp final
add2:
	mov eax,num2
	add eax,num1	;adds 1st number to 2nd
	mov num2,eax
	mov eax,num1
	mov sum,eax
	cmp eax,check	;compares current value to check
	jl add1	;if we havent reached the check value go to next add function
	jmp final
start:
	mov check,8	;initializing variables
	mov num2,1
	jmp add1	;jumps to the first add function
final:
	INVOKE ExitProcess,0
main ENDP
END main