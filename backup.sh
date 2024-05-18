#!/bin/bash

# Custom ASCII art banner
echo "*************************************************************************************************************************"
echo "  ____                   _                        ____                  _          _____                 _           _   "
echo " |  _ \                 | |                      |  _ \                | |        / ____|               (_)         | |  "
echo " | |_) |   __ _    ___  | | __  _   _   _ __     | |_) |   __ _   ___  | |__     | (___     ___   _ __   _   _ __   | |_ "
echo " |  _ <   / _\` |  / __| | |/ / | | | | | '_ \    |  _ <   / _\` | / __| | '_ \     \___ \   / __| | '__| | | | '_ \  | __|"
echo " | |_) | | (_| | | (__  |   <  | |_| | | |_) |   | |_) | | (_| | \__ \ | | | |    ____) | | (__  | |    | | | |_) | | |_ "
echo " |____/   \__,_|  \___| |_|\_\  \__,_| | .__/    |____/   \__,_| |___/ |_| |_|   |_____/   \___| |_|    |_| | .__/   \__|"
echo "                                       | |                                                                  | |          "
echo "                                       |_|                                                                  |_|          "
echo ""
echo "*************************************************************************************************************************"
echo "                                                                                                   Created by PASINDULJAY"
echo ""

# Loop until a valid source directory is provided
while true; do
  read -p "Insert the Source directory: " SOURCE_DIR
  
  # Check if the source directory exists
  if [ -z "$SOURCE_DIR" ]; then
    echo "Source directory cannot be empty. Please provide a valid directory."
  elif [ ! -d "$SOURCE_DIR" ]; then
    echo "Source directory '$SOURCE_DIR' does not exist. Please recheck."
  else
    break
  fi
done

# Loop until a valid backup directory is provided
while true; do
  read -p "Insert the Backup directory: " BACKUP_DIR
  
  # Check if the backup directory is empty
  if [ -z "$BACKUP_DIR" ]; then
    echo "Backup directory cannot be empty. Please provide a valid directory."
  else
    # Check if the backup directory exists, create it if it does not
    if [ ! -d "$BACKUP_DIR" ]; then
      echo "Backup directory '$BACKUP_DIR' does not exist. Creating it."
      mkdir -p "$BACKUP_DIR"
      if [ $? -ne 0 ]; then
        echo "Failed to create backup directory '$BACKUP_DIR'."
        exit 1
      fi
    fi
    break
  fi
done

# Get the current date
CURRENT_DATE=$(date +%Y%m%d)

# Create the backup file name
BACKUP_FILE_NAME=$(basename "$SOURCE_DIR")_$CURRENT_DATE.tar.gz

# Create the backup
tar -czf "$BACKUP_DIR/$BACKUP_FILE_NAME" -C "$SOURCE_DIR" .
if [ $? -ne 0 ]; then
  echo "Failed to create backup."
  exit 1
fi

echo "Backup of '$SOURCE_DIR' created successfully at '$BACKUP_DIR/$BACKUP_FILE_NAME'"
exit 0
