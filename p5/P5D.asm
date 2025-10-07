%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start
	
_start:
	mov edx, msg
	call puts

	; Reemplazar 'z' (posición 25) por 'Z' usando base + índice
	mov ebx, msg
	mov esi, 25
	mov byte [ebx + esi], 'Z'

	mov edx, msg
	call puts

	mov eax, 1
	int 0x80

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0
