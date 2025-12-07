<!-- :: Batch section
@echo off
setlocal
set "version=2.0 (Corrected)"
TITLE AUTO TUNE by RpJect - %version%

::================================================================================
:: This Software is created By RpJect
:: https://github.com/RpJect/Auto-Tune
::
:: This script has been audited and corrected for security and stability.
:: Original functionality has been preserved while fixing critical bugs.
::================================================================================

:: Set a dedicated, secure temporary directory for this script's operations.
set "workDir=%TEMP%\AutoTune"

:: --- Admin Check ---
net.exe session >NUL 2>&1 || goto :not_admin

REM ============================================
REM AUTO-UPDATE SECTION
REM ============================================
ECHO.
ECHO Checking for updates...
ECHO.

set "filePath=%~f0"
set "tempFile=%TEMP%\AutoTuneUpdate.bat"
set "updateURL=https://raw.githubusercontent.com/RamyGalal57/Auto-Tune/refs/heads/fix/comprehensive-script-audit/AutoTuneOnline.bat"

REM Check internet connectivity first
ping -n 1 github.com >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO No internet connection. Skipping update check.
    goto :skip_update
)

REM Download update to temp location
curl --connect-timeout 30 --max-time 300 -o "%tempFile%" -0 -# "%updateURL%"

IF %ERRORLEVEL% NEQ 0 (
    ECHO Update download failed. Continuing with current version.
    if exist "%tempFile%" del "%tempFile%" >NUL 2>&1
    goto :skip_update
)

REM Validate downloaded file is not empty
FOR %%A IN ("%tempFile%") DO (
    IF %%~zA LSS 1000 (
        ECHO Downloaded file appears invalid. Skipping update.
        del "%tempFile%" >NUL 2>&1
        goto :skip_update
    )
)

REM Validate downloaded file contains expected content
FINDSTR /C:"AUTO TUNE" "%tempFile%" >NUL 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO Downloaded file validation failed. Skipping update.
    del "%tempFile%" >NUL 2>&1
    goto :skip_update
)

REM Apply update
ECHO Update validated. Applying...
copy /Y "%tempFile%" "%filePath%" >NUL 2>&1
IF %ERRORLEVEL% EQU 0 (
    ECHO Update applied successfully!
    del "%tempFile%" >NUL 2>&1
    ECHO Restarting with new version...
    timeout /t 2 /nobreak >NUL
    start "" "%filePath%"
    exit
) ELSE (
    ECHO Failed to apply update. Continuing with current version.
    del "%tempFile%" >NUL 2>&1
)

:skip_update
REM ============================================
REM END AUTO-UPDATE SECTION
REM ============================================

@color 03
@cls
@ECHO OFF
@echo.
@echo.  ***************************************************************************************
@echo.  ***************************************************************************************
@ECHO.  ********************* Tune Using built-in Microsoft Windows Tools *********************
@echo.  ***************************************************************************************
@echo.  ***************************************************************************************
@echo.
@ECHO                              This Software is created By RpJect.
@echo                                 AUTO TUNE Online version %version%
@ECHO                       This Program Uses Microsoft Windows Built-in Tools.
@ECHO                   Before We Start And help your computer to Get Fixed.
@echo.                                   Work For Windows10
@echo.
@echo.                   We Recommended You To Open This Software In Safemode

:Clean_Remnant_1
:: Clean up and create a secure working directory.
if exist "%workDir%" ( rd /s /q "%workDir%" )
mkdir "%workDir%"

:: --- Mode Script Generators ---
:: These sections create the .cmd files that perform the actual tuning operations.
:: They are now written to the secure %workDir% directory.

:Normal_Mode_Generator
ECHO TITLE "Normal Mode" > "%workDir%\mor1.cmd"
ECHO @ECHO OFF ^& CLS ^& NET SESSION ^>NUL 2^>^&1       >> "%workDir%\mor1.cmd"
ECHO @REM This Software is created By RpJect.  >> "%workDir%\mor1.cmd"
ECHO @REM https://github.com/RpJect/Auto-Tune  >> "%workDir%\mor1.cmd"
ECHO @REM This Program Uses Microsoft Windows Built-in Tools  >> "%workDir%\mor1.cmd"
ECHO @SETLOCAL  >> "%workDir%\mor1.cmd"
ECHO @ECHO (1/3) Performing memory diagnostics...  >> "%workDir%\mor1.cmd"
ECHO mschedexe.exe start >> "%workDir%\mor1.cmd"
ECHO @ECHO (2/3) Cleaning temporary files...  >> "%workDir%\mor1.cmd"
ECHO del "%%temp%%\*.*" /s /q   >> "%workDir%\mor1.cmd"
ECHO @ECHO (3/3) Running basic disk cleanup...  >> "%workDir%\mor1.cmd"
ECHO @START /B /W /HIGH cleanmgr /sagerun:1  >> "%workDir%\mor1.cmd"
ECHO @ECHO Good Job! We are done cleaning.    >> "%workDir%\mor1.cmd"
ECHO msg %username% Good Job! The Normal Mode Is Completed.   >> "%workDir%\mor1.cmd"
ECHO ECHO. ^& ECHO Normal Mode Complete! >> "%workDir%\mor1.cmd"
ECHO (goto) 2^>nul & del "%%~f0" >> "%workDir%\mor1.cmd"

:Performance_Mode_Generator
ECHO TITLE "Performance Mode" > "%workDir%\mor2.cmd"
ECHO @ECHO OFF ^& CLS ^& NET SESSION ^>NUL 2^>^&1       >> "%workDir%\mor2.cmd"
ECHO @REM This Software is created By RpJect.  >> "%workDir%\mor2.cmd"
ECHO @REM https://github.com/RpJect/Auto-Tune  >> "%workDir%\mor2.cmd"
ECHO @REM This Program Uses Microsoft Windows Built-in Tools  >> "%workDir%\mor2.cmd"
ECHO @SETLOCAL  >> "%workDir%\mor2.cmd"
ECHO @ECHO (1/9) Performing memory diagnostics...   >> "%workDir%\mor2.cmd"
ECHO mschedexe.exe start >> "%workDir%\mor2.cmd"
ECHO @ECHO (2/9) Performing extensive disk cleanup...   >> "%workDir%\mor2.cmd"
ECHO cleanmgr.exe /d %%WINDIR%% /VERYLOWDISK  >> "%workDir%\mor2.cmd"
ECHO @ECHO (3/9) Cleaning up system components...   >> "%workDir%\mor2.cmd"
ECHO @START /B /W /HIGH Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase  >> "%workDir%\mor2.cmd"
ECHO @ECHO (4/9) Deleting temporary user files...   >> "%workDir%\mor2.cmd"
ECHO del "%%temp%%\*.*" /s /q   >> "%workDir%\mor2.cmd"
ECHO @ECHO (5/9) Flushing DNS cache...   >> "%workDir%\mor2.cmd"
ECHO ipconfig /flushdns  >> "%workDir%\mor2.cmd"
ECHO @ECHO (6/9) Clearing browser tracks...   >> "%workDir%\mor2.cmd"
ECHO rundll32.exe inetcpl.cpl,ClearMyTracksByProcess 4351   >> "%workDir%\mor2.cmd"
ECHO @ECHO (7/9) Removing legacy installation files...   >> "%workDir%\mor2.cmd"
ECHO rmdir /S /Q "%%SystemDrive%%\i386"   >> "%workDir%\mor2.cmd"
ECHO @ECHO (8/9) Deleting CBS logs...    >> "%workDir%\mor2.cmd"
ECHO del /F /Q "%%WINDIR%%\logs\CBS\*"    >> "%workDir%\mor2.cmd"
ECHO @ECHO (9/9) Defragmenting drives...   >> "%workDir%\mor2.cmd"
ECHO defrag /C /H /V  >> "%workDir%\mor2.cmd"
ECHO msg %username% Good Job! The Performance Mode Is Completed.  >> "%workDir%\mor2.cmd"
ECHO ECHO. ^& ECHO Performance Mode Complete! >> "%workDir%\mor2.cmd"
ECHO (goto) 2^>nul & del "%%~f0" >> "%workDir%\mor2.cmd"

:Advanced_Mode_Generator
ECHO TITLE "Advanced Mode" > "%workDir%\mor3.cmd"
ECHO msg %username% /w Save Your Work Now. Advanced Mode will perform system repair operations.  >> "%workDir%\mor3.cmd"
ECHO @ECHO OFF ^& CLS ^& NET SESSION ^>NUL 2^>^&1       >> "%workDir%\mor3.cmd"
ECHO @REM This Software is created By RpJect.  >> "%workDir%\mor3.cmd"
ECHO @REM https://github.com/RpJect/Auto-Tune  >> "%workDir%\mor3.cmd"
ECHO @REM This Program Uses Microsoft Windows Built-in Tools  >> "%workDir%\mor3.cmd"
ECHO @ECHO (1/9) Enabling Ultimate Performance power plan...  >> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61   >> "%workDir%\mor3.cmd"
ECHO msg %username% Please choose the 'Ultimate Performance' power plan from the dialog that opens.  >> "%workDir%\mor3.cmd"
ECHO powercfg.cpl  >> "%workDir%\mor3.cmd"
ECHO @ECHO (2/9) Performing memory diagnostics...  >> "%workDir%\mor3.cmd"
ECHO mschedexe.exe start >> "%workDir%\mor3.cmd"
ECHO @ECHO (3/9) Cleaning system components and temp files...  >> "%workDir%\mor3.cmd"
ECHO @Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase  >> "%workDir%\mor3.cmd"
ECHO @del "%%temp%%\*.*" /s /q   >> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH rundll32.exe inetcpl.cpl,ClearMyTracksByProcess 4351   >> "%workDir%\mor3.cmd"
ECHO @rmdir /S /Q "%%SystemDrive%%\i386"   >> "%workDir%\mor3.cmd"
ECHO @del /F /Q "%%WINDIR%%\logs\CBS\*"    >> "%workDir%\mor3.cmd"
ECHO @ECHO (4/9) Applying firewall rules to block telemetry...  >> "%workDir%\mor3.cmd"
ECHO @ECHO This is a long process, please be patient. >> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH netsh advfirewall firewall add rule name="telemetry_vortex.data.microsoft.com" dir=out action=block remoteip=191.232.139.254 enable=yes		>> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH netsh advfirewall firewall add rule name="telemetry_telecommand.telemetry.microsoft.com" dir=out action=block remoteip=65.55.252.92 enable=yes		>> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH netsh advfirewall firewall add rule name="telemetry_oca.telemetry.microsoft.com" dir=out action=block remoteip=65.55.252.63 enable=yes		>> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH netsh advfirewall firewall add rule name="telemetry_sqm.telemetry.microsoft.com" dir=out action=block remoteip=65.55.252.93 enable=yes		>> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH netsh advfirewall firewall add rule name="telemetry_watson.telemetry.microsoft.com" dir=out action=block remoteip=65.55.252.43,65.52.108.29 enable=yes		>> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH netsh advfirewall firewall add rule name="telemetry_redir.metaservices.microsoft.com" dir=out action=block remoteip=194.44.4.200,194.44.4.208 enable=yes		>> "%workDir%\mor3.cmd"
ECHO @ECHO (5/9) Scanning for disk errors...  >> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH chkdsk /scan /perf >> "%workDir%\mor3.cmd"
ECHO @ECHO (6/9) Scanning system files (SFC)...  >> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH sfc /scannow  >> "%workDir%\mor3.cmd"
ECHO @ECHO (7/9) Restoring system image health (DISM)...  >> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH DISM.exe /Online /Cleanup-image /Restorehealth  >> "%workDir%\mor3.cmd"
ECHO @ECHO (8/9) Running final system file scan (SFC)...  >> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH sfc /scannow  >> "%workDir%\mor3.cmd"
ECHO @ECHO (9/9) Optimizing and defragmenting boot files...  >> "%workDir%\mor3.cmd"
ECHO @START /B /W /HIGH Defrag /C /B /O /V  >> "%workDir%\mor3.cmd"
ECHO msg %username% Attention! Save Your Work Now. The process is almost complete.  >> "%workDir%\mor3.cmd"
ECHO msg %username% Good Job! The Advanced Mode Is Completed.   >> "%workDir%\mor3.cmd"
ECHO ECHO. ^& ECHO Advanced Mode Complete! >> "%workDir%\mor3.cmd"
ECHO (goto) 2^>nul & del "%%~f0" >> "%workDir%\mor3.cmd"

:SOS_Mode_Generator
ECHO TITLE "SOS Mode" > "%workDir%\mor4.cmd"
ECHO @ECHO OFF ^& CLS ^& NET SESSION ^>NUL 2^>^&1       >> "%workDir%\mor4.cmd"
ECHO @REM This Software is created By RpJect.  >> "%workDir%\mor4.cmd"
ECHO @REM https://github.com/RpJect/Auto-Tune  >> "%workDir%\mor4.cmd"
ECHO @REM This Program Uses Microsoft Windows Built-in Tools  >> "%workDir%\mor4.cmd"
ECHO @SETLOCAL  >> "%workDir%\mor4.cmd"
ECHO msg %username% /w Save Your Work Now. Your computer will restart when this is done.  >> "%workDir%\mor4.cmd"
ECHO @ECHO (1/8) Cleaning up system components...  >> "%workDir%\mor4.cmd"
ECHO @START /B /W /HIGH  Dism.exe /online /Cleanup-Image /StartComponentCleanup /ResetBase  >> "%workDir%\mor4.cmd"
ECHO @ECHO (2/8) Deleting temporary user files...  >> "%workDir%\mor4.cmd"
ECHO del "%%temp%%\*.*" /s /q   >> "%workDir%\mor4.cmd"
ECHO @ECHO (3/8) Deleting CBS logs...  >> "%workDir%\mor4.cmd"
ECHO del /F /Q "%%WINDIR%%\logs\CBS\*"    >> "%workDir%\mor4.cmd"
ECHO @ECHO (4/8) Scanning for disk errors...    >> "%workDir%\mor4.cmd"
ECHO @START /B /W /HIGH chkdsk /scan /perf  >> "%workDir%\mor4.cmd"
ECHO @ECHO (5/8) Scanning system files (SFC)...  >> "%workDir%\mor4.cmd"
ECHO @START /B /W /HIGH sfc /scannow  >> "%workDir%\mor4.cmd"
ECHO @ECHO (6/8) Restoring system image health (DISM)...  >> "%workDir%\mor4.cmd"
ECHO @START /B /W /HIGH DISM.exe /Online /Cleanup-image /Restorehealth  >> "%workDir%\mor4.cmd"
ECHO @ECHO (7/8) Running final system file scan (SFC)...  >> "%workDir%\mor4.cmd"
ECHO @START /B /W /HIGH sfc /scannow  >> "%workDir%\mor4.cmd"
ECHO @ECHO (8/8) Defragmenting drives... >> "%workDir%\mor4.cmd"
ECHO @START /B /W /HIGH defrag /C /H /v  >> "%workDir%\mor4.cmd"
ECHO msg %username% Good Job! The SOS Mode Is Completed.  >> "%workDir%\mor4.cmd"
ECHO ECHO. ^& ECHO SOS Mode Complete! >> "%workDir%\mor4.cmd"
ECHO msg %username% ATTENTION! Your computer will restart now. Please save your work immediately.  >> "%workDir%\mor4.cmd"
ECHO shutdown.exe /r  >> "%workDir%\mor4.cmd"
ECHO (goto) 2^>nul & del "%%~f0" >> "%workDir%\mor4.cmd"

:: --- HTA Interface Section ---
:: The batch script pauses here and launches itself as an HTA application.
:: The 'for' loop captures the reply sent from the HTA's Javascript.
for /F "delims=" %%a in ('mshta.exe "%~F0"') do set "RpjectsReply=%%a"

:: --- HTA Response Handling ---
if "%RpjectsReply%"=="S" goto SafeMode
if "%RpjectsReply%"=="Selected option: Quick Mode (Quick And Fast)" goto 1
if "%RpjectsReply%"=="Selected option: Performance Mode (Recommended)" goto 2
if "%RpjectsReply%"=="Selected option: Advanced Mode" goto 3
if "%RpjectsReply%"=="Selected option: SOS Mode (Fix All Windows Errors)" goto 4
if "%RpjectsReply%"=="5" goto Website

echo The HTA window was closed. Reply: "%RpjectsReply%"

:Clean_Remnant_2
if exist "%workDir%" ( rd /s /q "%workDir%" )
goto :EOF

:SafeMode
msg %username% Now We Are Going To Restart Your Device To Advanced Startup.
shutdown.exe /r /o
goto :EOF

:1
start "CMD.EXE" /C "%workDir%\mor1.cmd"
goto :EOF

:2
echo Creating a System Restore Point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "AutoTune Restore Point", 100, 7
start "CMD.EXE" /C "%workDir%\mor2.cmd"
goto :EOF

:3
echo Creating a System Restore Point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "AutoTune Restore Point", 100, 7
start "CMD.EXE" /C "%workDir%\mor3.cmd"
goto :EOF

:4
echo Creating a System Restore Point...
wmic.exe /Namespace:\\root\default Path SystemRestore Call CreateRestorePoint "AutoTune Restore Point", 100, 7
start "CMD.EXE" /C "%workDir%\mor4.cmd"
goto :EOF

:Website
explorer "https://rpject.pages.dev/"
goto :EOF

:not_admin
cls
echo.
echo  ================================================================
echo   ERROR: ADMINISTRATIVE PRIVILEGES REQUIRED
echo  ================================================================
echo.
echo   This script must be run as an Administrator to function correctly.
echo.
echo   Please right-click the script and select "Run as administrator".
echo.
echo  ================================================================
echo.
pause
exit /b 1

:: The GOTO :EOF above prevents the batch script from falling through into the HTA code.
--->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AUTO TUNE by Rpjects</title>
    <script language="JavaScript">
        function sendReply(reply) {
            var fso = new ActiveXObject("Scripting.FileSystemObject");
            fso.GetStandardStream(1).WriteLine(reply);
            window.close();
        }

        function showCheckboxes() {
            var checkboxesContainer = document.getElementById("checkboxes-container");
            checkboxesContainer.style.display = "block";
        }

        function handleCheckboxSelection(checkboxId) {
            var checkbox = document.getElementById(checkboxId);
            if (checkbox.checked) {
                if (checkboxId === 'checkboxC') {
                    var confirmation = confirm("This option takes a long time but is worth it. If you continue, save your work because it will shut down your system. Do you want to proceed?");
                    if (confirmation) {
                        sendReply('Selected option: ' + checkbox.value);
                    } else {
                        checkbox.checked = false;
                    }
                } else if (checkboxId === 'checkboxD') {
                    var confirmation = confirm("This option repairs your system. If you continue, save your work because it will restart your system. Do you want to proceed?");
                    if (confirmation) {
                        sendReply('Selected option: ' + checkbox.value);
                    } else {
                        checkbox.checked = false;
                    }
                } else {
                    var confirmation = confirm("Do you want to continue?");
                    if (confirmation) {
                        sendReply('Selected option: ' + checkbox.value);
                    } else {
                        checkbox.checked = false;
                    }
                }
            }
        }
    </script>
<style>	
/* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
/* Body Styling */
body {
    font-family: 'Segoe UI', Arial, sans-serif;
    background-color: #eaeaea; /* Light grey background for the overall page */
    color: #333;
    line-height: 1.6;
    padding: 20px;
}
/* Container */
.container {
    max-width: 1000px;
    margin: auto;
    background: #ffffff; /* White background for the container */
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}


        /* Content Styling */
.content {
    flex: 1; /* Allows content to expand and push the footer down */
    padding: 20px;
}

/* Clearfix for the container in case of floating elements */
.container::after {
    content: "";
    display: table;
    clear: both;
}
/* Checkbox Container */
#checkboxes-container {
    margin: 20px 0;
    padding: 20px;
    background: #f9f9f9;
    border: 1px solid #ddd;
    border-radius: 5px;
}

/* Checkbox Label Styling */
label {
    display: block;
    padding: 10px;
    border-bottom: 1px solid #eee;
    cursor: pointer;
    transition: background-color 0.3s ease;
}
/* Last Child Border Removal */
label:last-child {
    border-bottom: none;
}
/* Checkbox Input Styling */
input[type="checkbox"] {
    margin-right: 10px;
}	
</style>	

</head>
<body>
     <div style="text-align: center">
    <h1 style="
    background-color: #333; /* Dark background */
    color: #fff; /* White text */
    padding: 5px; /* Reduced padding */
    margin-top: 10x; /* Remove default margin */
    font-size: 24px; /* Smaller font size */
    transition: background-color 0.3s, transform 0.3s; /* Smooth transition for hover effect */
    cursor: pointer; /* Change cursor to indicate it's clickable */
" onmouseover="this.style.backgroundColor='#555';" onmouseout="this.style.backgroundColor='#333';">
    AUTO TUNE Online version 2.0 (Corrected)
</h1>
<img src="https://rpject.github.io/.io/assets/images/favicon.ico" alt="RpJect Logo" style="margin-top: 10px;">
<p>This Program is Designed To Repair And Fix Your System.</p>
<p>It Uses Microsoft Windows Built-in Tools.</p>
<p>Works For Windows 10.</p>
<span onclick="sendReply(5);" style="color: #0000EE; text-decoration: underline; cursor: pointer;">
    For More Awesome Apps
</span>
    
    <h2 style="margin-top: 5px; margin-bottom: 5px;">We recommend you to open this software in Safe Mode</h2>
    
<!-- Green Button -->
<button onclick="sendReply('S');" 
        onmouseover="this.style.backgroundColor='#4df574'; this.style.border='2px solid #4df574';" 
        onmouseout="this.style.backgroundColor='#28a745'; this.style.border='2px solid #28a745';" 
        style="border-radius: 15px; background-color: #28a745; cursor: pointer; border: 2px solid #28a745;">
    Yes, get me into Safe Mode (Recommended)
</button>

<!-- Red Button -->
<button onclick="showCheckboxes();" 
        onmouseover="this.style.backgroundColor='#f5b3b4'; this.style.border='2px solid #f5b3b4';" 
        onmouseout="this.style.backgroundColor='#dc3545'; this.style.border='2px solid #dc3545';" 
        style="border-radius: 15px; background-color: #dc3545; cursor: pointer; border: 2px solid #dc3545;">
    No, continue in Normal Mode
</button>

 </div>
    <!-- Checkboxes (initially hidden) -->
    <div id="checkboxes-container" style="display: none;">
        <label onmouseover="this.style.backgroundColor='#f2f2f2';" onmouseout="this.style.backgroundColor='transparent';">
            <input type="checkbox" id="checkboxA" value="Quick Mode (Quick And Fast)" onclick="handleCheckboxSelection('checkboxA');">
            Option A: Quick Mode (Quick And Fast)
        </label>
        <br>
        <label onmouseover="this.style.backgroundColor='#f2f2f2';" onmouseout="this.style.backgroundColor='transparent';">
            <input type="checkbox" id="checkboxB" value="Performance Mode (Recommended)" onclick="handleCheckboxSelection('checkboxB');">
            Option B: Performance Mode (Recommended)
        </label>
        <br>
        <label onmouseover="this.style.backgroundColor='#f2f2f2';" onmouseout="this.style.backgroundColor='transparent';">
            <input type="checkbox" id="checkboxC" value="Advanced Mode" onclick="handleCheckboxSelection('checkboxC');">
            Option C: Advanced Mode (Long Time But Worth It)
        </label>
        <br>
        <label onmouseover="this.style.backgroundColor='#f2f2f2';" onmouseout="this.style.backgroundColor='transparent';">
            <input type="checkbox" id="checkboxD" value="SOS Mode (Fix All Windows Errors)" onclick="handleCheckboxSelection('checkboxD');">
            Option D: SOS Mode (Fix All Windows Errors)
        </label>
        <!-- Add more checkboxes as needed -->
    </div>
</body>
     <footer>
    <p style="
        text-align: center;
        padding: 10px; /* Reduced padding */
        background-color: #333;
        color: #fff;
        font-size: 14px; /* Smaller font size */
        margin-top: 30px;
        border-top: 4px solid #00b0f0;
        box-shadow: 0 -2px 5px rgba(0, 0, 0, 0.2);
    ">© 2024 AUTO TUNE by Rpjects. All rights reserved.</p>
</footer>
</html>
