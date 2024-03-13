# ContaScript
**passato il percorso della cartella, cerca in essa e nelle eventuali sotto cartelle tutti gli script e conta le occorrenze degli shabang.**

 Per trovare i file script é possibile lanciare il comando [find](https://man7.org/linux/man-pages/man1/find.1.html) che restituisce la lista di tutti i file al perocrso passato come parametro.
 Tramite la flag *-exec* é possibile rielaborare il risultato della primitiva.

 Iterando sulla lista usando il comando [file](https://man7.org/linux/man-pages/man1/file.1.html) con l'uso delle flag:
 <ul>
  <li><em>-b</em> : non antepone il nome nell'output </li>
  <li><em>--mime</em> : stampa brevissimo testo sulla descrizione del tipo del file </li>
 </ul>
 é possibile confrontare la descrizione con la stringa regex che impone al tipo di essere uno script eseguibile per via della 'x'.

 Se ad esempio si usa il comando:

 <code> file -b --mime contaScript.sh </code>

 Il risultato sarà: **"text/x-shellscript; charset=utf-8"**

 Leggo da ogni prima riga lo shabang e lo scrivo in occurences.txt (file temporaneo).
 Ordinando in ordine alfabetico il file temporaneo (sort) e contando le occorrenze delle singole shebang si arriva al risultato.