@echo off
setlocal enabledelayedexpansion

set "directory=C:\Users\nery6\Desktop\Node\src\public\startbootstrap-sb-admin-2-gh-pages"
set "outputFile=output.txt"

REM Bucle para recorrer todos los archivos dentro del directorio
for %%F in ("%directory%\*") do (
    echo %%~fF >> "%outputFile%"
)

echo Archivos y rutas guardados en "%outputFile%"
pause
