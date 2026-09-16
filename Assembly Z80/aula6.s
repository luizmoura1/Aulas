; Somar DE com HL e mover o resultado para BC
org 30000               ; 7530
; etapa 1 forma 2  - carga dos dados em DE e HL; immediate addressing
    ld  de, 256*64+128  ; 16512 ; 4080
    ld  hl, 256*128+192 ; 32960 ; 80c0
; etapa 2 forma 1 - a soma de DE e HL   ; register addressing
    add hl, de          ; 49472 ; c140
; etapa 3 forma 1 - carga do resultado em BC e retorno ao BASIC ; register addressing
    ld  b, h
    ld  c, l 
    ret