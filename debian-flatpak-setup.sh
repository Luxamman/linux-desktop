#!/bin/bash

# -------------------------------------
# Language detection (de / en fallback)
# -------------------------------------
LANG_CODE="en"

if [[ "$LANG" == de* ]]; then
    LANG_CODE="de"
fi

# -------------------------------------
# Translation function
# -------------------------------------
msg() {
    case "$LANG_CODE:$1" in
        de:header) echo "== Debian Flatpak Einrichtung ==" ;;
        en:header) echo "== Debian Flatpak Setup ==" ;;

        de:install_flatpak) echo ">> Installiere Flatpak und GNOME-Plugin..." ;;
        en:install_flatpak) echo ">> Installing Flatpak and GNOME plugin..." ;;

        de:add_flathub) echo ">> Füge Flathub hinzu (falls nicht vorhanden)..." ;;
        en:add_flathub) echo ">> Adding Flathub (if not present)..." ;;

        de:done) echo "== Flatpak Einrichtung abgeschlossen! ==" ;;
        en:done) echo "== Flatpak setup finished! ==" ;;
    esac
}

# -------------------------------------
# Script start
# -------------------------------------
msg header

# 1. Flatpak + GNOME Plugin
msg install_flatpak
sudo apt update
sudo apt install -y flatpak gnome-software-plugin-flatpak

# 2. Flathub hinzufügen
msg add_flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

msg done
