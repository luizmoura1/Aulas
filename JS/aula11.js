/*Etapa 3/4: Callbacks anônimas e aninhadas - a matrioska*/

let n
const K = Math.floor(Math.random()*9 + 1)
const rdln = require('readline')
const rl = rdln.createInterface({input: process.stdin, output: process.stdout})

rl.question('Digite um número: ', function (par1){
    n = Number(par1)

    console.log(`n = ${n}`)
    console.log(`\nComparando seu número com uma constante:`)
    console.log(`n == K \t ${n == K}`)
    console.log(`n != K \t ${n != K}`)
    console.log(`n > K  \t ${n > K}`)
    console.log(`n >= K \t ${n >= K}`)
    console.log(`n < K  \t ${n < K}`)
    console.log(`n <= K \t ${n <= K}`)

    rl.question('\nAdivinhe o valor da constante K (1-9): ', function (par2){
        const palpite = Number(par2)
        palpite == K
            ? (console.log(`Acertou! A constante é ${K}`), rl.close())
            : (console.log('Quase!'), rl.question('Tente de novo: ', function (par3){
                console.log(`${Number(par3) == K ? 'Acertou! ' : 'Quase!'} A constante é ${K}.`)
                rl.close()
            }
            ))
    }
    )    
}
)
