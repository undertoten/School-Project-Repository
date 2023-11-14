.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
	val DWORD 11001010011010011001000000001000b

.code
main proc
	mov EAX,val
	mov ebx,eax
	shr ebx,24
	mov ecx,eax
	shl ecx,8
	shr ecx,24
	and bl,cl
	jnp finish
	mov ebx,eax
	shl ebx,16
	shr ebx,24
	and ebx,ecx
	jnp finish
	mov ebx,eax
	mov ecx,eax
	shr bx,8
	shl cx,8
	shr cx,8
	jnp finish

	mov eax,0
finish:
	
	invoke ExitProcess,0
main endp
end main