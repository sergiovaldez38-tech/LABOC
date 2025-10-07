%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start
	
_start:
	mov edx, msg
	call puts

	; Reemplazar 'z' (posición 25) por 'Z' usando base + índice + desplazamiento
	mov ebx, msg
	mov esi, 24              ; apunta a la 'y'
	mov byte [ebx + esi + 1], 'Z' ; +1 para llegar a la 'z'

	mov edx, msg
	call puts

	mov eax, 1
	int 0x80

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0
