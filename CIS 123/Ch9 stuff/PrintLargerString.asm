INCLUDE Irvine32.inc
PrintLargerString PROTO, pstring1:PTR BYTE, pstring2:PTR BYTE

;PrintLargerString.asm
;@author Christian Clark
;Given 2 strings it will print the larger of the 2 using the Str_compare function provided by
;the Irvine library

.data
String1 BYTE "Hello world!",0
String2 BYTE "This is a test string.",0
String3 BYTE "This is another string.",0

.code
main PROC
	invoke PrintLargerString, addr String1, addr String2
	invoke PrintLargerString, addr String2, addr String1
	invoke PrintLargerString, addr String3, addr String2

	exit
main ENDP

PrintLargerString PROC, pstring1:PTR BYTE, pstring2:PTR BYTE
	push edx ;push the edx for later
	invoke Str_compare,pstring1, pstring2 ;compare strings
	JGE L1 ;if first one is larger
	mov edx, pstring2 ;else print 2nd string
	call WriteString 
	jmp L2 ;jump to end

L1:
	mov edx, pstring1 ;if first string is larger
	call WriteString ;print first string

L2:
	pop edx ;pop edx at the end
	call Crlf ;goto next line
	ret ;return back to program
PrintLargerString ENDP

END main