#!/bin/bash

echo "coucou"
echo "Comment tu t'appelles ?"
read prenom

#recuperer ce prenom et dire "Salut prénom"
#on veut répondre "Salut prenom" à tous les prénoms
# sauf si l'utilisateur s'appelle "jo"
#dans ce cas on veut dire "bonjour jo"


echo "Salut $prenom"

if [ $prenom = jo ]
then 
    echo "boujour $prenom"
else
echo "non je sais pas que c'est toi"
bash script.sh
fi

#tant que je n'entre pas le prénom "jo"
#le programme continuera à me redemander "coucou" "comment tu t'appelles ?"
#grâce au rappel de "bash script.sh" avant fi