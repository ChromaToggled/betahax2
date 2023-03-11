REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
getadmin.vbs
del getadmin.vbs

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
cls
echo Ho richiesto l'amministratore
echo Per aprire il file e testare admin,
pause
START cmd.exe /c test2.bat