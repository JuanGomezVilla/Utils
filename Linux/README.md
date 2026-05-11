

## Arreglar el delay del Caps Locks
1. Descargar el siguiente [repositorio](https://github.com/hexvalid/Linux-CapsLock-Delay-Fixer)
2. Descomprímelo y ejecuta en una terminal:
    ```bash
    bash -ic "sh bootstrap.sh"
    ```
- Si quisieras restablecer el teclado
    ```bash
    setxkbmap -layout es
    ```
- Ajustar el autocompletado:
    ```bash
        xset r on # Activar el auto-repeat de las teclas
    xset r rate 300 30 # Ajustar velocidad de las teclas
    ```