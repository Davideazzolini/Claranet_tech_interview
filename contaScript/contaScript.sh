#!/bin/sh

# contaScript : passato il percorso della cartella, cerca in essa e nelle eventuali sotto cartelle tutti gli script e conta le occorrenze degli shabang 
# $1 : percorso alla cartella
# 
# Per trovare i file script é possibile eseguire il comando find che restituisce la lista di tutti i file al perocrso passato come parametro.
# Tramite la flag -exec é possibile rielaborare il risultato del comando find; iterando sulla lista usando il comando file con l'uso delle flag:
#  -b : non antepone il nome nell'output
#  --mime : stampa brevissimo testo sulla descrizione del tipo del file 
# é possibile confrontare la descrizione con la stringa regex che impone al tipo di essere uno script eseguibile per via della "x".
# Infatti se si usa: file -bI contaScript.sh
# text/x-shellscript; charset=utf-8
# Leggo da ogni prima riga lo shabang e lo scrivo in occurences.txt (file temporaneo).
# Ordinando in ordine alfabetico il file temporaneo (sort) e contando le occorrenze delle singole shebang si arriva al risultato
#

find "$1" -type f -exec bash -c '
    for entry do
        [[ "$( file -b --mime "$entry" )" != */x-* ]] && continue
        echo "$(head -n 1 "$entry")" >> occurences.txt
    done' bash {} +

sort occurences.txt | uniq -c
rm occurences.txt

