#!/bin/bash

while true; do
    clear
    echo "==== GESTIÓN DE PROCESOS ===="
    echo "1. Buscar procesos por nombre"
    echo "2. Listar todos los procesos"
    echo "3. Matar un proceso por PID"
    echo "4. Matar un proceso por nombre"
    echo "5. Salir"

    read -p "Seleccione una opción [1-5]: " opcion

    case $opcion in
        1)
            read -p "Ingrese el nombre o parte del nombre del proceso: " nombre
            ps aux | grep "$nombre" | awk '{print $2, $11}'
            read -p "Presione Enter para continuar..."
            ;;
        2)
            ps aux | awk '{print $2, $11}'
            read -p "Presione Enter para continuar..."
            ;;
        3)
            read -p "Ingrese el PID del proceso que desea matar: " pid
            kill $pid
            ;;
        4)
            read -p "Ingrese el nombre o parte del nombre del proceso que desea matar: " nombre
            pid=$(ps aux | grep "$nombre" | awk '{print $2}')
            echo "Proceso a matar: $pid"
            read -p "Está seguro que desea matar este proceso? [S/n]: " confirmar
            if [ "$confirmar" = "S" -o "$confirmar" = "s" ]; then
                kill $pid
            fi
            ;;
        5)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción inválida. Presione Enter para continuar..."
            read
            ;;
    esac
done
