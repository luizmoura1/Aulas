// JavaScript em linha de comando (CLI)
/*
Objetivo:
- Literais, constantes e variáveis de texto
- Função console.log()
*/

const SAUDACAO = "Oi, "
let nome

console.log("\x1b[1mLITERAIS, CONSTANTES E VARIÁVEIS\x1b[0m")

console.log("\n1 - Literal clássico helloword:")
console.log("Oi, mundo!")

console.log("\n2 - Valor std antes da inicialização:")
console.log('nome = ' , nome)
console.log(SAUDACAO , nome) // vírgula -> um espaço

console.log("\n\x1b[3;34;43mAtribuições em design-time\x1b[0m")

nome = "Ana"
console.log("\n3 - Inicialização (1a atribuição):")
console.log('nome = ' , nome)
console.log(SAUDACAO + nome) // + -> justapor, emendar, concatenar

nome = "Beatriz"
console.log("\n4 - Nova atribuição:")
console.log('nome = ' , nome)
console.log(SAUDACAO + nome) // + -> justapor, emendar, concatenar

console.log("\n\x1b[3;34;43mAtribuição em invocation time\x1b[0m")
nome=process.argv[2]
console.log("\n5 - Atribuição em linha de comando:")
process.stdout.write('nome = ' + nome + '\n')
process.stdout.write(SAUDACAO + nome + '\n')

console.log("\n\x1b[3;34;43mAtribuições em runtime\x1b[0m")