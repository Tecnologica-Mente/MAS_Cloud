@echo off
setlocal enabledelayedexpansion

echo:
echo **************************************************************
echo ****************** Welcome to MAS Cloud AIO ******************
echo **************************************************************
echo:
echo Please accept the App's request to make changes to this device
TIMEOUT /T 5

:: Windows version detection
for /f "tokens=2 delims=[]" %%a in ('ver') do set fullver=%%a
for /f "tokens=1-4 delims=. " %%a in ("%fullver%") do (
    set ver_major=%%c
    set ver_minor=%%d
)
set /a win_ver=!ver_major! * 10 + !ver_minor!

:: Running the activation script
echo.
echo Detect your Windows version and download a script from massgrave.dev...
echo.

if %win_ver% equ 61 (
    echo Windows 7 Detected - Using compatible method...
    powershell -Command "try { iex ((New-Object Net.WebClient).DownloadString('https://get.activated.win')) } catch { echo 'ERROR: $($_.Exception.Message)'; echo 'Solution: Check your connection or use the manual method'; pause; exit 1 }"
    goto :success
) else if %win_ver% gtr 61 (
    echo Windows version higher than 7 detected - Using modern method...
    powershell -Command "try { irm https://get.activated.win | iex } catch { echo 'ERROR: $($_.Exception.Message)'; echo 'Solution: Check your connection'; pause; exit 1 }"
    goto :success
) else (
    echo.
    echo ERROR: Windows version lower than 7 detected (%ver_major%.%ver_minor%)
    echo Perform the traditional (manual) activation method
    echo Please refer to this link: https://massgrave.dev/
    echo.
    pause
    exit /b 1
)

:success
echo.
echo Operation completed successfully!
pause
exit /b 0