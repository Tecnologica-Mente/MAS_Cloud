@echo off
echo:
echo **************************************************************
echo ****************** Welcome to MAS Cloud AIO ******************
echo **************************************************************
echo:
echo Please accept the App's request to make changes to this device
TIMEOUT /T 5
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "irm https://massgrave.dev/get | iex"
REM TIMEOUT /T 5