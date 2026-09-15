; Somar DE com HL e mover o resultado para BC
org 30000
; forma 1 etapa 1 - carga dos dados em DE e HL; immediate addressing
    ld  d, 64   ; n1
    ld  e, 128  ; n2
    ld  h, 128  ; n3
    ld  l, 192  ; n4
; forma 1 etapa 2 - a soma de DE e HL   ; register addressing
    add hl, de
; forma 1 etapa 3 - carga do resultado em BC e retorno ao BASIC ; register addressing
    ld  b, h
    ld  c, l 
    ret