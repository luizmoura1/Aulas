/*Etapa 1/4: Callbacks nomeadas e declaradas separadamente
* D E S A F I O
*/
let tentativas = 1
const K = Math.floor(Math.random()*9 + 1)
const rdln = require('readline')
const rl = rdln.createInterface({input: process.stdin, output: process.stdout})

function callback2(par2){
    const palpite = Number(par2)
    if(palpite == K){
        console.log(`Acertou em ${tentativas} tentativa(s)! A constante é ${K}.`)
        rl.close()
    }else{
        tentativas++
        rl.question('Quase! Tente de novo: ', callback2)
    }
}

function callback1(par1){
    const n = Number(par1)

    console.log(`\nComparando seu número com uma constante:`)
    console.log(`n == K \t ${n == K}`)
    console.log(`n != K \t ${n != K}`)
    console.log(`n > K  \t ${n > K}`)
    console.log(`n < K  \t ${n < K}`)

    rl.question('\nAdivinhe o valor da constante K (1-9): ', callback2)    
}

rl.question('Digite um número (0-9): ', callback1)
