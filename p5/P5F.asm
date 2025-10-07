%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start
	
_start:
	mov edx, msg
	call puts

	; Reemplazar 't' (posición 19) por '%' usando base + índice escalado
	mov ebx, msg
	mov esi, 4                    ; índice base
	; (esi * 4) + 3 = 4*4 + 3 = 19 -> posición de 't'
	mov byte [ebx + esi*4 + 3], '%'

	mov edx, msg
	call puts

	mov eax, 1
	int 0x80

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0
