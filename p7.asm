%include "pc_iox.inc"

extern pBin_b
extern pBin_w
extern pBin_dw
extern pHex_b
extern pHex_w
extern pHex_dw
extern clrscr
extern puts
extern putchar

section .data
    msg_a db "A) EAX (Rotación)  : ", 0
    msg_b db "B) CX (Corrimiento): ", 0
    msg_c db "C) ESI (Invertir)  : ", 0
    msg_e db "E) CH (Activar)    : ", 0
    msg_f db "F) BP (Desactivar) : ", 0
    msg_g db "G) BP / 8          : ", 0
    msg_h db "H) EBX / 32        : ", 0
    msg_i db "I) CX * 8          : ", 0
    msg_j db "J) ESI (Pila)      : ", 0
    msg_k db "K) ESI * 10        : ", 0

section .text
    global _start

_start:
    call clrscr

    ; a) Rotación: 0x22446688 -> 0x82244668
    mov eax, 0x22446688
    ror eax, 4
    call puts
    mov al, 10
    call putchar
    call pBin_dw
    mov al, 10
    call putchar

    ; b) Corrimiento: 0x3F48 -> 0xFA40 (Aproximación con SHL)
    mov cx, 0x3F48
    shl cx, 4
    call puts
    mov al, 10
    call putchar
    call pBin_w
    mov al, 10
    call putchar

    ; c) Invertir bits 0, 5, 13, 18, 30 (XOR con 0x40042021)
    mov esi, 0x20D685F3
    xor esi, 0x40042021
    call puts
    mov al, 10
    call putchar
    call pBin_dw
    mov al, 10
    call putchar

    ; d) Guardar ESI en la pila
    push esi

    ; e) Activar bits 3 y 6 en CH (OR con 0x48)
    mov ch, 0xA7
    or ch, 0x48
    call puts
    mov al, 10
    call putchar
    mov al, ch
    call pBin_b
    mov al, 10
    call putchar

    ; f) Desactivar bits 1, 4, 6, 10, 14 en BP (AND con 0xBBAD)
    mov bp, 0x67DA
    and bp, 0xBBAD
    call puts
    mov al, 10
    call putchar
    mov ax, bp
    call pBin_w
    mov al, 10
    call putchar

    ; g) Dividir BP entre 8 (SAR 3)
    sar bp, 3
    call puts
    mov al, 10
    call putchar
    mov ax, bp
    call pBin_w
    mov al, 10
    call putchar

    ; h) Dividir EBX entre 32 (SAR 5)
    mov ebx, 0xAAAAAAAA
    sar ebx, 5
    call puts
    mov al, 10
    call putchar
    mov eax, ebx
    call pBin_dw
    mov al, 10
    call putchar

    ; i) Multiplicar CX por 8 (SHL 3)
    mov cx, 0x3F48
    shl cx, 3
    call puts
    mov al, 10
    call putchar
    call pBin_w
    mov al, 10
    call putchar

    ; j) Sacar valor de la pila a ESI
    pop esi
    call puts
    mov al, 10
    call putchar
    call pBin_dw
    mov al, 10
    call putchar

    ; k) Multiplicar ESI por 10 (ESI * 8 + ESI * 2)
    mov ebx, esi
    shl esi, 3
    shl ebx, 1
    add esi, ebx
    call puts
    mov al, 10
    call putchar
    call pBin_dw
    mov al, 10
    call putchar

    ; Fin del programa
    mov eax, 1
    int 0x80
