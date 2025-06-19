#!/bin/bash

# cd to main directory
cd /root/apps/minecraft

# Compress the contents of directory ./worlds with maximum compression
tar -cvzf worlds.tar.gz --use-compress-program=pigz ./worlds

# Check if the tar command was successful
if [ $? -eq 0 ]; then
    echo "Backup created successfully: worlds.tar.gz"
else
    echo "Error creating backup."
    exit 1
fi

# Move the backup to directory ./backups with current timestamp as filename
timestamp=$(date +"%Y%m%d_%H%M%S")
mv worlds.tar.gz ./backups/worlds_backup_$timestamp.tar.gz

# Check if the move command was successful
if [ $? -eq 0 ]; then
    echo "Backup moved successfully to ./backups/worlds_backup_$timestamp.tar.gz"
else
    echo "Error moving backup."
    exit 1
fi

# Remove the original tar.gz file if it exists
if [ -f ./worlds.tar.gz ]; then
    rm ./worlds.tar.gz
    echo "Removed original worlds.tar.gz file."
else
    echo "Original worlds.tar.gz file does not exist."
fi

# Upload the backup to remove server using FTP
sshpass -p 'r_Xt94fC' scp -P 20135 $FILENAME.gz eslib_backup@192.168.0.4:/backup/minecraft.gz


# Remove all backups that are older than 7 days
find ./backups -type f -name "worlds_backup_*.tar.gz" -mtime +7 -exec rm {} \;

# Check if the find command was successful
if [ $? -eq 0 ]; then
    echo "Old backups removed successfully."
else
    echo "Error removing old backups."
    exit 1
fi


# Print completion message
echo "Backup process completed successfully."