@echo off

title Reset Google

echo Lets delete google cache...

pause
set name="User Data"
rmdir /s %USERPROFILE%\AppData\Local\Google\Chrome\%name%
cd %USERPROFILE%\AppData\Local\Google\Chrome
mkdir %name%
echo Operation complete
pause