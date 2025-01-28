@echo off 
set error_is=0
echo:*****Creating custom command .bat
echo:
if exist customcommand.bat echo:!!! Error A file `customcommand.bat` exists &echo:Cannot overwrite. try again. & goto end
for /f "delims=" %%I in ("%userprofile%") do (
echo:color 09 >customcommand.bat
echo:doskey del=del /p $1 >>customcommand.bat
echo:doskey up=cd ..\ >>customcommand.bat
echo:doskey cd="%%~I\AppData\Local\Temp\cd.bat" $1>>customcommand.bat
echo:doskey 00=cd \ >>customcommand.bat
echo:doskey down="%%~I\AppData\Local\Temp\down.bat" >>customcommand.bat
echo:doskey clear=del "%%~I\AppData\Local\Temp\kmxlkamsalkjasa9019820.txt" >>customcommand.bat
echo:doskey whris=dir /s /b "$*" >>customcommand.bat
echo:cls >>customcommand.bat
)
echo:*****Creating shortcut start.bat
echo:
if exist start.bat echo:Error A file named `start.bat` exists.&echo:Cannot overwrite. try again. & goto end
echo:start cmd /k "customcommand.bat" >start.bat
echo:*****trying to copy files
for /f "delims=" %%I in ("%userprofile%") do copy cd.bat  "%%~I\AppData\Local\Temp\" >NUL
if %errorlevel%==0 (echo:SUCCESS) else (Echo:!!! Error copying file:`cd.bat`&set /a error_is=1&if not exist cd.bat echo:Cd.bat is not found.)
for /f "delims=" %%I in ("%userprofile%") do copy down.bat  "%%~I\AppData\Local\Temp\" >NUL
if %errorlevel%==0 (echo:SUCCESS) else (Echo:!!! Error copying file:`down.bat`&set /a error_is=1&if not exist Down.bat echo:Down.bat is not found.)
:end
echo:
echo|set/p=--You can now close the window.&if %error_is%==1 echo:Errors were found.
pause >NUL
