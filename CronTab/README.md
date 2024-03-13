# cronTab

**The string crontab every Sunday night creates a backup of the /home/user folder and sends it to a remote server**

The solution involves two scripts:
<ul>
    <li><em>crontab.sh</em> schedules the execution of the backup script via the cron string, </Li>
    <li><em>backup.sh</em> generates the compressed archive of the contents of the /home/user path and sends it to the remote host. </li>
</ul>

The chosen cronTab string <code>0 1 * * MON</code>, indicates that every Monday at 1 a.m. the script is executed.

Assuming that the backup save path is **/home**, with *[zip](https://linux.die.net/man/3/zip)* I generate the compressed archive of the folder's contents and using the primitive *[scp](https://man7.org/linux/man-pages/man1/scp.1.html)* it is possible to make a copy on the remote host.

The necessary configuration requires a public-private key pair for the ssh connection, where the connecting host will need to have the **public** one, the remote host (192.168.1.100) the private one.

