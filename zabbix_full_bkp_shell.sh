#!/bin/bash
# Provided by IA
# Test in Zabbix 6.0 enviroment


# Backup directory
backup_dir="/opt/zabbix_full_bkp"

# Zabbix database credentials
db_user="root"
db_password="zbx1234ageri"
db_name="zabbix"

# Zabbix installation and configuration paths
zabbix_web_dir="/usr/share/zabbix"
zabbix_custom_scripts="/usr/lib/zabbix"
zabbix_conf_dir="/etc/zabbix"
zabbix_db_dump_file="zabbix_db_backup-$(date +'%Y-%m-%d').sql"
zabbix_conf_backup_file="zabbix_conf_backup.tar.gz"
zabbix_web_files_backup_file="zabbix_web_files_backup.tar.gz"
zabbix_custom_scripts_backup_file="zbx_alert_external_scripts_backup.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Backup Zabbix database
echo "Backing up Zabbix database..."
mysqldump --add-drop-database --verbose --lock-tables --comments --force -u "$db_user" -p"$db_password" "$db_name" > "$backup_dir/$zabbix_db_dump_file"
if [ $? -eq 0 ]; then
    echo "Zabbix database backup created successfully: $zabbix_db_dump_file"
else
    echo "Failed to create Zabbix database backup."
fi

# Backup Zabbix configuration files
echo "Backing up Zabbix configuration files..."
tar -czf "$backup_dir/$zabbix_conf_backup_file" "$zabbix_conf_dir"
if [ $? -eq 0 ]; then
    echo "Zabbix configuration files backup created successfully: $zabbix_conf_backup_file"
else
    echo "Failed to create Zabbix configuration files backup."
fi

# Backup Zabbix website files
echo "Backing up Zabbix website files..."
tar -czf "$backup_dir/$zabbix_web_files_backup_file" "$zabbix_web_dir"
if [ $? -eq 0 ]; then
    echo "Zabbix website files backup created successfully: $zabbix_web_files_backup_file"
else
    echo "Failed to create Zabbix website files backup."
fi

# Backup Zabbix External and AlertScripts
echo "Backing up external and alertscripts..."
tar -czf "$backup_dir/$zabbix_custom_scripts_backup_file" "$zabbix_custom_scripts"
if [ $? -eq 0 ]; then
    echo "Zabbix AlertScrips and ExternalScripts created successfully: $zabbix_custom_scripts_backup_file"
else
    echo "Failed to create AlertScrips and ExternalScripts files backup."
fi 


# Optional: Upload the backups to a remote server or cloud storage

# You can use tools like rsync, scp, or rclone to upload the backups to a remote location.

# For example, using rsync:
# remote_server="your_remote_server_address"
# remote_backup_dir="remote_server_backup_directory"
# rsync -avz "$backup_dir/" "user@$remote_server:$remote_backup_dir"

# Cleanup old backups (Optional)
# You can add a section here to clean up old backups if needed.

# Optional: Notify the administrator about the backup status
# You can add email notifications or log entries to keep track of the backup status.

