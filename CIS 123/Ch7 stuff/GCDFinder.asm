;GCDFinder.asm
;Finds the GCD of 2 numbers and stores the result in the EAX

INCLUDE Irvine32.inc

.data


.code
main PROC
	mov ecx,-10
	mov ebx,5
	call GCDFinder

	mov ecx,20
	mov ebx,10
	call GCDFinder

	mov ebx,100
	mov ecx,10
	call GCDFinder

	mov ebx,30
	mov ecx,5
	call GCDFinder

	mov ebx,15
	mov ecx,2
	call GCDFinder

	exit
main ENDP

GCDFinder proc
;Takes ECX, EBX as 2 integers to find the GCD of
;returns GCD in EAX

	mov eax,ebx ;abs(X) = (x XOR y) - y EAX holds y
	SAR eax,31 ;making y
	mov edx,ebx ;moving y into edx
	XOR edx,eax ;x xor y
	sub edx,eax ;
	mov ebx,edx ;moving abs value back into orginal position

	mov eax,ecx ;abs(X) = (x XOR y) - y EAX holds y
	SAR eax,31 ;making y
	mov edx,ecx ;moving y into edx
	XOR edx,eax ;x xor y
	sub edx,eax ;
	mov ecx,edx ;moving abs value back into orginal position

	mov eax,ebx
	mov ebx,ecx
	mov edx,0 ;initalizng edx
L1:
	div bx ;n = x % y
	mov eax,ebx ;x = y
	mov ebx,edx ;y = n
	mov edx,0 ;clearing edx
	cmp ebx,0 ;comparison
	jg L1
	ret

GCDFinder endp

END main