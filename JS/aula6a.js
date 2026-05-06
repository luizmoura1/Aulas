/*
JavaScript em linha de comando (CLI)
Objetivos:
- Literais, constantes e variáveis numéricas
- função console.log()
- módulo readline do Node.js
*/

const GREEN = '\x1b[32m'
const YELLOW = '\x1b[3;34;43m'
const RESET = '\x1b[0m'
const INVERT = '\x1b[7m'

const K = Math.floor(Math.random()*9 + 1)       // definição obrigatória; constante numérica, muda a cada execução (1 a 9)
let n = 0                                       /* declaração obrigatória; variável numérica   // = 0 evita undefined */

console.log(`${GREEN}==========LITERAIS, CONSTANTES E VARIÁVEIS==========${RESET}`)

console.log('\n1 - Literal numérico mágico:')
console.log(`${INVERT}142857${RESET}`)

console.log('\n2 - Valor std da variável antes da inicialização:')
function mostrarN(){         // Definição de função (não executa aqui - apenas define)
    console.log('n = ' , n)
    console.log(K + n)
}
mostrarN()

console.log(`\n${YELLOW}==========Atribuições em design-time========${RESET}`)
n = 3
console.log('\n3 - Inicialização (1a atribuição):')
mostrarN()

n = 5
console.log('\n4 - Nova atribuição:')
mostrarN()

console.log(`\n${YELLOW}==========Atribuição em invocation time=====${RESET}`)
// const process = require('node:process')  // desnecessário: 'process' já é global em Node.js 
n=process.argv[2] || 0                  // || 0 evita undefined
console.log('\n5 - Atribuição em linha de comando:')
mostrarN()

console.log(`\n${YELLOW}==========Atribuições em runtime============${RESET}`)
const rdln = require('readline')
const rl = rdln.createInterface({input: process.stdin, output: process.stdout})
function callback_nomeada(param){
    n = param
    mostrarN()
    rl.close()
}
rl.question('Digite um nome: ', callback_nomeada)   // sem () - não executa aqui, apenas passa a função (como referência)
