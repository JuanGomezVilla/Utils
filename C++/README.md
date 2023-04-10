# Utils - C++

## 1. Configuración inicial del entorno

Para trabajar con C++, es necesario establecer primero una herramienta de compilación, como en Java, donde se utiliza un JDK para trabajar con Java, compilar, ejecutar, etc.

La herramienta con la que se va a trabajar será MinGW, sin embargo, instalaremos un programa que ya lo trae. Este programa es [Code::Blocks](http://www.codeblocks.org/downloads/binaries/). Si pinchas sobre el nombre, te llevará directamente a la zona de descargas. La versión a descargar del programa es aquella que tiene incorporado MinGW, en mi caso es _codeblocks-20.03mingw-setup.exe_.

Tras descargarse un archivo, ejecútalo, instala todos los componentes cuando te lo solicite. El programa se instalará en _Program Files_. Finalizado este paso, habrá que proceder a _añadir_ el comando de compilación a CMD. Aunque instales el programa, _hay que decirle_ al sistema que has instalado un programa con una serie de comandos para desarrollar. Para hacerlo, sigue los siguientes pasos:

1. Busca _Editar las variables de entorno del sistema_.
2. Cuando selecciones esa opción, aparecerá una ventana emergente.
3. Busca un botón _Variables de entorno_, aparecerá otra ventana.
4. En la sección _Variables del sistema_, selecciona _Path_ y luego _Editar_
5. Crearás una nueva regla, cuya ruta será la de MinGW que se encuentra en Code::Blocks. En mi caso es _C:\Program Files\CodeBlocks\MinGW\bin_
6. Aplica cambios y ya se habrá registrado. Para comprobarlo, abre una consola de CMD y escribe el comando:
    ```bash
    gcc --version
    ```
7. Tras ejecutar el comando, aparecerá un mensaje similar al siguiente, si sucede, todo se habrá instalado correctamente:
    ```
    gcc (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0
    Copyright (C) 2018 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    ```

## 2. Instalación de Qt
Qt es un framework utilizado para el desarrollo de interfaces gráficas. Dado que está ampliamente aceptado y tarde o temprano lo utilizaremos, pasaremos a realizar el proceso de instalación:

1. Acceder al siguiente enlace: https://www.qt.io/download-open-source
2. Pulsa en un botón que dice "Download the Qt Online Installer"
3. Ejecuta el archivo descargado
4. Tendrás que tener un usuario creado para iniciar sesión y descargar los archivos de instalación
5. Sigue los pasos del instalador. Este descargará lo necesario y lo instalará. Es imporante que la carpeta esté en la raíz (C:).
6. Una vez finalizado el proceso, abre una nueva ventana de CMD y ejecuta el siguiente comando:
    ```bash
    qmake --version
    ```
7. Si todo ha salido bien, por la pantalla de la consola aparecerá algo similar a:
    ```
    QMake version 3.1
    Using Qt version 6.5.0 in C:/Qt/6.5.0/mingw_64/lib
    ```

## 3. Conectar LibVLC con Qt
Para llevar a cabo estos pasos, hace falta una librería de útiles.

1. https://vlc-qt.tano.si/
2. Pulsa en "Windows 32-bit (MinGW)"
3. Abre el archivo descargado
4. Extrae el contenido de esa carpeta en C:\Qt\6.5.0\mingw_64


qmake -project
LIBS += -L"C:\Program Files (x86)\VideoLAN\VLC"
LIBS += -lvlc
qmake

## 2. Configuración de Visual Studio Code

