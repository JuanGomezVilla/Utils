# Configuración de XAMPP

## 1. Acceso a MySQL en Windows
Es posible crear un acceso directo a MySQL en el escritorio. Cuando se instala XAMPP, en el directorio del programa también está MySQL. Si se quiere acceder a las bases por consola de forma recurrente, habrá que crear dicho acceso para facilitar la labor. Sigue los siguientes pasos:
1. Abre un bloc de notas o cualquier editor de texto válido.
2. Pega las dos líneas siguientes (ten en cuenta que la ruta puede variar en función de la letra del disco y la ruta de instalación de XAMPP):
    ```bat
    cd c:\xampp\mysql\bin
    mysql.exe -u root
    ```
3. Guarda el archivo en el escritorio con el nombre que quieras
4. Es importante que el formato del archivo sea _.bat_ o _.cmd_

Cambia el valor de _root_ si tuvieras otro nombre, por defecto suele ser ese valor. Si estableciste una contraseña para ese usuario, añade en la segunda línea el comando _-p_ seguido de la contraseña, por ejemplo:
```bat
cd c:\xampp\mysql\bin
mysql.exe -u root -p VALOR_CONTRASEÑA
```

No obstante, aquí tienes una versión más avanzada para el archivo _MySQL.bat_:
```bat
@echo off
title MySQL - XAMPP
if exist c:\xampp\mysql\bin (
    cd c:\xampp\mysql\bin
    mysql.exe -u root
) else (
    echo XAMPP directory does not exist...
)
echo.
echo Press a key to exit...
pause > nul
```