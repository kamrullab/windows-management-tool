

## Ultimate All-in-One Windows Management Tool 🚀  
**Version v3.4**  

### Description  
The **Ultimate All-in-One Windows Management Tool** is a comprehensive batch script designed to manage, optimize, and troubleshoot Windows systems. With **56 powerful commands**, this tool provides essential features like cleaning temporary files, optimizing drives, managing networks, viewing Wi-Fi passwords, and more — all in one convenient script.

This script is perfect for power users, IT professionals, and anyone who wants to maintain a clean and efficient Windows system.

---

### Features 🛠️  
Here are the main functionalities of the tool:  

1. **System Cleanup**:  
   - Clean temporary files, prefetch files, and Windows Update cache.  
   - Clear DNS cache and event logs.  

2. **Performance Optimization**:  
   - Optimize drives (defragmentation).  
   - Enable/Disable Windows features, firewall, and Fast Startup.  

3. **Network Management**:  
   - Reset network settings, view network configuration, and test network connections.  
   - Retrieve Wi-Fi passwords for saved networks.  

4. **Troubleshooting & Diagnostics**:  
   - Check and repair system files.  
   - Scan for disk errors using CHKDSK.  
   - List installed .NET Framework versions.  

5. **User Management**:  
   - View and edit user information.  
   - Create new user accounts and manage USB ports.  

6. **Advanced Operations**:  
   - Rebuild MBR, boot into Safe Mode, and reset Windows Explorer.  
   - Monitor system performance and reset task scheduler.  

7. **Security Tools**:  
   - Scan for malware and manage system protection.  
   - Disable automatic restarts on failure.  

---

### Commands List 📝  
Here’s a full list of available commands:  

| **No.** | **Functionality**                           | **Command**                                   |  
|---------|-------------------------------------------|---------------------------------------------|  
| 1       | Windows User Info Change                   | `netplwiz`                                   |  
| 2       | Activate Windows or Office                 | `irm https://massgrave.dev/get | iex`       |  
| 3       | Clean Temporary Files                      | Deletes `%TEMP%` and `Temp` directories      |  
| 4       | Check and Repair System Files (SFC)        | `sfc /scannow`                              |  
| 5       | Clear DNS Cache                            | `ipconfig /flushdns`                        |  
| 6       | Uninstall Unnecessary Apps                 | `PowerShell Get-AppxPackage`                |  
| 7       | Optimize System Drives                     | `defrag` for all drives                     |  
| 8       | Delete Windows Update Cache                | Clears SoftwareDistribution folder          |  
| 9       | Clean Prefetch Files                       | Deletes Prefetch files                      |  
| 10      | Clear Event Logs                           | `wevtutil`                                  |  
| 11      | Remove Unused Language Packs               | Removes non-default language packs          |  
| 12      | Reset Windows Update Components            | Resets Windows Update components            |  
| 13      | Run Disk Cleanup                           | Opens Disk Cleanup utility                  |  
| 14      | Check Disk for Errors                      | `chkdsk` for all drives                     |  
| 15      | View Network Configuration                 | `ipconfig /all`                             |  
| 16      | Reset Network Settings                     | `netsh winsock reset`                       |  
| 17      | Test Network Connection                    | Ping a specified IP or domain               |  
| 18      | Manage Startup Programs                    | Opens Startup folder                        |  
| 19      | Analyze Disk Space                         | Displays disk usage for all drives          |  
| 20      | Backup Registry                            | Exports Registry backup to a file           |  
| 21      | Remove Old Restore Points                  | Deletes all old restore points              |  
| 22      | Boot into Safe Mode                        | Reboots to Safe Mode options                |  
| 23      | Rebuild Master Boot Record                 | Fixes boot-related issues                   |  
| 24      | Format a Drive                             | Formats a specified drive                   |  
| 25      | Enable or Disable Windows Features         | `dism /online` features management          |  
| 26      | Enable/Disable Windows Firewall            | Turns Windows Firewall on/off               |  
| 27      | View Installed Drivers                     | Lists all drivers installed                 |  
| 28      | Uninstall Problematic Drivers              | Opens Device Manager                        |  
| 29      | Restart Print Spooler Service              | Restarts and checks Print Spooler status    |  
| 30      | Disable Unnecessary Services               | Disables unused Windows services            |  
| 31      | Enable/Disable Hibernate                   | Enables/disables Hibernate mode             |  
| 32      | Test RAM for Errors                        | Opens Windows Memory Diagnostic Tool        |  
| 33      | Reset Task Scheduler                       | Shows disabled tasks and resets them        |  
| 34      | Clear Clipboard Data                       | Clears current clipboard data               |  
| 35      | Enable/Disable Fast Startup                | Configures Fast Startup mode                |  
| 36      | Optimize Startup Time                      | Disables unnecessary startup tasks          |  
| 37      | Enable System Protection                   | Enables system restore protection           |  
| 38      | Scan Windows for Malware                   | Runs Microsoft Windows Malicious Software Tool |  
| 39      | Disable Automatic Restart on Failure       | Disables auto-restart on system failures    |  
| 40      | Create a New User Account                  | Creates a new local user account            |  
| 41      | Lock/Unlock USB Ports                      | Restricts access to USB ports               |  
| 42      | Delete Browser Cookies and Cache           | Clears browser data                         |  
| 43      | Delete Windows Error Reports               | Deletes stored error logs                   |  
| 44      | Flush ARP Cache                            | Clears ARP cache entries                    |  
| 45      | Reset All Network Adapters                 | Resets network adapters                     |  
| 46      | Export System Information                  | Saves system information to a file          |  
| 47      | Monitor System Performance                 | Opens Performance Monitor                   |  
| 48      | Restore Windows Default Settings           | Resets Windows configurations               |  
| 49      | Enable/Disable Remote Desktop              | Configures Remote Desktop access            |  
| 50      | Show Wi-Fi Passwords                       | Displays saved Wi-Fi passwords              |  
| 51      | List Installed Updates                     | Lists all installed Windows updates         |  
| 52      | Clear RAM Cache                            | Frees up unused RAM                         |  
| 53      | Reset Windows Explorer                     | Restarts Windows Explorer                   |  
| 54      | View Open Ports                            | Shows all open ports on the system          |  
| 55      | Check Installed .NET Frameworks            | Displays installed .NET Framework versions  |  
| 56      | Check Internet Speed                       | Tests current internet connection speed     |  

---

### **Requirements** ✅  
- Windows 7, 8, 10, or 11  
- Administrator privileges  
- PowerShell enabled  

---

### **How to Use** 📋  

1. **Download the Script**:  
   - Clone this repository:  
     ```bash
     git clone https://github.com/elitekamrul/windows-management-tool.git
     cd windows-management-tool
     ```  

2. **Run the Script**:  
   - Right-click on the script and select **Run as Administrator**.  
   - Follow the on-screen prompts to execute any of the 56 commands.  

3. **Example**:  
   - Select `50` to show saved Wi-Fi passwords.  
   - Select `22` to boot into Safe Mode.  

---


2. **Run the Script**:  
   - Right-click on `Windows Management Tool.cmd` and select **Run as Administrator**.  

#### **Option 2: Direct Download**  
If you want to skip cloning and directly download the script:  
![image](https://github.com/user-attachments/assets/9a66633a-2774-4fbe-b599-6ad2374388b0)

- [Download the Windows Management Tool.cmd](https://github.com/kamrullab/windows-management-tool/blob/main/windows%20management%20tool.cmd)  

> After downloading, right-click the file and select **Run as Administrator**.  

---

### Screenshots 📸  
![image](https://github.com/user-attachments/assets/f088bedd-541c-4427-ae4e-1e73c49b63cc)


### **Contributors** 👨‍💻  
- **Kamrul Hossain**  
  - Facebook: [elitekamrul](https://facebook.com/elitekamrul)  
  - GitHub: [elitekamrul](https://github.com/kamrullab)  

---

### **License** 📜  
This project is licensed under the **MIT License**.  

---

### **Disclaimer** ⚠️  
This tool is provided "as is" without any warranty. Use at your own risk.  

