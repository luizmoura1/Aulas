const GREEN = '\x1b[32m'
const YELLOW = '\x1b[3;34;43m'
const RESET = '\x1b[0m'
const INVERT = '\x1b[7m'

const K = Math.floor(Math.random()*9 + 1)
let n                                       /* declaração obrigatória; variável numérica; '= 0' evitaria undefined */

console.log(`${GREEN}======LITERAIS, CONSTANTES E VARIÁVEIS=======${RESET}`)

console.log('\n1 - Literal numérico mágico:', `${INVERT}142857${RESET}`)

console.log('\n2 - Valor da variável antes da inicialização:')
function mostrarN(){
    console.log('n = ' , n)
}
mostrarN()

console.log(`\n${YELLOW}==========Atribuições em design-time=========${RESET}`)
n = 3
console.log('\n3 - Inicialização (1a atribuição):')
mostrarN()

n = 5
console.log('\n4 - Nova atribuição:')
mostrarN()

console.log(`\n${YELLOW}==========Atribuição em invocation time======${RESET}`)
// const process = require('node:process')  // desnecessário: 'process' já é global em Node.js 
n=Number(process.argv[2] || 0)                  // || 0 evita undefined
console.log('\n5 - Atribuição em linha de comando:')
mostrarN()

console.log(`\n${YELLOW}==========Atribuições em runtime=============${RESET}`)
const rdln = require('readline')
const rl = rdln.createInterface({input: process.stdin, output: process.stdout})
function callback_runtime(param){
    n = Number(param || 0)
    mostrarN()
    console.log(`\n${YELLOW}==========Operações aritméticas==============${RESET}`)
    console.log('\nn + K = ', n + K)
    console.log('n - K = ', n - K)
    console.log('n * K = ', n * K)
    console.log('n / K = ', n / K)
    console.log('n % K = ', n % K)
    console.log('n ** K = ', n ** K)
    rl.close()
}
rl.question('Digite um número: ', callback_runtime)   // sem () - não executa aqui, apenas passa a função (como referência)
