INCLUDE Irvine32.inc
INCLUDE Macros.inc

;mWriteAt.asm
;@author Christian Clark
;A single macro that will, when given a string, append a 0 byte at the end
;then print that string at the given coordinate

mWriteAt MACRO  text:REQ, xCoord:REQ, yCoord:REQ 
	LOCAL string
	.data
	string BYTE text,0

	.code
	mGotoxy xCoord, yCoord
	mWriteString string
ENDM

.data
	

.code
main PROC
	mWriteAt "Hello world!", 2, 3
	mWriteAt "This is the 2nd string", 7,20
	mWriteAt "Another string here!", 10,15
	

	exit
main ENDP
END main