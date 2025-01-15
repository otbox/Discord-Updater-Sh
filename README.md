# Discord-Updater-Sh

**Description:**  
A script for those who prefer to update Discord on Linux without relying on a package manager.  
Discord typically doesn’t make significant changes to its files during updates.  

> **Important:** Occasionally, Discord releases major updates, which may render this script will causes bug, crashs or Discord doesn't properly works. If the script doens't works, and causes problems, use the package manager to update, this will fix the discord, then can use this script normaly for futures discord updates.

---

## How to Use

1. **Edit the script:**  
   Modify the `file` variable in the script to match the path to your Discord app's `build_info.json`.  
   By default, it is set to:  
   ```bash
   file="/opt/discord/resources/build_info.json"
   ```
   to find the discord `build_info_json` file on your system, you can try run:
   ```bash
   sudo find / -type f -name "build_info.json" 2>/dev/null
   ```
 2. **Run Script**
    Set the script permission to execute him, with:
    ```bash
    chmod +x updateDiscord.sh
    ```
    and them, you run the script with:
    ```bash
    sudo ./updateDiscord.sh
    ```
