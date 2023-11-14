INCLUDE Irvine32.inc
INCLUDE Macros.inc

;mAmpersandTest.asm
;@author Christian Clark
;This program tests the & operator when dealing with macros

mAmpersandTest MACRO name:REQ
	LOCAL string
	.data
	string BYTE "My name is &name.",0
	.code
	mWriteString string
ENDM


.data
	
.code
main PROC
	mAmpersandTest Christian

	exit
main ENDP
END main