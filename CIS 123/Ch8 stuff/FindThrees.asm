INCLUDE Irvine32.inc

ExitProcess PROTO, dwExitCode:dword
FindThrees PROTO,pArray:PTR BYTE, aSize:DWORD

;@Author: Undertoten

.data
	Data BYTE 3,4,5,6,3,4,1,2,3,3,3,6,7,3,2,1
	Data2 BYTE 6,8,4,3,2,1,6,7,3,8,7,5
	Data3 BYTE 3,3,3,7,45,2,5,7,3,4,6

.code
main PROC
	INVOKE FindThrees,ADDR Data,LENGTHOF Data ;EAX 1
	INVOKE FindThrees,ADDR Data2,LENGTHOF Data2 ;EAX 0
	INVOKE FindThrees,ADDR Data3,LENGTHOF Data3 ;EAX 1
	

	INVOKE ExitProcess,0
main ENDP

FindThrees PROC, pArray:PTR BYTE, aSize:DWORD
	push edx ;push all used registers
	push ebx
	push ecx
	push esi
	mov eax,0 ;initalize registers
	mov ecx,aSize
	mov esi,pArray
	mov ebx,0

L1: ;start of loop
	mov dl,BYTE PTR[esi] ;mov current byte into register
	cmp dl,3 ;compare byte
	JE Found ;jump if found
	mov ebx, 0 ;if not found make count 0 again
	mov eax, 0 ;make eax 0
	inc esi ;go to next byte
	LOOP L1 ;loop back if not finished with array
	jmp Done ;finish

Found: ;if found
	mov eax,1 ;make eax 1
	inc esi ;goto next byte
	inc ebx ;inc cound
	cmp ebx,3 ;compare count to see if we found all 3 threes
	JE Done ;jump if we have
	LOOP L1 ;else loop back to start
	
Done:
	pop esi ;pop all registers
	pop ecx
	pop ebx
	pop edx
	ret
FindThrees ENDP

END main