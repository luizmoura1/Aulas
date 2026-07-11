const GREEN = '\x1b[1;32m'
const YELLOW = '\x1b[1;3;36;43m'
const RESET = '\x1b[0m'
const INVERT = '\x1b[1;7m'

const K = Math.floor(Math.random()*9 + 1)
const DATA = [1, 3, 5, 9, 0]
let i = 0   // índice, subscrito, contador, offset, 'data/read pointer'
let n

console.log(`${GREEN}==== LITERAIS, CONSTANTES, VARIÁVEIS ====${RESET}`)

console.log('\nLiteral numérico mágico:\t', `${INVERT}142857${RESET}`)

console.log('\nValor da variável antes da inicialização')
function mostrarN(){
    console.log(`n = ${n}`)
}
mostrarN()

console.log(`\n${YELLOW}======== Atribuições em design-time =====${RESET}`)
n = 3
console.log('Inicialização direta')
mostrarN()

n = DATA[i++]; n = DATA[i++]; n = DATA[i++] // i=0 n=1 ; i=1 n=3; i=2 n=5 
console.log('\nNova atribuição por READ/DATA')
mostrarN()

console.log(`\n${YELLOW}======== Atribuição em invocation time ==${RESET}`)
n=Number(process.argv[2])
console.log('Entrada por linha de comando')
mostrarN()

console.log(`\n${YELLOW}======== Atribuição em runtime ==========${RESET}`)
console.log('Entrada por interação')
const rdln = require('readline')
const rl = rdln.createInterface({input: process.stdin, output: process.stdout})
function callback_desafio(palpite){
    console.log(`${Number(palpite) === K ? 'Acertou!' : 'Quase!'} Era ${K}`)
    rl.close()
}

function callback_runtime(entrada){
    n = Number(entrada)
    mostrarN()
    console.log(`\n${YELLOW}======== Operações aritméticas ==========${RESET}`)
    console.log(`n + K = ${n + K}`)
    console.log(`n - K = ${n - K}`)
    console.log(`n * K = ${n * K}`)
    console.log(`n / K = ${n / K}`)
    console.log(`n % K = ${n % K}`)
    console.log(`n ** K = ${n ** K}`)

    console.log(`\n${GREEN}======== D E S A F I O ==================${RESET}`)
    rl.question('Adivinhe o valor da constante K (1-9): ', callback_desafio)    
}
rl.question('Digite um número: ', callback_runtime)
