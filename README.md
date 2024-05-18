# Bash Interactive Backup Script

This Bash script provides an interactive way to create backups of directories. It prompts the user to input the source directory and the destination directory for the backup. The script ensures valid directory paths, handles errors, and automatically appends the current date to the backup file name.

## Usage

### Operating System
- This script is designed to run on Unix-like operating systems, such as Linux and macOS.
- It can also run on Windows using a Bash shell environment like Git Bash or WSL (Windows Subsystem for Linux).

### How to Run
1. Clone this repository to your local machine.
2. Navigate to the directory where the script is located.
3. Make the script executable, if necessary:

   ```bash
   chmod +x backup.sh
4. Run the script:

    ```bash
    ./backup.sh
5. Follow the prompts to input the source directory and the destination directory for the backup.

    Example

    ```bash
    $ ./backup.sh
    Insert the Source directory: /path/to/source/directory
    Insert the Backup directory: /path/to/backup/directory

