@echo off
set /p ver_id=Version Number:

:::::::::::::::::::::::::::::::::
::::::::::::::TBC::::::::::::::::
:::::::::::::::::::::::::::::::::
::Copy Code
robocopy .. ..\build\TBC\Dung /XD build .idea .git BuildScripts /E
::Copy Version TOC
robocopy ..\BuildScripts\TBC ..\build\TBC\Dung /XD build .idea .git BuildScripts /E
::Zip it
powershell Compress-Archive -force -Path ..\build\TBC\Dung ..\build\Dung%ver_id%_TBC.zip


:::::::::::::::::::::::::::::::::
::::::::::::::VANILLA::::::::::::
:::::::::::::::::::::::::::::::::
::Copy Code
robocopy .. ..\build\Vanilla\Dung /XD build .idea .git BuildScripts /E
::Copy Version TOC
robocopy ..\BuildScripts\Vanilla ..\build\Vanilla\Dung /XD build .idea .git BuildScripts /E
::Zip it
powershell Compress-Archive -force -Path ..\build\Vanilla\Dung ..\build\Dung%ver_id%_Vanilla-SoM.zip