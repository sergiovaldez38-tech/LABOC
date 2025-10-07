%include "../LIB/pc_io.inc"  	; incluir declaraciones de procedimientos externos
								; que se encuentran en la biblioteca libpc_io.a

section	.text
	global _start       		; referencia para inicio de programa
	
_start:
	mov edx, msg        		; edx = dirección de la cadena msg
	call puts					; imprime cadena original

	; Reemplazo usando direccionamiento relativo a registro
	mov ebx, msg        		; ebx = dirección base de msg
	add ebx, 26         		; mover a la posición del carácter '0'
	mov byte [ebx], '@' 		; reemplaza el '0' por '@'

	mov edx, msg        		; mostrar cadena modificada
	call puts

	mov eax, 1					; llamada al sistema para terminar programa
	int 0x80

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0
