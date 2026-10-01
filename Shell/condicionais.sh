#!/usr/bin/env bash
# Programa: Manipulacao de Números - Aula 9  (Bash)
# Ambiente: Lubuntu e/ou Windows WSL:Debian / vscode

K=$((RANDOM % 9 + 1))
readonly K

echo -e "\n========== D E S A F I O ==========================="
read -p "Adivinhe o valor da constante K (1-9): " x
echo "Seu palpite: ${x}"

#####################################################################
# A. EXPRESSÃO CONDICIONAL
# Em Bash o ternário é aritmético; o equivalente para strings é o curto-circuito
# Exemplos 7 e 31 7 e 31 são atribuições por curto-circuito
# Exemplos 8 e 32 entregam o valor como expressão.


#####################################################################
# B. ESTRUTURAS DE CONTROLE
echo -ne "1: if inline \t\t"      
if (( x == K )); then echo "Acertou! Era ${K}."; else echo "Quase! Era ${K}."; fi    

echo -ne "2: if inline + var\t"     # com variável, necessária uma linha a mais
if (( x == K )); then mensagem="Acertou!"; else mensagem="Quase!"; fi    
echo "${mensagem} Era ${K}."

echo -ne "3: Bloco if\t\t"
if (( x == K ))
then
    echo "Acertou! Era ${K}."
else
    echo "Quase! Era ${K}."
fi

echo -ne "4: Bloco if + var\t"  # com variável, necessária uma linha a mais
if (( x == K ))
then
    mensagem="Acertou!"
else
    mensagem="Quase!"
fi
echo "${mensagem} Era ${K}."

# 'if' avalia $? de qualquer mecanismo do Grupo G
# Com (()), 'x != K' e 'x - K' inverteriam then e else

echo -ne "5: Bloco case\t\t"
case $x in
    $K)    echo "Acertou! Era ${K}.";;
    *)  echo "Quase! Era ${K}.";;
esac
## seleção por correspondência de padrões — mecanismo análogo ao match/case do Python
## cf. o aviso sobre 'case K:' sem guarda no script Python (comentário após a forma 12):
## aqui o risco é análogo mas inverso — não é o valor de K sendo "capturado" como nome,
## e sim K podendo conter caracteres de glob (*, ?, [...]) e deixar de ser comparação literal,
## virando correspondência de padrão sem que isso seja óbvio à primeira vista
# não ocorre neste script (K vem de $((RANDOM % 9 + 1)), sempre numérico) — mas o risco reaparece se $x/$K vierem de outra origem (ex.: entrada de usuário livre)

echo -ne "6: Bloco case + var\t"
case $x in
    $K)    mensagem="Acertou!";;            # poderia ser ${K} ?
    *)  mensagem="Quase!";;
esac
echo "${mensagem} Era ${K}."

# 'case' realiza avaliação implícita por correspondência de padrões (globbing) — sem operador relacional explícito


#####################################################################
# C. CURTO-CIRCUITO - a rigor, curto-circuito pertence ao grupo G e também está encapsulado no grupo E (exemplos 19 e 20)
echo -ne "7: Parâmetro\t\t"   # aplicável a qualquer mecanismo do Grupo G
mensagem="Quase!"
test "$x" = "$K" && mensagem="Acertou!"
echo "${mensagem} Era ${K}."
# atribuição preventiva com guarda unilateral: usa apenas '&&' para mutação, sem a ramificação '||'.
# valor padrão → teste → possível redefinição → saída
#mensagem="Quase! Era ${K}."
#test "$x" = "$K" && mensagem="Acertou! Era ${K}."
#echo "$mensagem"
## Similar a python forma 8 (no grupo B, estruturas de controle)

echo -ne "8: Expansão\t\t"    # aplicável a qualquer mecanismo do Grupo G
test "$x" = "$K" && mensagem="Acertou! Era ${K}." || mensagem=
echo "${mensagem:-Quase! Era ${K}.}"
# teste → atribuição condicional (ou limpeza) → expansão com valor-padrão/fallback → saída
# Dualidade de expansão: SE var é definida E não-vazia ENTÃO ${var:+valor}; SENÃO ${var:-valor} (se var é não-definida OU vazia)
# atribuição condicional com valor padrão diferido: delega o tratamento de falha (variável vazia ou não-declarada) à expansão do parâmetro (${var:-padrão}).


#####################################################################
# D. SELEÇÃO INDIRETA                           # array[índice] e hash[chave] nomeados
array=("Acertou!" "Quase!")                     # mapeamento de status

echo -ne "9: Array\t\t"
(( x == K ))
echo "${array[$?]} Era ${K}."
# comparação → status de saída ($?) → índice → seleção → saída
# indexação de array via status de saída ($?) invertido (0 = sucesso/verdadeiro) exige "Acertou!" na posição 0
## mecanismo análogo às formas Python de seleção indireta por índice (cf. forma 16 do Python)
## a comparação não seleciona diretamente a mensagem; seu resultado é convertido em um índice
## diferença: no Bash, o status de saída ($?) mapeia 0 = verdadeiro e 1 = falso;
## em Python, True e False podem atuar diretamente como índices, respectivamente 1 e 0

array=("Quase!" "Acertou!")                     # mapeamento aritmético/booleano (definição para exemplos 10, 11 e 12) 
echo -ne "10: Array + var\t\t"  # via atribuição com let
let "resposta = (x == K)"      # let "resposta =  x == K"  # let resposta=x==K   # let resposta=$(( x == K ))
echo "${array[resposta]} Era ${K}."
# resposta guarda 1 -> imprime array[1] ("Acertou!")
# comparação → atribuição aritmética imperativa → índice em variável → seleção → saída
# o comando let avalia em contexto aritmético padrão (1 = verdadeiro, 0 = falso)

echo -ne "11: Array + exp inline\t"             # indexação via expansão aritmética inline
echo "${array[$(( x == K ))]} Era ${K}."
# $(( )) expande para 1 -> imprime array[1] ("Acertou!")
# comparação → expansão aritmética inline ($(( ))) → índice imediato → seleção → saída
# a expansão substitui o valor booleano aritmético (1/0) diretamente no subscrito do array

echo -ne "12: Array + ter inline\t"             # indexação via ternário
echo "${array[$(( x == K ? 1 : 0 ))]} Era ${K}."
# comparação → ternário → índice → seleção de valor → saída
# indexação de array via resultado do operador ternário ($(( ... ? 1 : 0 )))
## mecanismo análogo às formas Python de seleção indireta por índice:
## a condição não escolhe diretamente a mensagem; produz o índice que determina qual valor será selecionado
## diferença: em Python, True/False podem atuar diretamente como índices 1/0;
## aqui o ternário produz explicitamente 0/1 antes da indexação
#array=("Acertou! Era ${K}." "Quase! Era ${K}.")  # eliminar caso não queira ilustrar a repetição de ' Era ${K}.'!
#echo "${array[$(( x == K ? 0 : 1 ))]}"

declare -A hash=([0]="Acertou!" [1]="Quase!")   # mapeamento de status

echo -ne "13: Hash\t\t"
(( x == K ))
echo "${hash[$?]} Era ${K}."

declare -A hash=([1]="Acertou!" [0]="Quase!")   # mapeamento aritmético/booleano (definição para exemplos 14, 15 e 16)
echo -ne "14: Hash + var\t\t"
let "resposta = (x == K)"     
echo "${hash[$resposta]} Era ${K}."

echo -ne "15: Hash + exp inline\t"
echo "${hash[$(( x == K ))]} Era ${K}."

echo -ne "16: Hash + ter inline\t"
echo "${hash[$(( x == K ? 1 : 0 ))]} Era ${K}."

# Seleção indireta por valor intermediário (propositalmente 11/10 em vez de 1/0), com o case no papel de despachante em vez de um índice
respostas=$(( x == K ? 11 : 10 ))          # ternário nomeado definido para exemplos 17 e 18
echo -ne "17: Case + ter\t\t"
case $respostas in
    11)  echo "Acertou! Era ${K}.";;
    10)  echo "Quase! Era ${K}.";;
esac
## comparação → ternário → seleção de valor → case → execução → saída
## composição de dois mecanismos de seleção: o ternário determina o valor intermediário,
## e o case usa esse valor para selecionar o ramo que será executado
## diferente da forma 21: aqui o ternário seleciona um valor, não uma função
## diferente da forma 11: aqui a seleção final é feita por case, não por indexação de array
## portanto, a mesma comparação pode alimentar mecanismos de seleção diferentes

echo -ne "18: Case + ter + var\t"
case $respostas in
    11) mensagem="Acertou!";;
    10) mensagem="Quase!";;
esac
echo "${mensagem} Era ${K}."


#####################################################################
# E. ENCAPSULAMENTO EM FUNÇÃO - função shell?
echo -ne "19: Função\t\t"
verificar(){  
    ((( ${1:-0} == K )) && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."
    #(( ${1:-0} == K )) && echo "Acertou! Era ${K}." || echo "Quase! Era ${K}."
}
verificar "$x"
# variação da forma 26 dentro de função; demais formas também poderiam ser usadas
# ${1:-0} assume 0 se nulo/vazio, e (( )) avalia como 0 se string não numérica

echo -ne "20: Função testável\t"  #desacoplada, independente, isolada; $1 é palpite, $2 é meta
verificar(){
    ((( ${1:-0} == ${2:-0} )) && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${2}."
    #(( ${1:-0} == ${2:-0} )) && echo "Acertou! Era ${2}." || echo "Quase! Era ${2}."
}
verificar "$x" "$K"
# permite invocar verificar 3 7 isoladamente, sem dependência do ambiente global
## variação recebendo a meta como parâmetro em vez de ler K do escopo global — cf. forma 26 do script Python
## ambas passam por VALOR (não por nome/referência) — simetria direta com fun(palpite, K) do Python; a indireção do Bash (${!2}) fica fora do escopo didático


#####################################################################
# F. SELEÇÃO INDIRETA COM FUNÇÕES
f0(){ echo "Acertou!"; }    #' Era ${K}.'      (definição para exemplos 21 a 24)    
f1(){ echo "Quase!"; }      #' Era ${K}.'

echo -ne "21: lazy + arr + ter\t"      # indexação via ternário
array=(f0 f1)
#            ${array[$(( x == K ? 0 : 1 ))]}
echo     "$( ${array[$(( x == K ? 0 : 1 ))]} ) Era ${K}."
#echo -n "$( ${array[$(( x == K ? 0 : 1 ))]} )           "; echo " Era ${K}."

# comparação → ternário → índice → seleção de função → execução (subshell) → captura/concatenação → saída
## mecanismo análogo às formas Python de seleção indireta de funções:
## a comparação determina o índice, o índice seleciona a função e somente a função selecionada pelo ternário é executada dentro do $( )
## portanto, a seleção ocorre antes da execução — característica de avaliação LAZY
## diferença: no Bash, o array contém nomes de funções, que são expandidos e executados;
## no Python, o array pode conter referências a funções, que depois são chamadas com ()

echo -ne "22: eager + arr + ter\t"
array=("$(f0)" "$(f1)")
echo "${array[$(( x == K ? 0 : 1 ))]} Era ${K}."
# variação eager da forma 21: funções executadas na CONSTRUÇÃO do array (via command substitution $( )), não na indexação
## cf. formas 20/23 do script Python (onde expressões/funções dentro de listas/tuplas são avaliadas eager)
# nota: o stdout de ambas é capturado no array, mas apenas a string da função selecionada é impressa no terminal
# cuidado: side effects externos (ex.: gravar em arquivo, enviar e-mail) ocorrem para AMBAS f0 e f1 ao criar o array —
# na forma 21 (lazy) só a função selecionada roda, então só ela produziria o side effect
# obs.: em nenhuma das duas (21 ou 22) uma alteração de variável do script dentro de f0/f1 persistiria depois —
# ambas rodam dentro de $( ), que sempre abre subshell; isso não é uma diferença entre lazy e eager, é comum às duas

echo -ne "23: lazy + hsh + ter\t"    # chaveamento via ternário
declare -A hash=([0]=f0 [1]=f1)
#            ${hash[$(( x == K ? 0 : 1 ))]}
echo     "$( ${hash[$(( x == K ? 0 : 1 ))]} ) Era ${K}."
#echo -n "$( ${hash[$(( x == K ? 0 : 1 ))]} )           "; echo " Era ${K}."

echo -ne "24: eager + hsh + ter\t"
declare -A hash=([0]="$(f0)" [1]="$(f1)")
echo "${hash[$(( x == K ? 0 : 1 ))]} Era ${K}."


#####################################################################
# G. Mecanismo de comparação (exclusivo Bash) 
echo -ne "25: Comando let\t\t"  # let "x == K"  # let x==K   # let $(( x == K ))
(let "x == K" && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."  
# comparação →  teste do resultado → curto-circuito

echo -ne "26: Avaliação (())\t"
((( x == K )) && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."
#(( x == K )) && echo "Acertou! Era ${K}." || echo "Quase! Era ${K}."
# comparação → teste da comparação → curto-circuito

echo -ne "27: Comando test\t" # origem dos colchetes
(test "$x" = "$K" && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."
#test "$x" = "$K" && echo "Acertou! Era ${K}." || echo "Quase! Era ${K}."

echo -ne "28: Estrito []\t\t" # POSIX test: versão abreviada e mais comum do comando test
([ "$x" = "$K" ] && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."
#[ "$x" = "$K" ] && echo "Acertou! Era ${K}." || echo "Quase! Era ${K}."

echo -ne "29: Extended [[]]\t" # Extended test: não precisa das aspas duplas! # Impressão direta no stdout dentro do subshell (sem variáveis) 
([[ $x == $K ]] && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."
#[[ $x == $K ]] && echo "Acertou! Era ${K}." || echo "Quase! Era ${K}."

echo -ne "30: Comando expr\t"
(expr "$x" = "$K" >/dev/null && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}." 
#expr "$x" = "$K" >/dev/null && echo "Acertou! Era ${K}." || echo "Quase! Era ${K}."
# expr produz um resultado na saída (stdout), mas o curto-circuito usa o status de saída ($?)

# --- Armazenamento em Variável (Exemplos representativos usando [[ ]], aplicável aos demais) --- #
echo -ne "31: [[]] + var\t\t"   # Atribuição imperativa no shell principal
[[ $x == $K ]] && mensagem="Acertou!" || mensagem="Quase!"
echo "${mensagem} Era ${K}."

echo -ne "32: [[]] exp + var\t"   # Atribuição via captura de stdout do subshell
mensagem=$([[ $x == $K ]] && echo "Acertou!" || echo "Quase!")
echo "${mensagem} Era ${K}."

# Nota sobre o uso dos operadores:
# let e (( ))   : Estritamente aritmético.
#                 Interpreta zero à esquerda como octal: não difere '05' e '5', mas difere '010' e '10' (e dispara erro em '08')     
#                 '==' para comparação de números; mas vazio, espaço e letras (exceto variáveis definidas) são convertidos a 0
#                 '=' realiza atribuição (altera o valor). 
#                 '-eq' causa erro de sintaxe.

# test e [ ]    : Estrito/POSIX.
#                 '=' e '==' comparam como texto; diferem '05' e '5'
#                 '-eq' para comparação de números — aceita apenas dígitos literais (mesmo com zero à esquerda, tratados como decimal: '05'→5, '08'→8, sem erro de octal)
#                 diferente de let, (( )) e [[ -eq ]]: NÃO expande nomes de variável nem avalia expressões — 'a', 'x', 'K', '1+4' e vazio dão erro (Ver Obs.2 abaixo) 

# [[ ]]         : Moderno/Extended.
#                 '==' e '=' para comparação de texto e padrões; diferem '05' e '5'
#                 '-eq' para comparação de números; mas letras (exceto variáveis definidas) são convertidas a 0
#                 Interpreta zero à esquerda como octal: não difere '05' e '5', mas difere '010' e '10' (e dispara erro em '08')

# expr          : Utilitário externo.
#               '=' (e '==', extensão GNU) comparam como número se ambos operandos forem inteiros decimais; senão, como texto
#               '-eq' causa erro de sintaxe

# Obs. 1:       espaços internos (em contexto numérico) quebram a sintaxe da expressão (o parser espera um único operando) <- em contexto textual não gera erro!
# Obs. 2:       erro (mensagem no stderr) e falso genuíno (comparação que só dá F) produzem o MESMO status de saída (≠0);
#               o curto-circuito (&&/||) só enxerga esse status, não distingue os dois casos, e sempre cai no ramo False;
#               a única forma de saber se foi erro ou falso de verdade é olhar o stderr