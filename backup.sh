#!/bin/bash

# cd to main directory
cd /root/apps/minecraft

# Compress the contents of directory ./worlds using zip
FILENAME="worlds"
zip -r $FILENAME.zip ./worlds
# Check if the zip command was successful
if [ $? -eq 0 ]; then
    echo "Compression successful: $FILENAME.zip"
else
    echo "Error compressing worlds directory."
    exit 1
fi

# Move the backup to directory ./backups with current timestamp as filename
timestamp=$(date +"%Y%m%d_%H%M%S")
mv worlds.zip ./backups/worlds_backup_$timestamp.zip

# Check if the move command was successful
if [ $? -eq 0 ]; then
    echo "Backup moved successfully to ./backups/worlds_backup_$timestamp.zip"
else
    echo "Error moving backup."
    exit 1
fi

# Remove the original tar.gz file if it exists
if [ -f ./worlds.zip ]; then
    rm ./worlds.zip
    echo "Removed original worlds.zip file."
else
    echo "Original worlds.zip file does not exist."
fi

# Upload the backup to remove server using FTP
sshpass -p 'r_Xt94fC' scp -P 20135 $FILENAME.zip eslib_backup@192.168.0.4:/backup/minecraft.zip


# Remove all backups that are older than 7 days
find ./backups -type f -name "worlds_backup_*.zip" -mtime +7 -exec rm {} \;

# Check if the find command was successful
if [ $? -eq 0 ]; then
    echo "Old backups removed successfully."
else
    echo "Error removing old backups."
    exit 1
fi


# Print completion message
echo "Backup process completed successfully."