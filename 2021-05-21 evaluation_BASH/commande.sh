#!/bin/bash
clear

#transformer TXT en tableau
declare -a myarray
myvar=$( cat MenuEnTxt.txt )
IFS="," read -a myarray <<< $myvar


#le serveur voit le menu 

tput cup 4 1 ; echo "${myarray[0]}"; tput cup 4 4 ; echo "${myarray[1]}" ; tput cup 4 33 ; echo "${myarray[2]}" ; tput cup 4 35 ; echo "€" ;
tput cup 5 1 ; echo "${myarray[3]}"; tput cup 5 4 ; echo "${myarray[4]}" ; tput cup 5 33 ; echo "${myarray[5]}" ; tput cup 5 35 ; echo "€" ;
tput cup 6 1 ; echo "${myarray[6]}"; tput cup 6 4 ; echo "${myarray[7]}" ; tput cup 6 33 ; echo "${myarray[8]}" ; tput cup 6 35 ; echo "€" ;
tput cup 9 1 ; echo "${myarray[9]}"; tput cup 9 4 ; echo "${myarray[10]}" ; tput cup 9 33 ; echo "${myarray[11]}" ; tput cup 9 35 ; echo "€" ;
tput cup 10 1 ; echo "${myarray[12]}"; tput cup 10 4 ; echo "${myarray[13]}" ; tput cup 10 33 ; echo "${myarray[14]}" ; tput cup 10 35 ; echo "€" ;
tput cup 11 1 ; echo "${myarray[15]}"; tput cup 11 4 ; echo "${myarray[16]}" ; tput cup 11 33 ; echo "${myarray[17]}" ; tput cup 11 35 ; echo "€" ;
tput cup 12 1 ; echo "${myarray[18]}"; tput cup 12 4 ; echo "${myarray[19]}" ; tput cup 12 33 ; echo "${myarray[20]}" ; tput cup 12 35 ; echo "€" ;
tput cup 15 1 ; echo "${myarray[21]}"; tput cup 15 4 ; echo "${myarray[22]}" ; tput cup 15 33 ; echo "${myarray[23]}" ; tput cup 15 35 ; echo "€" ;
tput cup 16 1 ; echo "${myarray[24]}"; tput cup 16 4 ; echo "${myarray[25]}" ; tput cup 16 33 ; echo "${myarray[26]}" ; tput cup 16 35 ; echo "€" ;
tput cup 19 1 ; echo "${myarray[27]}"; tput cup 19 4 ; echo "${myarray[28]}" ; tput cup 19 33 ; echo "${myarray[29]}" ; tput cup 19 35 ; echo "€" ;
tput cup 20 1 ; echo "${myarray[30]}"; tput cup 20 4 ; echo "${myarray[31]}" ; tput cup 20 33 ; echo "${myarray[32]}" ; tput cup 20 35 ; echo "€" ;

echo "commande :"
echo "n'entrez que 3 valeurs car je n'ai pas fini la derniere boucle à temps"
#creation d'un tableau plus simple faisant correspondre reference et prix
declare -A CorrespRefPrix
CorrespRefPrix=([1]="${myarray[2]}" [2]="${myarray[5]}" [3]="${myarray[8]}" [4]="${myarray[11]}" 
[5]="${myarray[14]}" [6]="${myarray[17]}" [7]="${myarray[20]}" [8]="${myarray[23]}"
 [9]="${myarray[26]}" [10]="${myarray[29]}" [11]="${myarray[32]}" )


# #le serveur entre le num du plat , plusieurs fois si necessaire pour le meme plat
# toutes les saisies sont stockées dans un tableau facture
declare -a Facture
while : ;
do
        UneRef=0
        echo "numéro ?"
        read UneRef
                if [ "$UneRef" == "t" ]
                then break
                else 
                 Facture+=(${CorrespRefPrix[$UneRef]})
                 echo "Facture en cours (t pour quitter) :" ${Facture[@]}   
                fi    
done


# les différentes valaures se stockent dans Facture[0 , Facture[1]] etc..
# total sans tva = adition des valeurs dans Facture[@]
#ligne en dessous de tester SEULEMENT 3 ELEMENTS je dois trouver un moyen de factoriser
TotalSansTVA=$(((${Facture[0]})+(${Facture[1]})+(${Facture[2]}))) ;

#faire une boucle en utilisant le nombre d'élément ${#Facture[@]}
#EN CORRIGEANT CETTE SYNTHAXE LE SCRIPT DEVRAIT ETRE COMPLET
# z=0
# TotalSansTVA=0
# until $z=${#Facture[@]} ;
# do TotalSansTVA=$(($TotalSansTVA+${Facture[$z])) ;
#     z=$(($z+1))
# done

# # #total avec tva

echo 'total sans tva' $TotalSansTVA

total=$(echo "scale=8; $TotalSansTVA *1.1167" | bc)

echo " L'addition , TVA comprise est de " $total
