@ECHO OFF
CHCP 65001>NUL
TITLE Install PHP
MODE 80,9
COLOR f9

ECHO.
ECHO   1. Install PHP 7.4
ECHO   2. Install PHP 8.2
ECHO.
set /p "Num=Select: "
if %Num%== 1 goto 7
if %Num%== 2 goto 8

:7
cls
ECHO.
curl -L https://windows.php.net/downloads/releases/php-7.4.33-nts-Win32-vc15-x64.zip -o "%Temp%\php-7.4.33-nts-Win32-vc15-x64.zip"
cls
ECHO.
PowerShell -Command "Expand-Archive -Path "C:\Users\%UserName%\AppData\Local\Temp\php-7.4.33-nts-Win32-vc15-x64.zip" -DestinationPath "C:\Users\%UserName%\AppData\Local\Temp\php-7.4.33-nts-Win32-vc15-x64" -Force"
cls
RD "C:\PHP" /S /Q                                                    2>nul >nul
MD "C:\PHP"                                                          2>nul >nul
COPY /Y "%Temp%\php-7.4.33-nts-Win32-vc15-x64" "C:\PHP"              2>nul >nul
FOR /F "usebackq tokens=2,*" %%A in (`reg query HKCU\Environment /v PATH`) DO set temp_path=%%B
echo %temp_path%|find "PHP">nul&&cls||setx PATH "C:\PHP;%temp_path%" 2>nul >nul
RENAME "C:\PHP\php.ini-production" php.ini                           2>nul >nul
PowerShell -Command (Get-Content 'C:\PHP\php.ini') -replace ';extension=curl', 'extension=curl' ^| Out-File 'C:\PHP\php.ini'
CHCP 866>NUL
ECHO.&ECHO   Install OK.&ECHO.&Pause

:8
cls
ECHO.
curl -L https://windows.php.net/downloads/releases/php-8.2.0-nts-Win32-vs16-x64.zip -o "%Temp%\php-8.2.0-nts-Win32-vs16-x64.zip"
cls
ECHO.
PowerShell -Command "Expand-Archive -Path "C:\Users\%UserName%\AppData\Local\Temp\php-8.2.0-nts-Win32-vs16-x64.zip" -DestinationPath "C:\Users\%UserName%\AppData\Local\Temp\php-8.2.0-nts-Win32-vs16-x64" -Force"
cls
RD "C:\PHP" /S /Q                                                    2>nul >nul
MD "C:\PHP"                                                          2>nul >nul
COPY /Y "%Temp%\php-8.2.0-nts-Win32-vs16-x64" "C:\PHP"               2>nul >nul
FOR /F "usebackq tokens=2,*" %%A in (`reg query HKCU\Environment /v PATH`) DO set temp_path=%%B
echo %temp_path%|find "PHP">nul&&cls||setx PATH "C:\PHP;%temp_path%" 2>nul >nul
RENAME "C:\PHP\php.ini-production" php.ini                           2>nul >nul
PowerShell -Command (Get-Content 'C:\PHP\php.ini') -replace ';extension=curl', 'extension=curl' ^| Out-File 'C:\PHP\php.ini'
CHCP 866>NUL
ECHO.&ECHO   Install OK.&ECHO.&Pause