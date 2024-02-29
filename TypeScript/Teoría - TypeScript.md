# Tema 7

## 1. Instalación de NodeJS
1. Obtener la versión de NodeJS:
    ```bash
    npm install --version
    ```
2. Instalar TypeScript:
    ```bash
    npm install typescript --g
    ```
3. Herramienta de TypeScript:
    ```bash
    tsc
    ```
4. Compilar un archivo .ts a JavaScript (Ejemplo: _index.ts_ a _index.js_):
    ```bash
    tsc index.ts
    ```
5. Compilación frente a cambios:
    ```bash
    tsc index.ts --watch
    ```
      

## 2.Instalación de Angular
1. Instalar Angular:
    ```bash
    npm install -g @angular/cli
    ```
2. Ayuda de angular:
    ```bash
    ng --help
    ```
3. Comprobar versión de Angular: 
    ```bash
    ng version
    ```


## 3. Creación de un proyecto nuevo
1. Ir a la carpeta Documentos, crear una carpeta llamada _ProyectosAngular_ y acceder a ella:
    ```bash
    cd Documents
    mkdir ProyectosAngular
    cd ProyectosAngular
    ```
2. Crear el proyecto con nombre _NombreProyecto_, y presionar _Enter_:
    ```bash
    ng new NombreProyecto --skip-tests --prefix directivas
    ```
3. Pulsar _Y_, luego _Enter_, y con las flechas seleccionar _CSS_

## 4. Compilación y ejecución de un proyecto
1. Para compilar un proyecto, abre un terminal y ejecuta:
    ```bash
    ng build
    ```
2. Puede ser en cualquier otro terminal:
    ```bash
    ng serve
    ```
3. Si quieres cambiar el puerto de ejecución, añade el parámetro _port_:
    ```bash
    ng serve --port 8000
    ```

## 5. Crear un componente
1. Ejecutar en una terminal el comando:
    ```bash
    ng g c components/{nombre del componente}
    ```

## 6. Crear un servicio
1. Ejecutar en una terminal el comando:
    ```bash
    ng g s service/{nombre del servicio}
    ```


## 7. Crear una ruta

1. Abrir app-routing.modules.ts
2. En _routes_:
    ```typescript
    const routes: Routes = [
        {
            path:"ciclos",
            component: CiclosComponent
        },
        {
            path:"cursos",
            component: CursosComponent
        }
    ];
    ```
3. Crear un _routerLink_ en lugar de _href_ para links de navegación:
    ```html
    <a ... routerLink="ciclos">Ciclos</a>
    ```


## ?. Escuchador de cambio en radios
1. Crear tres radios (importante que tengan _value_):
```html
<input name="caso" id="caso1" type="radio" value="1">
<label for="caso1">Caso 1</label><br>
<input name="caso" id="caso2" type="radio" value="2">
<label for="caso2">Caso 2</label><br>
<input name="caso" id="caso3" type="radio" value="3">
<label for="caso3">Caso 3</label><br>
```
2. Añadir método _change_ para cada etiqueta _radio_, con el valor de _$event_, para que ejecute un método cuando cambie el estado del check:
```html
<... (change)="cambioCaso($event)"></...>
```
2. Añadir una función de nombre _cambioCaso(evento: any)_ en el nombre de la directiva _.../components.ts_:
```js
cambiarCaso(evento: any){
    this.seleccion = evento.target.value;
}
```
**Nota:** no utilizar el tipo de variable del evento en _Event_







