;label  opcode  operand comment
    ORG 30000    ; $7530 0x7530 7530h ; origin ; entry point
    LD  B,42     ; $2A 0x2A 2Ah ; load register, immediate
    LD  C,48     ; $30   
    RET