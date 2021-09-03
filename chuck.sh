#/bin/bash

recommence=true
declare -a listeDeBlagues

debutPage="<html><head><title>Mes blagues</title></head><body>"
finPage="</body></html>"
baliseH2Ouvrante="<h2>"
baliseH2Fermante="</h2>"


while $recommence
    do

        echo "Tu veux une blague au hasard sur Chuck Norris ?"
        read reponse
        if [ $reponse = oui ] 
            then 
                blague=$(curl -s https://api.chucknorris.io/jokes/random | jq -r '.value')
            

        else

            echo "Tiens, tiens voila la liste des des catégories de listes sur Chuck Norris  ?"

            mesCategories=$(curl -s https://api.chucknorris.io/jokes/categories | jq -r '.[]')
            

            for categorie in ${mesCategories[@]}
            do
                    echo $categorie
            done

            echo "-----------------------------"

            echo "Du coup, Tu veux une blague de quelle catégorie ?"
            read reponseCategorie

            blague=$(curl -s https://api.chucknorris.io/jokes/random?category=$reponseCategorie | jq -r '.value')]

        fi

        echo $blague
        echo "On la garde celle-là ?"
        read reponse
        if [ $reponse = oui ]
            then 
                listeDeBlagues+=("$blague")
        fi



        echo "Encore une ?"
        read encoreUne

        if [ $encoreUne != "oui" ]
            then 
                recommence=false
        fi 

    done

echo "--------------"

echo "Ca te dirait de la voir sur une page web ? oui ? Non ?"

read ouiOuNon

if [ $ouiOuNon = "oui" ]
    then
        pageWeb=""
        pageWeb+=$debutPage

        for blagueChuck in "${listeDeBlagues[@]}"
            do
                blagueHtml=""
                blagueHtml+=$baliseH2Ouvrante
                blagueHtml+="$blagueChuck"
                blagueHtml+=$baliseH2Fermante

                pageWeb+=$blagueHtml

            done

        pageWeb+=$finPage

        echo $pageWeb > index.html
        cp index.html /var/www/html/index.html
fi



echo "Au revoir"



















