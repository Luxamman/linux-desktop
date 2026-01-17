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
        de:remove_header) echo "=== Entferne vorhandene Apps/Programme ===" ;;
        en:remove_header) echo "=== Removing existing applications ===" ;;

        de:install_header) echo "=== Installiere gewünschte Pakete / Flatpaks ===" ;;
        en:install_header) echo "=== Installing required packages / Flatpaks ===" ;;

        de:warn_remove) echo "Hinweis: $2 konnte nicht entfernt werden (evtl. nicht installiert)." ;;
        en:warn_remove) echo "Note: $2 could not be removed (possibly not installed)." ;;

        de:warn_install) echo "WARNUNG: $2 konnte nicht installiert werden." ;;
        en:warn_install) echo "WARNING: failed to install $2." ;;

        de:chrome_header) echo "=== Setze PWA-Berechtigungen für Chrome ===" ;;
        en:chrome_header) echo "=== Setting PWA permissions for Chrome ===" ;;

        de:chrome_done) echo "Chrome kann jetzt PWAs installieren." ;;
        en:chrome_done) echo "Chrome can now install PWAs." ;;

        de:done) echo "=== Fertig. Oben ggf. Hinweise/Warnungen prüfen. ===" ;;
        en:done) echo "=== Done. Please review any warnings above. ===" ;;
    esac
}

# -------------------------------------
# Remove existing applications
# -------------------------------------
msg remove_header

sudo apt remove -y evince      || msg warn_remove evince
sudo apt remove -y thunderbird || msg warn_remove thunderbird
sudo apt remove -y evolution   || msg warn_remove evolution
sudo apt remove -y simple-scan || msg warn_remove simple-scan

echo

# -------------------------------------
# Install required packages / Flatpaks
# -------------------------------------
msg install_header

# APT
sudo apt install -y wine || msg warn_install wine

# Flatpaks
flatpak install -y flathub com.mattjakeman.ExtensionManager || msg warn_install com.mattjakeman.ExtensionManager
flatpak install -y flathub org.gnome.Showtime               || msg warn_install org.gnome.Showtime
flatpak install -y flathub org.gnome.Papers                 || msg warn_install org.gnome.Papers
flatpak install -y flathub org.videolan.VLC                 || msg warn_install org.videolan.VLC
flatpak install -y flathub org.mozilla.Thunderbird          || msg warn_install org.mozilla.Thunderbird
flatpak install -y flathub com.google.Chrome                || msg warn_install com.google.Chrome
flatpak install -y flathub de.haeckerfelix.Shortwave        || msg warn_install de.haeckerfelix.Shortwave
flatpak install -y flathub com.github.neithern.g4music      || msg warn_install com.github.neithern.g4music
flatpak install -y flathub com.rtosta.zapzap                || msg warn_install com.rtosta.zapzap
flatpak install -y flathub org.gnome.Decibels               || msg warn_install org.gnome.Decibels
flatpak install -y flathub org.gimp.GIMP                    || msg warn_install org.gimp.GIMP
flatpak install -y flathub io.github.fastrizwaan.WineCharm  || msg warn_install io.github.fastrizwaan.WineCharm
flatpak install -y flathub org.gnome.SimpleScan             || msg warn_install org.gnome.SimpleScan
flatpak install -y flathub org.gnome.DejaDup                || msg warn_install org.gnome.DejaDup
flatpak install -y flathub org.altlinux.Tuner               || msg warn_install org.altlinux.Tuner
flatpak install -y flathub com.rustdesk.RustDesk            || msg warn_install com.rustdesk.RustDesk

echo

# -------------------------------------
# Chrome PWA permissions
# -------------------------------------
msg chrome_header

CHROME_ID="com.google.Chrome"

flatpak override --user --filesystem=~/.local/share/applications $CHROME_ID
flatpak override --user --filesystem=~/.local/share/icons $CHROME_ID

msg chrome_done

echo
msg done
