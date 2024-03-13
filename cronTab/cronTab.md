# cronTab

**La stringa crontab ogni domenica notte crea un backup della cartella /home/user e lo invia al un server remoto**

La soluzione prevede due script:
<ul>
    <li><em>crontab.sh</em> schedula l'esecuzione dello script di backup tramite la stringa cron </Li>
    <li><em>backup.sh</em> genera l'archivio compresso del contenuto del percorso /home/user e lo invia verso l'host remoto</li>
</ul>

La stringa cronTab scelta <code>0 1 * * SUN</code>, indica che ogni domenica all'una di notte  viene eseguito lo script.

Immaginando che il percorso di salvataggio del backup sia **/home**, con il comando *[zip](https://linux.die.net/man/3/zip)* genero l'archivio compresso del contenuto della cartella e con l'utilizzo della primitiva *[scp](https://man7.org/linux/man-pages/man1/scp.1.html)* é possibile fare una copia sull' host remoto.

La configurazione necessaria richiede una coppia di chiavi pubblica-privata per la connessione ssh, dove l'host che si connette avrà necessità di possedere quella **pubblica**, l'host remoto (192.168.1.100) quella privata.

