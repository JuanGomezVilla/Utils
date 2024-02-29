# Gitflow

**Índice**
1. [Introducción](#punto1)
2. [Instalación](#punto2)
3. [Primeros pasos](#punto3)
4. [Crear una característica](#punto4)
5. [Crear una liberación](#punto5)
6. [Anotaciones](#punto6)



<div id="punto1"></div>

## 1. Introducción
Es un modelo alternativo de creación de ramas en [Git](https://es.wikipedia.org/wiki/Git). Principalmente, se consideran dos ramas principales: _master_ y _develop_. En la primera, se encuentra el código en producción y en la segunda el trabajo de todas las ramas de funciones. Las ramas de funciones se crean para implementar una nueva característica y posteriormente fusionarse en la rama de _develop_. Por lo general, no se trabaja directamente sobre estas dos ramas principales, sino en las ramas de funciones, para luego los cambios ser pasados a las dos principales.


<div id="punto2"></div>

## 2. Instalación
Para utilizar Gitflow es necesario primero tener Git. Para comprobarlo, abre CMD y ejecuta:
```bash
git --version
```
Deberá aparecer algo similar a lo siguiente, de lo contrario puedes descargarlo desde el siguiente [enlace](https://git-scm.com/downloads):
```bash
git version 2.40.0.windows.1
```


<div id="punto3"></div>

## 3. Primeros pasos
1. Clonar un repositorio que tengas, por ejemplo en GitHub. Es hacer una copia completa de un repositorio que ya existe en un sistema de control de versiones, como Git. Es útil, porque se trabaja en local con el código fuente:
    ```bash
    git clone https://github.com/my-account/my-repo-name.git
    ```
2. El proyecto contiene diferentes ramas. Para ver cuáles son, abre una terminal y ejecuta:
    ```bash
    git branch --all
    ```
    Verás algo similar a esto, el asterisco significa la rama actual sobre la que estás trabajando:
    ```
    * master
      remotes/origin/HEAD -> origin/master
      remotes/origin/master
    ```
    > Puedes sustituir _--all_ por _-a_ si lo prefieres. A partir de ahora, muchos comandos se ejecutan acortados










git flow init -d







3. Sin embargo, en GitFlow, se programa sobre otras ramas, y _master_ solo está para producción. Crea una rama de nombre _develop_:
    ```bash
    git branch develop
    ```
4. La rama _develop_ se ha creado correctamente, habría que publicarla en el repositorio remoto:
    ```bash
    git push -u origin develop
    ```


## 4. Preparación del entorno
1. Hasta ahora, hemos creado una rama de desarrollo y la hemos enviado al repositorio remoto. Tras esto, hay que preparar el entorno de GitFlow, con el siguiente comando:
    ```bash
    git flow init --default
    ```
    ```
    Using default branch names.

    Which branch should be used for bringing forth production releases?
        - develop
        - master
    Branch name for production releases: [master] 

    Which branch should be used for integration of the "next release"?
        - develop
    Branch name for "next release" development: [develop] 

    How to name your supporting branch prefixes?
    Feature branches? [feature/] 
    Bugfix branches? [bugfix/] 
    Release branches? [release/] 
    Hotfix branches? [hotfix/] 
    Support branches? [support/] 
    Version tag prefix? [] 
    Hooks and filters directory? [C:/.../gitflow/.git/hooks]
    ```
2. Volvemos a comprobar la rama actual en la que estamos, y nos ubicamos en la rama _develop_:
    ```bash
    git checkout develop
    ```
    > Añade _-b_ si quieres crear una rama nueva y cambiar a ella directamente: _git checkout -b develop_

## 5. Creación de ramas
1. Estando en la rama _develop_, hay que crear una rama para una nueva funcionalidad. Por ejemplo, vamos a crear un formulario de contacto. Lo primero que hay que hacer es iniciar una nueva _feature_:
    ```bash
    git flow feature start creacion-formulario-contacto
    ```
2. Hemos creado una rama nueva. Crea un archivo de nombre _contacto.html_ con el siguiente contenido:
    ```html
    <!DOCTYPE html>
    <html>
        <head>
            <title>Contacto</title>
            <meta charset="UTF-8"/>
        </head>
        <body>
            <h1>Contacto</h1>
        </body>
    </html>
    ```


## otros
2. Crea una nueva rama _develop_ a partir de _master_. La opción -b indica que se creará una nueva rama en lugar de cambiar a una existente. La opción _checkout_ permite cambiar de la rama actual a la que acabas de crear, en este caso _develop_. En resumen, es crear una nueva rama de nombre _develop_ y cambiar el repositorio local actual a dicha rama:
    ```bash
    git checkout -b develop master
    ```
3. Mostrar una lista de todas las ramas disponibles tanto localmente como en el repositorio remoto. La opción -a significa todas las ramas, permitiendo ver tanto las ramas locales como las remotas:
    ```bash
    git branch -a
    ```
4. Crear rama _develop_ en el repositorio remoto. Cuando ejecutes este comando, la rama _develop_ se registrará donde está guardado el repositorio en la nube, y no en local. Si estás en GitHub puedes verlo en _Settings_ y luego en _Branches_:
    ```bash
    git push --set-upstream origin develop
    ```
5. Cuando hayas realizado los pasos anteriores, ejecuta el siguiente comando para iniciar Gitflow. Añade -d para establecer los datos por defecto. Si prefieres configurarlo tu, retiralo:
    ```bash
    git flow init -d
    ```


<div id="punto4"></div>

## 4. Crear una característica
1. Crea una característica en la rama _feature_. Por ejemplo, que la acción que vas a realizar es crear un formulario:
    ```bash
    git flow feature start crear-formulario-contacto
    ```
2. Realiza cambios, modifica, crea archivos, etc. El siguiente comando te devuelve la información sobre datos cambiados desde la última vez. Sin realizar modificaciones todavía ejecútalo, luego crea un archivo y ejecútalo de nuevo:
    ```bash
    git status
    ```
3. Si has realizado cambios anterioremente, puedes ejecutar _git add --all_ o la abreviatura general. Agrega al área de preparación todos los cambios en los archivos del repositorio. Se puede decir que es como la plataforma de despegue de un avión:
    ```bash
    git add -A
    ```
4. Una vez preparado, habría que realizar _commit_. Es decir, aplicar acciones para que los cambios surtan efecto. Esto no lo hará sobre el repositorio remoto sino en el local. Más adelante se analizará como cargar los cambios en el repositorio local:
    ```bash
    git commit -m "Formulario creado"
    ```
5. Finalizar la característica que se abrió en el primer paso:
    ```bash
    git flow feature finish crear-formulario-contacto
    ```


<div id="punto5"></div>

## 5. Crear una liberación
1. La liberación puede considerarse como _release_, una plubicación o actualización, y tiene una versión. Básicamente inicia una nueva rama de lanzamiento, y es creada a partir de _develop_:
    ```bash
    git flow release start 1.0.0
    ```
2. Confirmar los cambios realizados:
    ```bash
    git status
    git add -A
    git commit -m "Add release notes"
    ```
3. Finalizar la liberación que se ha creado:
    ```bash
    git flow release "DATO" finish 1.0.0
    ```
4. Aplicar cambios sobre la rama de _develop_ en el repositorio remoto:
    ```bash
    git checkout develop
    git push
    ```
5. Aplicar cambios sobre la rama de _master_ en el repositorio remoto:
    ```bash
    git checkout master
    git push
    ```


