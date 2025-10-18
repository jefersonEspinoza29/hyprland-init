#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Imagenes/wallpapers"

if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon --namespace wayland-1 &
    sleep 1
fi

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

swww img "$WALLPAPER" --namespace wayland-1 --transition-type center --transition-fps 60

# Espera un poco antes de generar la paleta
sleep 2

# Genera los colores con Matugen
matugen image "$WALLPAPER" --mode dark
