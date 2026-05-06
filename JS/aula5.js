/*
*/

const GREEN = '\x1b[32m'
const YELLOW = '\x1b[3;34;43m'
const RESET = '\x1b[0m'
const INVERT = '\x1b[7m'

const SAUDACAO = 'Oi, '
let nome

console.log(`${GREEN}LITERAIS, CONSTANTES E VARIÁVEIS${RESET}`)

console.log('\n1 - Literal clássico helloword:')
console.log(`${INVERT}Oi, mundo!${RESET}`)

console.log('\n2 - Valor std da variável antes da inicialização:')
function mostrarNome(){
    console.log('nome = ' , nome)
    console.log(SAUDACAO , nome)
}
mostrarNome()

console.log(`\n${YELLOW}Atribuições em design-time${RESET}`)
nome = 'Ana'
console.log('\n3 - Inicialização (1a atribuição):')
mostrarNome()

nome = 'Beatriz'
console.log('\n4 - Nova atribuição:')
mostrarNome()

console.log(`\n${YELLOW}Atribuição em invocation time${RESET}`)
// const process = require('node:process')  // desnecessário: 'process' já é global em Node.js 
nome=process.argv[2]
console.log('\n5 - Atribuição em linha de comando:')
mostrarNome()

console.log(`\n${YELLOW}Atribuições em runtime${RESET}`)
const rdln = require('readline')
const rl = rdln.createInterface({input: process.stdin, output: process.stdout})
function callback_nomeada(param){
    nome = param
    mostrarNome()
    rl.close()
}
rl.question('Digite um nome: ', callback_nomeada)   // sem () - não executa aqui, apenas passa a função (como referência)
