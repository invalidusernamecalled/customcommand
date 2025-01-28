@echo off 
color 09
echo:trying to copy files
for /f "delims=" %%I in ("%userprofile%") do copy cd.bat  "%%~I\AppData\Local\Temp\"
if %errorlevel%==0 (echo:SUCCESS) else (Echo:Error)
for /f "delims=" %%I in ("%userprofile%") do copy down.bat  "%%~I\AppData\Local\Temp\"
if %errorlevel%==0 (echo:SUCCESS) else (Echo:Error)
echo:
echo:You can now close the window.
pause >NUL
