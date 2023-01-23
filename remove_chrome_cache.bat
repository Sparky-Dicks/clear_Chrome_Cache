
title WipePcData_

cd /d %USERPROFILE%\Downloads
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

cd /d %USERPROFILE%\Pictures
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

cd /d %USERPROFILE%\Documents
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

cd /d %USERPROFILE%\3D Objects
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

cd /d %USERPROFILE%\Desktop
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

cd /d %USERPROFILE%\Music
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)

cd /d %USERPROFILE%\Videos
for /F "delims=" %%i in ('dir /b') do (rmdir "%%i" /s/q || del "%%i" /s/q)


set name="User Data"
rmdir /s/q %USERPROFILE%\AppData\Local\Google\Chrome\%name%
cd %USERPROFILE%\AppData\Local\Google\Chrome
mkdir %name%
cd /d %USERPROFILE%

cls
echo Operation complete
pause
