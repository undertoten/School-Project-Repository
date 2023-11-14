INCLUDE Irvine32.inc
INCLUDE Macros.inc

;mShiftDoublewords.asm
;@author REDACTED
;Makes use of the SHRD algorithm from page 251 in the book but heavily modified to work in both directions
;NOTE: because of how SHLD/SHRD works some bits will be lost in the process
;i tried for hours to figure out a way to make it rotate around but i dont think that is what the instructions wanted
;
;shifts a doubleword array by x number of bits in either direction
;it is modified to fit in a macro
;the macro takes in the name of an array, the direction as a character, and the number of bits


mShiftDoublewords MACRO arrayName:REQ, direction:REQ, numberOfBits:REQ
	LOCAL Right
	LOCAL Left
	LOCAL finish
	LOCAL L1
	mov edx,0
	mov bl,numberOfBits
	mov ecx, (LENGTHOF arrayName) - 1

	mov eax,direction
	cmp eax, 'R'
	mov esi, OFFSET arrayName
	jz Right
	cmp eax, 'L'
	jz Left
	jmp finish

Right:
	push ecx
	mov eax,[esi + TYPE DWORD]
	mov cl,bl
	shrd [esi],eax,cl
	add esi, TYPE DWORD
	pop ecx
	loop Right
	mov cl,bl
	shr DWORD PTR [esi],cl
	jmp finish
	
Left:
	mov esi, (OFFSET arrayName) + (TYPE DWarray * (LENGTHOF arrayName - 1))
L1:
	push ecx
	mov eax,[esi - TYPE DWarray]
	mov cl,bl
	shld [esi],eax,cl
	sub esi, TYPE DWORD
	pop ecx
	loop L1
	mov cl,bl
	shl DWORD PTR[esi],cl
	jmp finish

finish:
ENDM

.data
	DWarray DWORD 1000AF37h,2000DD09h,30000030h,4000ABC9h
	TestArray DWORD 0AAAAAAAAh,0AAAAAAAAh,0AAAAAAAAh,0AAAAAAAAh
	

.code
main PROC

	mov esi, offset DWarray
	mov ecx, LENGTHOF DWarray
	mov ebx, TYPE DWarray
	call DumpMem ;why does this break sometimes?

	mShiftDoublewords DWarray, "R", 2
	mov esi, offset DWarray
	mov ecx, LENGTHOF DWarray
	mov ebx, TYPE DWarray
	call DumpMem

	mShiftDoublewords DWarray, "L", 2
	mov esi, offset DWarray
	mov ecx, LENGTHOF DWarray
	mov ebx, TYPE DWarray
	call DumpMem

	exit
main ENDP
END main