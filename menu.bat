@echo off
setlocal enabledelayedexpansion
color 0B
mode con: cols=60 lines=25

:menu
cls
echo.
echo    ==============================================
echo    WEBHOOK SPAMMER v1.3 - Made with ❤️ by Daino
echo    ==============================================
echo.
echo    1. Start webhook attack
echo    2. View requirements/config
echo    3. Exit
echo.
set /p choice=Select an option [1-3]: 

if "%choice%"=="1" goto start
if "%choice%"=="2" goto requirements
if "%choice%"=="3" exit
echo Invalid option. Press any key to try again...
pause >nul
goto menu

:requirements
cls
echo.
echo    [ SYSTEM REQUIREMENTS ]
echo    ------------------------
echo    - Python 3.x installed
echo    - Modules: requests, pyfiglet
echo.
echo    [ AUTOMATIC INSTALLATION ]
echo.
pip install requests pyfiglet >nul 2>&1
if errorlevel 1 (
    echo [!] Installation error. Install manually
) else (
    echo [✓] Dependencies installed!
)
echo.
pause
goto menu

:start
cls
echo.
echo    ==============================================
echo    CONFIGURE ATTACK
echo    ==============================================
echo.
set /p msg=Message to send: 
set /p webhook=Webhook URL: 
set /p count=Number of messages: 
set /p sleep=Delay time (in seconds, e.g., 0.5 for 500ms): 

(
echo !msg!
echo !webhook!
echo !count!
echo !sleep!
) >webhook_config.tmp

cls
echo.
echo    [ STATUS: ATTACK RUNNING ]
echo    Press Ctrl+C to stop
echo    ------------------------
python Webhook.py <webhook_config.tmp
del webhook_config.tmp
pause
goto menu
