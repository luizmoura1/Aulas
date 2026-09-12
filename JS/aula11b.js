let n
let tentativas = 1
const K = Math.floor(Math.random()*9 + 1)
const rdln = require('readline')
const rl = rdln.createInterface({input: process.stdin, output: process.stdout})

function adivinhar(par2){
    if(Number(par2) == K){
        console.log(`Acertou em ${tentativas} tentativa(s)!`)
        rl.close()
    }else{
        tentativas++
        rl.question('Quase! Tente de novo: ', adivinhar)
    }
}

rl.question('Digite um número: ', (par1)=>{
    n = Number(par1)

    console.log(`n = ${n}`)
    console.log(`\nComparando seu número com uma constante:`)
    console.log(`n == K \t ${n == K}`)
    console.log(`n != K \t ${n != K}`)
    console.log(`n > K  \t ${n > K}`)
    console.log(`n >= K \t ${n >= K}`)
    console.log(`n < K  \t ${n < K}`)
    console.log(`n <= K \t ${n <= K}`)

    rl.question('\nAdivinhe o valor da constante K (1-9): ', adivinhar)    
})

