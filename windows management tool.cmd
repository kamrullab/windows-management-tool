@echo off
:: Set CMD title bar to "ELITE KAMRUL"
title ELITE KAMRUL - Ultimate All-in-One Windows Management Tool

:: Set CMD window size and buffer
mode con: cols=120 lines=40

:: Ensure the script is run as Administrator
NET SESSION >nul 2>&1
if %errorlevel% NEQ 0 (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit
)

:main
cls
color 2F
set "choice="  :: Clear the previous input to prevent re-execution
echo =============================================================================
echo                                  ELITE KAMRUL   

echo                              Ultimate All-in-One                             
echo                       Windows Management Tool v3.4                          
echo =============================================================================
echo                               Script by: Kamrul Hossain                     
echo                             Facebook: elitekamrul                          
echo =============================================================================
echo 1. Windows User Info Change (netplwiz)         29. Restart Print Spooler Service
echo 2. Activate Windows or Office (Powershell)     30. Disable Unnecessary Services
echo 3. Clean Temporary Files                       31. Enable/Disable Hibernate
echo 4. Check and Repair System Files (SFC)         32. Test RAM for Errors
echo 5. Clear DNS Cache                             33. Reset Task Scheduler
echo 6. Uninstall Unnecessary Apps (PowerShell)     34. Clear Clipboard Data
echo 7. Optimize System Drives (Defragmentation)    35. Enable/Disable Fast Startup
echo 8. Delete Windows Update Cache                 36. Optimize Startup Time
echo 9. Clean Prefetch Files                        37. Enable System Protection
echo 10. Clear Event Logs                           38. Scan Windows for Malware
echo 11. Remove Unused Language Packs               39. Disable Automatic Restart on Failure
echo 12. Reset Windows Update Components            40. Create a New User Account
echo 13. Run Disk Cleanup                           41. Lock/Unlock USB Ports
echo 14. Check Disk for Errors (CHKDSK)             42. Delete Browser Cookies and Cache
echo 15. View Network Configuration                 43. Delete Windows Error Reports
echo 16. Reset Network Settings                     44. Flush ARP Cache
echo 17. Test Network Connection (Ping)             45. Reset All Network Adapters
echo 18. Manage Startup Programs                    46. Export System Information
echo 19. Analyze Disk Space                         47. Monitor System Performance
echo 20. Backup Registry                            48. Restore Windows Default Settings
echo 21. Remove Old Restore Points                  49. Enable/Disable Remote Desktop
echo 22. Boot into Safe Mode                        50. Show Wi-Fi Passwords (Current Network)
echo 23. Rebuild Master Boot Record (MBR)           51. List Installed Updates
echo 24. Format a Drive                             52. Clear RAM Cache
echo 25. Enable or Disable Windows Features         53. Reset Windows Explorer
echo 26. Enable/Disable Windows Firewall            54. View Open Ports
echo 27. View Installed Drivers                     55. Check Installed Frameworks (e.g., .NET)
echo 28. Uninstall Problematic Drivers              56. Check Internet Speed
echo =============================================================================
echo 0. Exit
echo =============================================================================
set /p choice="Enter your choice (1-56/0): "

:: Check if the input is empty
if "%choice%"=="" (
    echo You must enter a number! Please try again.
    pause
    goto main
)

:: Validate choice to ensure it's a number between 1 and 56
for /L %%A in (0,1,56) do (
    if "%choice%"=="%%A" (
        call :command_%choice%
        goto main
    )
)

:: If input is invalid, show error and return to menu
:invalid_choice
cls
echo Invalid choice! Please enter a valid number (1-56 or 0 to exit).
pause
goto main

:: COMMAND IMPLEMENTATIONS BEGIN HERE
:command_1
cls
echo Opening Windows User Info Management Tool...
start netplwiz
pause
goto main

:command_2
cls
echo Activating Windows or Office...
powershell -Command "irm https://massgrave.dev/get | iex"
pause
goto main

:command_3
cls
echo Cleaning Temporary Files: Step 1 (%TEMP%) and Step 2 (C:\Windows\Temp)...
echo.

:: Define both TEMP directories
set TEMP_DIR_USER=%TEMP%
set TEMP_DIR_SYSTEM=C:\Windows\Temp

:: ===========================
:: Step 1: Clean %TEMP% folder
:: ===========================
echo Step 1: Listing all files and folders in %TEMP% directory...
echo.
echo User TEMP Directory: %TEMP_DIR_USER%
dir /b "%TEMP_DIR_USER%"
echo.

if not exist "%TEMP_DIR_USER%\*" (
    echo No files or folders found in %TEMP_DIR_USER%.
) else (
    echo All temporary files and folders in %TEMP% are listed above.
    echo The deletion process will start in 1 second...
    timeout /t 1 >nul

    :: Delete all files in %TEMP%
    echo Deleting files in %TEMP_DIR_USER%...
    del /q "%TEMP_DIR_USER%\*.*" >nul 2>&1

    :: Delete all folders in %TEMP%
    echo Deleting folders in %TEMP_DIR_USER%...
    for /d %%D in ("%TEMP_DIR_USER%\*") do rd /s /q "%%D"
)

echo.
echo All files and folders in %TEMP% have been cleaned successfully!

:: ============================
:: Step 2: Clean C:\Windows\Temp
:: ============================
cls
echo Step 2: Listing all files and folders in C:\Windows\Temp directory...
echo.
echo System TEMP Directory: %TEMP_DIR_SYSTEM%
dir /b "%TEMP_DIR_SYSTEM%"
echo.

if not exist "%TEMP_DIR_SYSTEM%\*" (
    echo No files or folders found in %TEMP_DIR_SYSTEM%.
) else (
    echo All temporary files and folders in C:\Windows\Temp are listed above.
    echo The deletion process will start in 1 second...
    timeout /t 1 >nul

    :: Delete all files in C:\Windows\Temp
    echo Deleting files in %TEMP_DIR_SYSTEM%...
    del /q "%TEMP_DIR_SYSTEM%\*.*" >nul 2>&1

    :: Delete all folders in C:\Windows\Temp
    echo Deleting folders in %TEMP_DIR_SYSTEM%...
    for /d %%D in ("%TEMP_DIR_SYSTEM%\*") do rd /s /q "%%D"
)

echo.
echo All files and folders in C:\Windows\Temp have been cleaned successfully!
echo Returning to the main menu...
timeout /t 3 >nul

goto main


:command_4
cls
echo Checking and Repairing System Files...
sfc /scannow
pause
goto main

:command_5
cls
echo Clearing DNS Cache...
echo.

:: Execute the command to clear DNS cache
ipconfig /flushdns >nul 2>&1

:: Check if the operation was successful
if %errorlevel% EQU 0 (
    echo DNS Cache has been cleared successfully!
) else (
    echo Failed to clear DNS Cache. Please ensure you have administrator privileges.
)

pause
goto main


:command_6
cls
echo Uninstalling Unnecessary Apps...
powershell -Command "Get-AppxPackage | Out-GridView -Title 'Select apps to uninstall' -PassThru | Remove-AppxPackage"
pause
goto main

:command_7
cls
echo Optimizing System Drives (Defragmentation)...
echo.

:: List all drives
for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%D:\ (
        echo Found drive: %%D
        set "DRIVES=!DRIVES! %%D"
    )
)

:: Check if any drives were found
if "%DRIVES%"=="" (
    echo No drives found for optimization.
    pause
    goto main
)

:: Process each drive
for %%D in (%DRIVES%) do (
    echo.
    echo Starting optimization for drive %%D...
    echo.
    :: Start optimization for the drive
    defrag %%D: /O
    echo.
    echo Optimization for drive %%D completed!
)

echo.
echo All drives have been optimized successfully!
pause
goto main


:command_8
cls
echo Deleting Windows Update Cache:(List Cache) and (Delete Cache)...
echo.

:: Define the Windows Update Cache Directory
set UPDATE_CACHE_DIR=C:\Windows\SoftwareDistribution

:: ===========================
:: Step 1: List Update Cache
:: ===========================
echo Listing all files and folders in the Windows Update Cache directory...
echo.
echo Windows Update Cache Directory: %UPDATE_CACHE_DIR%
dir /b "%UPDATE_CACHE_DIR%\Download"
echo.

if not exist "%UPDATE_CACHE_DIR%\Download\*" (
    echo No files or folders found in the Windows Update Cache directory.
    echo Skipping deletion process...
) else (
    echo All files and folders in the Windows Update Cache directory are listed above.
    echo The deletion process will start in 2 seconds...
    timeout /t 2 >nul

    :: ============================
    :: Step 2: Delete Update Cache
    :: ============================
    echo Deleting Windows Update Cache...
    
    :: Stop Windows Update and BITS services
    echo Stopping Windows Update and BITS services...
    net stop wuauserv >nul 2>&1
    net stop bits >nul 2>&1

    :: Delete all files in the Windows Update Cache directory
    echo Deleting files in %UPDATE_CACHE_DIR%\Download...
    del /q "%UPDATE_CACHE_DIR%\Download\*.*" >nul 2>&1

    :: Delete all folders in the Windows Update Cache directory
    echo Deleting folders in %UPDATE_CACHE_DIR%\Download...
    for /d %%D in ("%UPDATE_CACHE_DIR%\Download\*") do rd /s /q "%%D"

    :: Restart Windows Update and BITS services
    echo Restarting Windows Update and BITS services...
    net start wuauserv >nul 2>&1
    net start bits >nul 2>&1

    echo All Windows Update Cache files and folders have been deleted successfully!
)

pause
goto main


:command_9
cls
echo Cleaning Prefetch Files: Listing files, then automatically deleting them...
echo.

:: Define the Prefetch directory
set PREFETCH_DIR=C:\Windows\Prefetch

:: ===========================
:: Step 1: List Prefetch Files
:: ===========================
echo Listing all files and folders in the Prefetch directory...
echo.
echo Prefetch Directory: %PREFETCH_DIR%
dir /b "%PREFETCH_DIR%"
echo.

if not exist "%PREFETCH_DIR%\*" (
    echo No files or folders found in the Prefetch directory.
    echo Skipping deletion process...
) else (
    echo All files and folders in the Prefetch directory are listed above.
    echo The deletion process will start in 1 second...
    timeout /t 1 >nul

    :: ============================
    :: Step 2: Delete Prefetch Files
    :: ============================
    echo Deleting Prefetch Files...
    
    :: Delete all files in the Prefetch directory
    echo Deleting files in %PREFETCH_DIR%...
    del /q "%PREFETCH_DIR%\*.*" >nul 2>&1

    :: Delete all folders in the Prefetch directory (if any exist)
    echo Deleting folders in %PREFETCH_DIR%...
    for /d %%D in ("%PREFETCH_DIR%\*") do rd /s /q "%%D"

    echo All Prefetch files and folders have been cleaned successfully!
)

pause
goto main


:command_10
cls
echo Clearing Event Logs...
wevtutil el | For /F "tokens=*" %%G IN ('wevtutil el') DO wevtutil cl "%%G"
pause
goto main

:command_11
cls
echo Removing Unused Language Packs...
powershell -Command "Get-WinUserLanguageList | ForEach-Object { if ($_.LanguageTag -ne 'en-US') { Uninstall-Language -Language $_.LanguageTag } }"
pause
goto main

:command_12
cls
echo Resetting Windows Update Components...
net stop wuauserv >nul 2>&1
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old >nul 2>&1
net start wuauserv >nul 2>&1
echo Reset successful.
pause
goto main

:command_13
cls
echo Running Disk Cleanup...
cleanmgr
pause
goto main

:command_14
cls
echo Checking Disk for Errors (CHKDSK)...
echo.

:: List all available drives
setlocal enabledelayedexpansion
set "DRIVES="
for %%D in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
    if exist %%D:\ (
        set "DRIVES=!DRIVES! %%D"
    )
)

:: Check if any drives were found
if "%DRIVES%"=="" (
    echo No drives found to check for errors.
    pause
    goto main
)

:: Check each drive for errors
for %%D in (%DRIVES%) do (
    echo ============================================
    echo Starting disk check for drive %%D...
    echo ============================================
    chkdsk %%D: /f
    echo ============================================
    echo Disk check completed for drive %%D!
    echo ============================================
)

echo.
echo All drives have been checked for errors.
pause
goto main


:command_15
cls
echo Viewing Network Configuration...
ipconfig /all
pause
goto main

:command_16
cls
echo Resetting Network Settings...
netsh winsock reset
netsh int ip reset
pause
goto main

:command_17
cls
echo Testing Network Connection (Ping)...
set /p ping_target="Enter the IP address or domain to ping: "
ping %ping_target%
pause
goto main

:command_18
cls
echo Managing Startup Programs...
start shell:startup
pause
goto main

:command_19
cls
echo Analyzing Disk Space...
powershell -Command "Get-PSDrive | Where-Object { $_.Used -gt 0 } | Format-Table -AutoSize"
pause
goto main

:command_20
cls
echo Backing Up Windows Registry...
echo.
echo Default backup location: C:\RegistryBackup.reg
echo You can also specify a custom location.
echo.
set /p backup_path="Enter the full path to save the registry backup (or press Enter to use the default): "
if "%backup_path%"=="" (
    set "backup_path=C:\RegistryBackup.reg"
)
echo Saving registry backup to %backup_path%...
reg export HKLM %backup_path% /y >nul 2>&1
if errorlevel 1 (
    echo Error: Failed to backup the registry. Make sure you have administrative privileges and valid path.
    pause
    goto main
) else (
    echo Registry backup saved successfully at %backup_path%.
    pause
    goto main
)

:command_21
cls
echo Removing Old Restore Points...
echo.
echo Warning: This action will delete all system restore points except the most recent one.
set /p confirm_delete="Do you want to proceed? (Y/N): "
if /i "%confirm_delete%"=="Y" (
    echo Deleting old restore points...
    vssadmin delete shadows /for=c: /all /quiet >nul 2>&1
    if errorlevel 1 (
        echo Error: Failed to delete old restore points. Make sure you have administrative privileges.
        pause
        goto main
    ) else (
        echo Old restore points have been removed successfully.
        pause
        goto main
    )
) else (
    echo Operation cancelled. Returning to main menu...
    pause
    goto main
)


:command_22
cls
echo Boot into Safe Mode...
echo.
echo 1. Enable Safe Mode (Minimal)
echo 2. Enable Safe Mode with Networking
echo 3. Enable Safe Mode with Command Prompt
echo 4. Exit Safe Mode Configuration
echo 0. Return to Main Menu
echo.
set /p safemode_choice="Enter your choice (1-4/0): "

if "%safemode_choice%"=="1" (
    echo Configuring Safe Mode (Minimal)...
    bcdedit /set {current} safeboot minimal >nul 2>&1
    if errorlevel 1 (
        echo Error: Failed to configure Safe Mode (Minimal). Ensure you have administrative privileges.
        pause
        goto main
    )
    echo Safe Mode (Minimal) has been configured. The system will boot into Safe Mode on the next restart.
    set /p reboot_now="Do you want to restart now? (Y/N): "
    if /i "%reboot_now%"=="Y" (
        shutdown /r /t 0
    ) else (
        echo You can restart manually later to enter Safe Mode.
        pause
        goto main
    )
) else if "%safemode_choice%"=="2" (
    echo Configuring Safe Mode with Networking...
    bcdedit /set {current} safeboot network >nul 2>&1
    if errorlevel 1 (
        echo Error: Failed to configure Safe Mode with Networking. Ensure you have administrative privileges.
        pause
        goto main
    )
    echo Safe Mode with Networking has been configured. The system will boot into Safe Mode on the next restart.
    set /p reboot_now="Do you want to restart now? (Y/N): "
    if /i "%reboot_now%"=="Y" (
        shutdown /r /t 0
    ) else (
        echo You can restart manually later to enter Safe Mode.
        pause
        goto main
    )
) else if "%safemode_choice%"=="3" (
    echo Configuring Safe Mode with Command Prompt...
    bcdedit /set {current} safeboot minimal >nul 2>&1
    bcdedit /set {current} safebootalternateshell yes >nul 2>&1
    if errorlevel 1 (
        echo Error: Failed to configure Safe Mode with Command Prompt. Ensure you have administrative privileges.
        pause
        goto main
    )
    echo Safe Mode with Command Prompt has been configured. The system will boot into Safe Mode on the next restart.
    set /p reboot_now="Do you want to restart now? (Y/N): "
    if /i "%reboot_now%"=="Y" (
        shutdown /r /t 0
    ) else (
        echo You can restart manually later to enter Safe Mode.
        pause
        goto main
    )
) else if "%safemode_choice%"=="4" (
    echo Exiting Safe Mode configuration...
    bcdedit /deletevalue {current} safeboot >nul 2>&1
    bcdedit /deletevalue {current} safebootalternateshell >nul 2>&1
    if errorlevel 1 (
        echo Error: Failed to exit Safe Mode configuration. Ensure you have administrative privileges.
        pause
        goto main
    )
    echo Safe Mode configuration has been removed. The system will boot normally on the next restart.
    pause
    goto main
) else if "%safemode_choice%"=="0" (
    echo Returning to the main menu...
    pause
    goto main
) else (
    echo Invalid choice! Returning to main menu...
    pause
    goto main
)



:command_23
cls
echo Rebuilding Master Boot Record (MBR)...
echo Warning: This action can cause data loss if not performed correctly.
echo Make sure you are targeting the correct drive.
echo.
set /p confirm_mbr="Do you want to proceed? (Y/N): "
if /i "%confirm_mbr%"=="Y" (
    echo Starting MBR rebuild process...
    bootrec /fixmbr
    bootrec /fixboot
    bootrec /scanos
    bootrec /rebuildbcd
    echo Master Boot Record (MBR) has been rebuilt successfully.
    pause
    goto main
) else (
    echo Operation cancelled. Returning to main menu...
    pause
    goto main
)


:command_24
cls
echo Formatting a Drive...
echo List of available drives:
wmic logicaldisk get name,description
echo.
set /p drive_letter="Enter the drive letter to format (e.g., D): "
set /p confirm_format="Are you sure you want to format drive %drive_letter%? (Y/N): "
if /i "%confirm_format%"=="Y" (
    echo Formatting drive %drive_letter%...
    format %drive_letter%: /fs:NTFS /q
    if errorlevel 1 (
        echo Error: Failed to format drive %drive_letter%.
        pause
        goto main
    ) else (
        echo Drive %drive_letter% has been formatted successfully.
        pause
        goto main
    )
) else (
    echo Operation cancelled. Returning to main menu...
    pause
    goto main
)



:command_25
cls
echo Enabling or Disabling Windows Features...
echo.
echo List of all Windows features:
dism /online /get-features
echo.
set /p feature_name="Enter the name of the feature to enable/disable: "
echo 1. Enable Feature
echo 2. Disable Feature
echo 0. Return to Main Menu
echo.
set /p feature_action="Enter your choice (1-2/0): "
if "%feature_action%"=="1" (
    echo Enabling feature %feature_name%...
    dism /online /enable-feature /featurename:%feature_name% /all
    echo Feature %feature_name% has been enabled successfully.
    pause
    goto main
) else if "%feature_action%"=="2" (
    echo Disabling feature %feature_name%...
    dism /online /disable-feature /featurename:%feature_name%
    echo Feature %feature_name% has been disabled successfully.
    pause
    goto main
) else if "%feature_action%"=="0" (
    goto main
) else (
    echo Invalid choice! Returning to main menu...
    pause
    goto main
)


:command_26
cls
echo Checking Windows Firewall status...

:: Query the current status of Windows Firewall
netsh advfirewall show allprofiles > temp_firewallstatus.txt 2>nul

:: Check if the query was successful
if errorlevel 1 (
    echo Error: Unable to retrieve Windows Firewall status.
    del temp_firewallstatus.txt >nul 2>&1
    pause
    goto main
)

:: Determine the Firewall status from the output file
set "firewall_status=disabled"
findstr /i "State.*ON" temp_firewallstatus.txt >nul 2>&1 && set "firewall_status=enabled"
findstr /i "State.*OFF" temp_firewallstatus.txt >nul 2>&1 && set "firewall_status=disabled"
del temp_firewallstatus.txt >nul 2>&1

:: Display the current Firewall status
if "%firewall_status%"=="enabled" (
    echo Windows Firewall is currently ENABLED.
) else if "%firewall_status%"=="disabled" (
    echo Windows Firewall is currently DISABLED.
) else (
    echo Unable to determine Windows Firewall status.
    pause
    goto main
)

:: Provide options to enable or disable Firewall
echo.
echo 1. Enable Windows Firewall
echo 2. Disable Windows Firewall
echo 0. Return to Main Menu
echo.
set /p firewall_choice="Enter your choice (1-2/0): "

if "%firewall_choice%"=="1" (
    echo Enabling Windows Firewall...
    netsh advfirewall set allprofiles state on >nul
    echo Windows Firewall has been ENABLED.
    pause
    goto main
) else if "%firewall_choice%"=="2" (
    echo Disabling Windows Firewall...
    netsh advfirewall set allprofiles state off >nul
    echo Windows Firewall has been DISABLED.
    pause
    goto main
) else if "%firewall_choice%"=="0" (
    goto main
) else (
    echo Invalid choice! Returning to main menu...
    pause
    goto main
)

:command_27
cls
echo Viewing Installed Drivers...
driverquery
pause
goto main

:command_28
cls
echo Uninstalling Problematic Drivers...
devmgmt.msc
pause
goto main

:command_29
cls
echo Checking the current status of the Print Spooler Service...
echo.

:: Run PowerShell to check the service status
powershell -NoProfile -Command ^
"try { ^
    $service = Get-Service -Name Spooler -ErrorAction Stop; ^
    Write-Host ''; ^
    Write-Host 'Current State of Print Spooler Service:' -ForegroundColor Yellow; ^
    Write-Host ('Name: ' + $service.DisplayName) -ForegroundColor Cyan; ^
    Write-Host ('Status: ' + $service.Status) -ForegroundColor Cyan ^
} catch { ^
    Write-Host 'Failed to fetch the Print Spooler Service status. Please ensure the service exists.' -ForegroundColor Red; ^
    exit 1 ^
}"

:: Check if PowerShell execution was successful
if %errorlevel% neq 0 (
    echo Error: Could not fetch Print Spooler Service status. Returning to main menu...
    pause
    goto main
)

:: Provide options to the user
echo.
echo 1. Enable the Print Spooler Service
echo 2. Disable the Print Spooler Service
echo 3. Restart the Print Spooler Service
echo 0. Return to Main Menu
echo.
set /p spooler_choice="Enter your choice (0-3): "

if "%spooler_choice%"=="0" goto main
if "%spooler_choice%"=="1" goto enable_spooler
if "%spooler_choice%"=="2" goto disable_spooler
if "%spooler_choice%"=="3" goto restart_spooler

echo Invalid choice! Returning to main menu...
pause
goto main

:enable_spooler
cls
echo Enabling the Print Spooler Service...
powershell -NoProfile -Command ^
"try { ^
    Set-Service -Name Spooler -StartupType Automatic; ^
    Start-Service -Name Spooler; ^
    Write-Host 'Print Spooler Service has been enabled and started.' -ForegroundColor Green ^
} catch { ^
    Write-Host 'Failed to enable the Print Spooler Service. Please check your permissions.' -ForegroundColor Red; ^
    exit 1 ^
}"
if %errorlevel% neq 0 (
    echo Error: Failed to enable the Print Spooler Service. Returning to main menu...
    pause
    goto main
)
echo Print Spooler Service has been enabled and started successfully.
pause
goto main

:disable_spooler
cls
echo Disabling the Print Spooler Service...
powershell -NoProfile -Command ^
"try { ^
    Stop-Service -Name Spooler -Force; ^
    Set-Service -Name Spooler -StartupType Disabled; ^
    Write-Host 'Print Spooler Service has been disabled and stopped.' -ForegroundColor Green ^
} catch { ^
    Write-Host 'Failed to disable the Print Spooler Service. Please check your permissions.' -ForegroundColor Red; ^
    exit 1 ^
}"
if %errorlevel% neq 0 (
    echo Error: Failed to disable the Print Spooler Service. Returning to main menu...
    pause
    goto main
)
echo Print Spooler Service has been disabled and stopped successfully.
pause
goto main

:restart_spooler
cls
echo Restarting the Print Spooler Service...
powershell -NoProfile -Command ^
"try { ^
    Stop-Service -Name Spooler -Force; ^
    Start-Service -Name Spooler; ^
    Write-Host 'Print Spooler Service has been restarted successfully!' -ForegroundColor Green ^
} catch { ^
    Write-Host 'Failed to restart the Print Spooler Service. Please check your permissions.' -ForegroundColor Red; ^
    exit 1 ^
}"
if %errorlevel% neq 0 (
    echo Error: Failed to restart the Print Spooler Service. Returning to main menu...
    pause
    goto main
)
echo Print Spooler Service has been restarted successfully.
pause
goto main



:command_30
cls
echo Disabling Unnecessary Services...
powershell -Command "Get-Service | Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -eq 'Stopped' } | Set-Service -StartupType Disabled"
pause
goto main

:command_31
cls
echo Checking Hibernate status...

:: Check the Hibernate status using PowerCfg and store the result in a temporary file
powershell -Command "(powercfg /query | Select-String 'Hibernation' -Context 0,1).Line" > temp_hibernate.txt 2>nul
findstr /i "Hibernation" temp_hibernate.txt >nul 2>&1
if errorlevel 1 (
    echo Error: Unable to retrieve Hibernate status.
    del temp_hibernate.txt >nul 2>&1
    pause
    goto main
)

:: Determine the Hibernate status based on the file's content
set "hibernate_status=disabled"
findstr /i "Off" temp_hibernate.txt >nul 2>&1 && set "hibernate_status=disabled"
findstr /i "On" temp_hibernate.txt >nul 2>&1 && set "hibernate_status=enabled"
del temp_hibernate.txt >nul 2>&1

:: Display the current Hibernate status
if "%hibernate_status%"=="enabled" (
    echo Hibernate is currently ENABLED.
) else if "%hibernate_status%"=="disabled" (
    echo Hibernate is currently DISABLED.
) else (
    echo Unable to determine Hibernate status.
    pause
    goto main
)

:: Provide option to enable or disable Hibernate
echo.
echo 1. Enable Hibernate
echo 2. Disable Hibernate
echo 0. Return to Main Menu
echo.
set /p hibernate_choice="Enter your choice (1-2/0): "

if "%hibernate_choice%"=="1" (
    echo Enabling Hibernate...
    powershell -Command "powercfg /hibernate on"
    echo Hibernate has been ENABLED.
    pause
    goto main
) else if "%hibernate_choice%"=="2" (
    echo Disabling Hibernate...
    powershell -Command "powercfg /hibernate off"
    echo Hibernate has been DISABLED.
    pause
    goto main
) else if "%hibernate_choice%"=="0" (
    goto main
) else (
    echo Invalid choice! Returning to main menu...
    pause
    goto main
)


:command_32
cls
echo Testing RAM for Errors...
mdsched.exe
pause
goto main

:command_33
cls
echo Resetting Task Scheduler...
schtasks /Change /TN "*\*" /ENABLE
pause
goto main

:command_34
cls
echo Clearing Clipboard Data...
powershell -Command "Set-Clipboard -Value $null"
pause
goto main

:command_35
cls
echo Checking Fast Startup status...
powershell -Command "(Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power').HiberbootEnabled" > temp_faststartup.txt 2>nul
if not exist temp_faststartup.txt (
    echo Error: Unable to retrieve Fast Startup status.
    pause
    del temp_faststartup.txt >nul 2>&1
    goto main
)

set /p fast_startup_status=<temp_faststartup.txt
del temp_faststartup.txt >nul 2>&1

if "%fast_startup_status%"=="1" (
    echo Fast Startup is currently ENABLED.
) else if "%fast_startup_status%"=="0" (
    echo Fast Startup is currently DISABLED.
) else (
    echo Unable to determine Fast Startup status.
    pause
    goto main
)

:: Provide option to enable or disable Fast Startup
echo.
echo 1. Enable Fast Startup
echo 2. Disable Fast Startup
echo 0. Return to Main Menu
echo.
set /p fast_choice="Enter your choice (1-2/0): "

if "%fast_choice%"=="1" (
    echo Enabling Fast Startup...
    powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name 'HiberbootEnabled' -Value 1"
    echo Fast Startup has been ENABLED.
    pause
    goto main
) else if "%fast_choice%"=="2" (
    echo Disabling Fast Startup...
    powershell -Command "Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager\Power' -Name 'HiberbootEnabled' -Value 0"
    echo Fast Startup has been DISABLED.
    pause
    goto main
) else if "%fast_choice%"=="0" (
    goto main
) else (
    echo Invalid choice! Returning to main menu...
    pause
    goto main
)


:command_36
cls
echo Optimizing Startup Time...
powershell -Command "Get-Process | Where-Object { $_.StartTime -ne $null } | Stop-Process -Force"
pause
goto main

:command_37
cls
echo Enabling System Protection...
echo.
echo List of available drives for system protection:
vssadmin list volumes
echo.
set /p drive_letter="Enter the drive letter (e.g., C) to enable system protection: "
echo Enabling system protection on drive %drive_letter%...
powershell -Command "Enable-ComputerRestore -Drive %drive_letter%:\"
if errorlevel 1 (
    echo Error: Failed to enable system protection on drive %drive_letter%.
    pause
    goto main
) else (
    echo System Protection has been enabled successfully on drive %drive_letter%.
    pause
    goto main
)


:command_38
cls
echo Scanning Windows for Malware...
mrt
pause
goto main

:command_39
cls
echo Checking and Configuring Automatic Restart on Failure...
echo.

:: Step 1: Check Current Status
echo Step 1: Checking the current status of Automatic Restart on Failure...
bcdedit | findstr /i "recoveryenabled" >nul
if %errorlevel% EQU 0 (
    for /f "tokens=2 delims==" %%A in ('bcdedit /enum ^| findstr /i "recoveryenabled"') do set recovery_status=%%A
    echo Current Status: Automatic Restart on Failure is set to %recovery_status%.
) else (
    echo Could not determine the current status of Automatic Restart on Failure.
    echo Please ensure you have Administrator privileges.
    pause
    goto main
)

:: Step 2: Provide Options to User
echo.
echo Step 2: Choose an option to configure Automatic Restart on Failure:
echo 1. Disable Automatic Restart on Failure
echo 2. Enable Automatic Restart on Failure
echo 0. Return to Main Menu
set /p choice="Enter your choice (1-2/0): "

if "%choice%"=="1" (
    echo Disabling Automatic Restart on Failure...
    bcdedit /set {current} recoveryenabled No >nul 2>&1
    if %errorlevel% EQU 0 (
        echo Automatic Restart on Failure has been successfully disabled.
    ) else (
        echo Failed to disable Automatic Restart on Failure. Please ensure you have Administrator privileges.
    )
) else if "%choice%"=="2" (
    echo Enabling Automatic Restart on Failure...
    bcdedit /set {current} recoveryenabled Yes >nul 2>&1
    if %errorlevel% EQU 0 (
        echo Automatic Restart on Failure has been successfully enabled.
    ) else (
        echo Failed to enable Automatic Restart on Failure. Please ensure you have Administrator privileges.
    )
) else if "%choice%"=="0" (
    echo Returning to Main Menu...
    pause
    goto main
) else (
    echo Invalid choice! Please enter 1, 2, or 0.
)

pause
goto main


:command_40
cls
echo Creating a New User Account...
set /p username="Enter a username for the new account: "
net user %username% /add
echo User account '%username%' created successfully.
pause
goto main

:command_41
cls
echo Checking USB Port status...

:: Query the registry to check the current USB port status
reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start > temp_usbstatus.txt 2>nul
if errorlevel 1 (
    echo Error: Unable to retrieve USB port status.
    del temp_usbstatus.txt >nul 2>&1
    pause
    goto main
)

:: Determine the USB port status from the registry value
set "usb_status=unlocked"
findstr /r "Start.*4" temp_usbstatus.txt >nul 2>&1 && set "usb_status=locked"
findstr /r "Start.*3" temp_usbstatus.txt >nul 2>&1 && set "usb_status=unlocked"
del temp_usbstatus.txt >nul 2>&1

:: Display the current USB port status
if "%usb_status%"=="locked" (
    echo USB Ports are currently LOCKED.
) else if "%usb_status%"=="unlocked" (
    echo USB Ports are currently UNLOCKED.
) else (
    echo Unable to determine USB port status.
    pause
    goto main
)

:: Provide options to lock or unlock USB ports
echo.
echo 1. Lock USB Ports
echo 2. Unlock USB Ports
echo 0. Return to Main Menu
echo.
set /p usb_choice="Enter your choice (1-2/0): "

if "%usb_choice%"=="1" (
    echo Locking USB Ports...
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 4 /f >nul
    echo USB Ports have been LOCKED.
    pause
    goto main
) else if "%usb_choice%"=="2" (
    echo Unlocking USB Ports...
    reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\USBSTOR" /v Start /t REG_DWORD /d 3 /f >nul
    echo USB Ports have been UNLOCKED.
    pause
    goto main
) else if "%usb_choice%"=="0" (
    goto main
) else (
    echo Invalid choice! Returning to main menu...
    pause
    goto main
)


:command_42
cls
echo Deleting Browser Cookies and Cache...

:: Provide options for browsers
echo 1. Google Chrome
echo 2. Microsoft Edge
echo 3. Mozilla Firefox
echo 4. Internet Explorer
echo 0. Return to Main Menu
echo.
set /p browser_choice="Select the browser to clear cookies and cache (1-4/0): "

if "%browser_choice%"=="1" (
    echo Clearing Google Chrome cookies and cache...
    del /q /s "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1
    del /q /s "%LocalAppData%\Google\Chrome\User Data\Default\Cookies" >nul 2>&1
    echo Google Chrome cookies and cache cleared successfully.
    pause
    goto main
) else if "%browser_choice%"=="2" (
    echo Clearing Microsoft Edge cookies and cache...
    del /q /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1
    del /q /s "%LocalAppData%\Microsoft\Edge\User Data\Default\Cookies" >nul 2>&1
    echo Microsoft Edge cookies and cache cleared successfully.
    pause
    goto main
) else if "%browser_choice%"=="3" (
    echo Clearing Mozilla Firefox cookies and cache...
    del /q /s "%AppData%\Mozilla\Firefox\Profiles\*.default-release\cache2\entries\*" >nul 2>&1
    del /q /s "%AppData%\Mozilla\Firefox\Profiles\*.default-release\cookies.sqlite" >nul 2>&1
    echo Mozilla Firefox cookies and cache cleared successfully.
    pause
    goto main
) else if "%browser_choice%"=="4" (
    echo Clearing Internet Explorer cookies and cache...
    RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
    echo Internet Explorer cookies and cache cleared successfully.
    pause
    goto main
) else if "%browser_choice%"=="0" (
    goto main
) else (
    echo Invalid choice! Returning to main menu...
    pause
    goto main
)


:command_43
cls
echo Cleaning Windows Error Reports: Listing all, then automatically deleting them...
echo.

:: Define the Windows Error Report directories
set WER_DIR1=%ProgramData%\Microsoft\Windows\WER\ReportArchive
set WER_DIR2=%ProgramData%\Microsoft\Windows\WER\ReportQueue

:: =============================
:: Step 1: List Windows Error Reports
:: =============================
echo Listing all files and folders in Windows Error Report directories...
echo.
echo Error Report Directory 1: %WER_DIR1%
if exist "%WER_DIR1%" (
    dir /b "%WER_DIR1%"
) else (
    echo No files or folders found in %WER_DIR1%.
)
echo.
echo Error Report Directory 2: %WER_DIR2%
if exist "%WER_DIR2%" (
    dir /b "%WER_DIR2%"
) else (
    echo No files or folders found in %WER_DIR2%.
)

:: Wait for 1 second before deleting
echo.
echo The deletion process will start in 1 second...
timeout /t 1 >nul

:: =============================
:: Step 2: Delete Windows Error Reports
:: =============================
echo Deleting Windows Error Reports...

:: Delete files and folders from Error Report Directory 1
if exist "%WER_DIR1%" (
    echo Deleting files in %WER_DIR1%...
    del /q "%WER_DIR1%\*.*" >nul 2>&1
    echo Deleting folders in %WER_DIR1%...
    for /d %%D in ("%WER_DIR1%\*") do rd /s /q "%%D"
)

:: Delete files and folders from Error Report Directory 2
if exist "%WER_DIR2%" (
    echo Deleting files in %WER_DIR2%...
    del /q "%WER_DIR2%\*.*" >nul 2>&1
    echo Deleting folders in %WER_DIR2%...
    for /d %%D in ("%WER_DIR2%\*") do rd /s /q "%%D"
)

echo.
echo All Windows Error Reports have been cleaned successfully!
pause
goto main


:command_44
cls
echo Flushing ARP Cache...
arp -d *
pause
goto main

:command_45
cls
echo Resetting All Network Adapters...
netsh interface ip reset
echo All network adapters have been reset.
pause
goto main

:command_46
cls
echo Exporting System Information...
msinfo32 /report C:\SystemInfo.txt
echo System information report saved to C:\SystemInfo.txt
pause
goto main

:command_47
cls
echo Monitoring System Performance...
perfmon.exe
pause
goto main

:command_48
cls
echo Restoring Windows Default Settings...
echo This process may take some time. Please wait...
dism /online /cleanup-image /restorehealth
if errorlevel 1 (
    echo Error: Failed to restore Windows default settings.
    pause
    goto main
) else (
    echo Windows Default Settings have been restored successfully.
    pause
    goto main
)


:command_49
cls
echo Checking Remote Desktop status...
reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections >nul 2>&1
if errorlevel 1 (
    echo Error: Could not retrieve Remote Desktop status.
    pause
    goto main
)

:: Check the current status of Remote Desktop
for /f "tokens=2*" %%A in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections 2^>nul ^| findstr fDenyTSConnections') do set "rdp_status=%%B"
if "%rdp_status%"=="0x1" (
    echo Remote Desktop is currently DISABLED.
) else if "%rdp_status%"=="0x0" (
    echo Remote Desktop is currently ENABLED.
) else (
    echo Unable to determine Remote Desktop status.
    pause
    goto main
)

:: Provide option to enable or disable Remote Desktop
echo.
echo 1. Enable Remote Desktop
echo 2. Disable Remote Desktop
echo 0. Return to Main Menu
echo.
set /p rdp_choice="Enter your choice (1-2/0): "

if "%rdp_choice%"=="1" (
    echo Enabling Remote Desktop...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f >nul
    netsh advfirewall firewall set rule group="remote desktop" new enable=yes >nul
    echo Remote Desktop has been ENABLED.
    pause
    goto main
) else if "%rdp_choice%"=="2" (
    echo Disabling Remote Desktop...
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f >nul
    netsh advfirewall firewall set rule group="remote desktop" new enable=no >nul
    echo Remote Desktop has been DISABLED.
    pause
    goto main
) else if "%rdp_choice%"=="0" (
    goto main
) else (
    echo Invalid choice! Returning to main menu...
    pause
    goto main
)


:command_50
cls
echo Showing Wi-Fi Passwords...
echo.
echo List of available Wi-Fi profiles on your system:
netsh wlan show profiles
echo.
set /p wifi_name="Enter the Wi-Fi profile name to retrieve its password: "
netsh wlan show profile name="%wifi_name%" key=clear | findstr /R "Key Content"
if errorlevel 1 (
    echo Error: Profile "%wifi_name%" is not found on the system or no password is stored.
) else (
    echo Password for "%wifi_name%" displayed above.
)
pause
goto main


:command_51
cls
echo Listing Installed Updates...
wmic qfe list
pause
goto main

:command_53
cls
echo Checking and Resetting Windows Explorer...
echo.

:: Step 1: Check the Current Status of Explorer
echo Step 1: Checking the current status of Windows Explorer...
tasklist | findstr /i "explorer.exe" >nul
if %errorlevel% EQU 0 (
    echo Windows Explorer is currently running.
) else (
    echo Windows Explorer is not running.
)

:: Step 2: List All Running Processes
echo.
echo Step 2: Listing all currently running processes...
echo ============================================
tasklist
echo ============================================
echo.

:: Step 3: Ask User for Reset
echo Do you want to reset (restart) Windows Explorer? (Y/N)
set /p reset_choice="Enter your choice: "

if /i "%reset_choice%"=="Y" (
    echo Restarting Windows Explorer...
    taskkill /f /im explorer.exe >nul 2>&1
    timeout /t 1 >nul
    start explorer.exe
    echo Windows Explorer has been reset successfully!
) else (
    echo Operation cancelled. Returning to the main menu...
)

pause
goto main



:command_53
cls
echo Resetting Windows Explorer...
taskkill /im explorer.exe /f
start explorer.exe
pause
goto main

:command_54
cls
echo Viewing Open Ports...
netstat -aon
pause
goto main

:command_55
cls
echo Checking Installed Frameworks (.NET)...
powershell -Command "(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full').Release"
pause
goto main

:command_56
cls
echo Checking Internet Speed...
powershell -Command "Test-Connection google.com -Count 5"
pause
goto main

:exit_script
cls
echo Exiting the tool. Thank you for using it!
pause
exit

