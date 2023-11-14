INCLUDE Irvine32.inc
PrintDate PROTO,time:PTR SYSTEMTIME

;PrintDate.asm
;@Author Christian Clark
;Prints the current date to the console

RentalInvoice STRUCT
	invoiceNum BYTE 5 DUP(' ')
	dailyPrice WORD ?
	daysRented WORD ?
RentalInvoice ENDS

.data
	sysTime SYSTEMTIME <>
	colon BYTE ":",0
	Slash BYTE "/",0

.code
main PROC
	INVOKE GetLocalTime, addr sysTime
	INVOKE PrintDate, addr sysTime

	exit
main ENDP

PrintDate proc,time:PTR SYSTEMTIME
	push eax
	push edx
	INVOKE GetLocalTime, addr time
	mov edx, OFFSET Slash
	movzx eax,(SYSTEMTIME PTR(time)).wMonth
	call WriteDec
	call WriteString
	movzx eax, (SYSTEMTIME PTR(time)).wDay
	call WriteDec
	call WriteString
	movzx eax, (SYSTEMTIME PTR(time)).wYear
	call WriteDec

	pop edx
	pop eax

	ret
PrintDate endp

END main