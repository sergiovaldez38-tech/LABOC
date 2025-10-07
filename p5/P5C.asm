%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimiento externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       ; referencia para inicio de programa
	
_start:
	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime cadena original

	; Reemplazar el número 0 (posición 26) por el símbolo @
	mov ebx, msg        ; base de la cadena
	add ebx, 26         ; desplazamiento relativo a registro
	mov byte [ebx], '@' ; reemplazo

	mov edx, msg		; mostrar la cadena modificada
	call puts

	mov eax, 1			; fin del programa
	int 0x80

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0


