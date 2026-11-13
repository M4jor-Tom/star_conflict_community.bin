@echo off
start "" /D "%~dp0..\cloud\mongodb" launch.bat
timeout /t 3
start "" /D "%~dp0..\cloud" Hub.exe