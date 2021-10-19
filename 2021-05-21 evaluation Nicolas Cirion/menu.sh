#!/bin/bash
clear
tput clear

### premier essai de cadre exterieur

Largeur=37
#cette fonction trace une ligne pleine avec l'argument et Largeur
# la largeur pourrait se scale avec TPUT COLS
function LignePleine () {
i=0
    until ((i==$Largeur)) ;
    do
    tput cup $1 $i ; 
    echo "#" ;
    i=$(($i+1))
    done
}

Longueur=22
#cette fonction trace une colonne pleine 
#avec l'argument et la longueur 22 qui est la taille max du menu
function ColonnePleine () {
u=0
    until ((u==$Longueur)) ;
    do
    tput cup $u $1 ; 
    echo "#" ;
    u=$(($u+1))
    done
}


#cette fonction trace une ligne en pointille avec tput
#l'argument decidera du num de la ligne
function LignePointille () {
u=1

    until ((u==36)) ;
    
    do
    tput cup $1 $u ; 
    echo "-" ;
    u=$(($u+1))
    done
    
}
#ce 36 devra etre remplacé par Largeur-1 si taille dynamique


#TXT transformé en tableau
declare -a myarray
myvar=$( cat MenuEnTxt.txt )
IFS="," read -a myarray <<< $myvar
#le séparateur choisis est virgule, ce qui rend le txt d'origine peu lisible mais editable 


#Dessin ligne par ligne
LignePleine 0 ;
tput cup 1 10 ; echo "Au Bon GlouMiam" ;
LignePointille 2 ;
tput cup 3 1 ; echo "Entrées" ;
tput cup 4 1 ; echo "${myarray[0]}"; tput cup 4 4 ; echo "${myarray[1]}" ; tput cup 4 33 ; echo "${myarray[2]}" ; tput cup 4 35 ; echo "€" ;
tput cup 5 1 ; echo "${myarray[3]}"; tput cup 5 4 ; echo "${myarray[4]}" ; tput cup 5 33 ; echo "${myarray[5]}" ; tput cup 5 35 ; echo "€" ;
tput cup 6 1 ; echo "${myarray[6]}"; tput cup 6 4 ; echo "${myarray[7]}" ; tput cup 6 33 ; echo "${myarray[8]}" ; tput cup 6 35 ; echo "€" ;
LignePointille 7 ;
tput cup 8 1 ; echo "Plats" ;
tput cup 9 1 ; echo "${myarray[9]}"; tput cup 9 4 ; echo "${myarray[10]}" ; tput cup 9 33 ; echo "${myarray[11]}" ; tput cup 9 35 ; echo "€" ;
tput cup 10 1 ; echo "${myarray[12]}"; tput cup 10 4 ; echo "${myarray[13]}" ; tput cup 10 33 ; echo "${myarray[14]}" ; tput cup 10 35 ; echo "€" ;
tput cup 11 1 ; echo "${myarray[15]}"; tput cup 11 4 ; echo "${myarray[16]}" ; tput cup 11 33 ; echo "${myarray[17]}" ; tput cup 11 35 ; echo "€" ;
tput cup 12 1 ; echo "${myarray[18]}"; tput cup 12 4 ; echo "${myarray[19]}" ; tput cup 12 33 ; echo "${myarray[20]}" ; tput cup 12 35 ; echo "€" ;
LignePointille 13 ;
tput cup 14 1 ; echo "Desserts" ;
tput cup 15 1 ; echo "${myarray[21]}"; tput cup 15 4 ; echo "${myarray[22]}" ; tput cup 15 33 ; echo "${myarray[23]}" ; tput cup 15 35 ; echo "€" ;
tput cup 16 1 ; echo "${myarray[24]}"; tput cup 16 4 ; echo "${myarray[25]}" ; tput cup 16 33 ; echo "${myarray[26]}" ; tput cup 16 35 ; echo "€" ;
LignePointille 17 ;
tput cup 18 1 ; echo "Boissons" ;
tput cup 19 1 ; echo "${myarray[27]}"; tput cup 19 4 ; echo "${myarray[28]}" ; tput cup 19 33 ; echo "${myarray[29]}" ; tput cup 19 35 ; echo "€" ;
tput cup 20 1 ; echo "${myarray[30]}"; tput cup 20 4 ; echo "${myarray[31]}" ; tput cup 20 33 ; echo "${myarray[32]}" ; tput cup 20 35 ; echo "€" ;
LignePleine 22;
ColonnePleine 0 ;
ColonnePleine 36 ;


#mettre le curseur sous le tableau --- la valeur pourra etre remplacé par sizeLongueur+1
tput cup 31 0 ;


