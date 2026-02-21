

## Arreglar el delay del Caps Locks
1. Descargar el siguiente [repositorio](https://github.com/hexvalid/Linux-CapsLock-Delay-Fixer) en tu navegador
2. Descomprímelo y ejecuta en una terminal:
    ```bash
    bash -ic "sh bootstrap.sh"
    ```
- Restablecer el teclado:
    ```bash
    setxkbmap -layout es
    xset r on # Activar el auto-repeat de las teclas
    xset r rate 300 30 # Ajustar velocidad de las teclas
    ```
