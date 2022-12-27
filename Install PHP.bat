@ECHO OFF
CHCP 65001>NUL

MD "C:\PHP" 2>nul >nul

ECHO.
curl -L https://windows.php.net/downloads/releases/php-8.2.0-nts-Win32-vs16-x64.zip -o "%Temp%\php-8.2.0-nts-Win32-vs16-x64.zip"
cls
ECHO.
PowerShell -Command "Expand-Archive -Path "C:\Users\%UserName%\AppData\Local\Temp\php-8.2.0-nts-Win32-vs16-x64.zip" -DestinationPath "C:\Users\%UserName%\AppData\Local\Temp\php-8.2.0-nts-Win32-vs16-x64" -Force"
cls

COPY /Y "%Temp%\php-8.2.0-nts-Win32-vs16-x64" "C:\PHP" 2>nul >nul

FOR /F "usebackq tokens=2,*" %%A in (`reg query HKCU\Environment /v PATH`) DO set temp_path=%%B
setx PATH "C:\PHP;%temp_path%" 2>nul >nul

RENAME "C:\PHP\php.ini-production" php.ini 2>nul >nul

PowerShell -Command (Get-Content 'C:\PHP\php.ini') -replace ';extension=curl', 'extension=curl' ^| Out-File 'C:\PHP\php.ini'

ECHO.&ECHO Install OK.&ECHO.&Pause






