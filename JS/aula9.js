/*Etapa 1/4: Callbacks nomeadase declaradas separadamente
* LITERAIS, CONSTANTES, VARIÁVEIS
* Atribuição em runtime
* Entrada por interação - a resposta recebida no callback do rl.question() é sempre do tipo String
* Number() converte texto em tipo Number (em JS todos os números são de ponto flutuante, sem distinção entre int e float)
* D E S A F I O
* Operações relacionais
* Operador de vírgula (comma operator) para encadear múltiplas instruções no mesmo braço do ternário*/

let n
const K = Math.floor(Math.random()*9 + 1)
const rdln = require('readline')
const rl = rdln.createInterface({input: process.stdin, output: process.stdout})

function callback3(par3){
    console.log(`${Number(par3) == K ? 'Acertou! ' : 'Quase!'} A constante é ${K}.`)
    rl.close()
}

function callback2(par2){
    const palpite = Number(par2)
    palpite == K    // usar '===' seria redundante porque ambos os dados são do tipo Number
        ? (console.log(`Acertou! A constante é ${K}`), rl.close())
        : (console.log('Quase!'), rl.question('Tente de novo: ', callback3))
}

function callback1(par1){
    n = Number(par1)

    console.log(`\nComparando seu número com uma constante:`)
    console.log(`n == K \t ${n == K}`)
    console.log(`n != K \t ${n != K}`)
    console.log(`n > K  \t ${n > K}`)
    console.log(`n >= K \t ${n >= K}`)
    console.log(`n < K  \t ${n < K}`)
    console.log(`n <= K \t ${n <= K}`)

    rl.question('Adivinhe o valor da constante K (1-9): ', callback2)    
}

rl.question('Digite um número: ', callback1)
