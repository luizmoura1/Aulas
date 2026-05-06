// JavaScript em linha de comando (CLI)
/*
Objetivo:
- Literais, constantes e variáveis de texto
- Função console.log()
*/

const SAUDACAO = "Oi, " // definição obrigatória
let nome                /* declaração obrigatória */

// \x1b[valor1;valor2;...;valorN m
// atributos: 1-negrito, 3-itálico, 4-sublinhado, 7-reverso, 9-riscado
// cores: 0-preto, 1-vermelho, 2-verde, 3-amarelo, 4-azul, 5-magenta, 6-ciano, 7-branco
// cores: 30-37 frente; 40-47 fundo 

console.log("\x1b[3;34;43mAtribuições em design-time\x1b[0m")

console.log("1 - Literal clássico helloword:")
console.log("Oi, mundo!")

console.log("\n2 - Valor std antes da inicialização:")
console.log('nome = ' , nome)
console.log(SAUDACAO , nome) // vírgula -> um espaço

nome = "Ana"
console.log("\n3 - Inicialização (1a atribuição):")
console.log('nome = ' , nome)
console.log(SAUDACAO + nome) // + -> justapor, emendar, concatenar

nome = "Beatriz"
console.log("\n4 - Nova atribuição:")
console.log('nome = ' , nome)
console.log(SAUDACAO + nome) // + -> justapor, emendar, concatenar

//console.log("Atribuições em runtime")




