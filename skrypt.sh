#!/bin/bash



if [ $1 != 2022 ] && [ $1 != 2023 ]; then
	echo 'chuj ci w dupe'
	exit 1
fi

if [ $2 -le -1 ] || [ $3 -le -1 ]; then
	echo 'huj ci w dupe'
	exit 1
fi

rok="$1"

mkdir Powtorzenie
cd Powtorzenie
	mkdir 'Kartki Swiateczne' Pozostale 'Prace Domowe' Zadania
	mkdir 'Kartki Swiateczne'/Kotki 'Kartki Swiateczne'/Pieski
	mkdir Pozostale/'Listy zakupow' Pozostale/Przepisy
	mkdir Pozostale/'Listy zakupow'/'Swieta 2022' Pozostale/'Listy zakupow'/'Swieta 2023'
	touch Pozostale/Przepisy/"Lista zakupow 2022.txt"
	touch Pozostale/Przepisy/"Lista zakupow 2023.txt"
	echo 'świeża mięta
1 kg jabłek
1 kg cytryn
500 g kiszonej kapusty
1 mała główka świeżej kapusty
80 g suszonych, leśnych grzybów
200 g suszonych jabłek, śliwek, gruszek
4 kg ziemniaków
500 g drobnej, białej fasoli
bułka tarta
1 kg cukru
1 l barszczu w kartonie' > Pozostale/Przepisy/"Lista zakupow $rok.txt"
	mv Pozostale/Przepisy/"Lista zakupow 2022.txt" Pozostale/"Listy zakupow"/"Swieta 2022"/"Lista zakupow 2022.txt"
	mv Pozostale/Przepisy/"Lista zakupow 2023.txt" Pozostale/"Listy zakupow"/"Swieta 2023"/"Lista zakupow 2023.txt"

egrep "[1-9]\s[kg]" Pozostale/"Listy zakupow"/"Swieta $rok"/"Lista zakupow $rok.txt" > Pozostale/"Listy zakupow"/"Ciezkie zakupy.txt"

head -n $2 Pozostale/"Listy zakupow"/"Swieta $rok"/"Lista zakupow $rok.txt" > Pozostale/"Listy zakupow"/"Wybrane zakupy.txt"

tail -n $3 Pozostale/"Listy zakupow"/"Swieta $rok"/"Lista zakupow $rok.txt" >> Pozostale/"Listy zakupow"/"Wybrane zakupy.txt"
 
 cd ..
 
 tar -cf "Powtorzenie_data_numer.tar.gz" Powtorzenie 
 
exit 0
