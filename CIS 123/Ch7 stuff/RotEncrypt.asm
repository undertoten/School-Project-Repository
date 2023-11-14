;GCDFinder.asm
;Finds the GCD of 2 numbers and stores the result in the EAX

INCLUDE Irvine32.inc

.data
key SBYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
message1 BYTE "HelloWorld",0
message2 BYTE "TestMessage2",0
buffer BYTE 20 dup(0)
keylen byte 0

.code
main PROC
	;message1
	mov keylen, LENGTHOF key
	mov ebx, OFFSET key
	mov esi, OFFSET message1
	mov eax, OFFSET buffer
	mov ecx, lengthof message1
	mov edx,0
	call RotEncrypt
	mov edx, offset buffer
	call WriteString

	call Crlf

	;message2
	mov keylen, lengthof key
	mov ebx, offset key
	mov esi, offset message2
	mov eax, offset buffer
	mov ecx, lengthof message2
	mov edx, 0
	call RotEncrypt
	mov edx, offset buffer
	call WriteString

	exit
main ENDP

RotEncrypt PROC
;takes in ebx as key, esi as the message to be encrypted, ecx is length of messsage
;edx is length of the key
;eax is the returned string

	dec ecx ; to make sure we stop at a 0
start:
	mov dl,BYTE PTR[ebx] ;mov key into register
	test dl, 80h ;compare to negative
	jne negative
	cmp dl,0 ;compare to 0
	JE zero
	
	;positive
	push ebx
	mov ebx,0
	mov bl,[esi] ;move byte into bl to manipulate
L2: ;rotate right
	ror bl,1
	dec dl
	cmp dl,0
	JG L2
	mov [eax],bl ;move into buffer
	pop ebx
	jmp done

negative:
	;call ABS on DL
	push eax
	movsx eax,dl
	call ABS ;gets absolute value of key
	mov edx,eax
	pop eax

	;encrypt byte and move to [eax]
	push ebx
	mov ebx,0
	mov bl,[esi] ;move byte into bl
L1: ;rotate left
	rol bl,1
	dec dl
	cmp dl,0
	JG L1
	mov [eax],bl ;move byte into buffer
	pop ebx
	jmp done

zero: ;if zer0, move byte directly into buffer
	push ebx
	mov bl,[esi]
	mov [eax],bl
	pop ebx

done: ;inc and dec everything needed
	inc eax
	inc ebx
	inc esi
	dec keylen
	dec ecx
	cmp keylen,0
	JG dontreset
	mov keylen,LENGTHOF key
	mov ebx, offset key
dontreset:
	cmp ecx,0
	JG start

	ret
RotEncrypt ENDP

ABS PROC
;takes in a number into the eax and returns the absolute value of that number in the eax
	push ebx
	mov ebx,eax ;abs(X) = (x XOR y) - y EAX holds y
	SAR ebx,31 ;making y
	XOR eax,ebx ;x xor y
	sub eax,ebx ;
	pop ebx

	ret
ABS ENDP

END main