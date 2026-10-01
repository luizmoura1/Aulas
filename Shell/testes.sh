#!/usr/bin/env bash
# Programa: Manipulacao de Números - Capitulo 8 (Bash)
# Ambiente: Ubuntu / gedit

K=5
readonly K

echo "========== D E S A F I O ==========================="
read -p "Adivinhe o valor da constante K (1-9): " x
echo "Seu palpite: ${x}"


#####################################################################
echo -e "\nlet, ==" # $?    &&  sucesso=0    ||  falha=1
# let "x == K" ou let x==K ou let $(( x == K ))  ;echo $?
(let "x == K" && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."

#$? retorna 0/sucesso com $(( var )), var, $var e ${var} se var é definida e não é 0 (ou não é conversível a 0)
#$? retorna 0/sucesso com $(( literal )) e literal       se literal          não é 0 (ou não é conversível a 0)

##Ok: token alfanumérico* único, vazio, espaço, múltiplos tokens alfanuméricos* sem espaço
##Não ok: token não alfanumérico* (exceto espaço), múltiplos tokens com espaço
##*dígito ou letra

# == só aceita alfanuméricos (dígitos, letras) sem espaço, vazio e espaço


#####################################################################
echo -e "\n(()), =="
((( x == K )) && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."

##Ok: token alfanumérico* único, vazio, espaço, múltiplos tokens alfanuméricos* sem espaço
##Não ok: token não alfanumérico* (exceto espaço), múltiplos tokens com espaço
# == só aceita alfanuméricos (dígitos, letras) sem espaço, vazio e espaço


#####################################################################
echo -e "\nexpr, ="
(expr "$x" = "$K" >/dev/null && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}." 

echo -e "\nexpr, =="
(expr "$x" == "$K" >/dev/null && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}." 

#totalmente flexível

#####################################################################
echo -e "\ntest, ="
(test "$x" = "$K" && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."

echo -e "\ntest, =="
(test "$x" == "$K" && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."

echo -e "\ntest, -eq"
(test "$x" -eq "$K" && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."
# = e == totalmente flexíveis
# -eq só aceita números sem espaço


#####################################################################
echo -e "\n[], ="
([ "$x" = "$K" ] && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."

echo -e "\n[], =="
([ "$x" == "$K" ] && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."

echo -e "\n[], -eq"
([ "$x" -eq "$K" ] && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."
# = e == totalmente flexíveis
# -eq só aceita números sem espaço

#####################################################################
echo -e "\n[[]], ="
([[ $x = $K ]] && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."

echo -e "\n[[]], =="
([[ $x == $K ]] && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."

echo -e "\n[[]], -eq"
([[ $x -eq $K ]] && echo -n "Acertou!" || echo -n "Quase!") && echo " Era ${K}."
# = e == totalmente flexíveis
# -eq só aceita alfanuméricos (dígitos, letras) sem espaço
 

#####################################################################
echo -e "\ncase"
case $x in
    $K)    echo "Acertou! Era ${K}.";;
    *)  echo "Quase! Era ${K}.";;
esac



#: << 'COMMENT'
#COMMENT