# ZABBIX_FULL_BACKUP
FULL ZABBIX DB, WEB, CONFIG and CustomScripts Files in tar.gz format

You will need to set the **db_user**, **db_password** and **db_name** Variables to ensure mysqldump works.

Also is important to verify if the same Web and alerts/external scripts apply to your enviroment, the defaults are:

zabbix_web_dir="/usr/share/zabbix"
zabbix_custom_scripts="/usr/lib/zabbix"


Optional: Upload the backups to a remote server or cloud storage
You can use tools like rsync, scp, or rclone to upload the backups to a remote location.

For example, using rsync:
remote_server="your_remote_server_address"
remote_backup_dir="remote_server_backup_directory"
rsync -avz "$backup_dir/" "user@$remote_server:$remote_backup_dir"

