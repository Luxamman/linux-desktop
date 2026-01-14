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
        de:header) echo "=== Debian Extras & Desktop-Einstellungen ===" ;;
        en:header) echo "=== Debian Extras & Desktop Settings ===" ;;

        de:ext_header) echo ">> Aktiviere GNOME-Erweiterungen..." ;;
        en:ext_header) echo ">> Enabling GNOME extensions..." ;;

        de:ext_warn) echo "Hinweis: GNOME-Erweiterung konnte nicht aktiviert werden: $2" ;;
        en:ext_warn) echo "Note: failed to enable GNOME extension: $2" ;;

        de:mime_header) echo ">> Setze Standard-Anwendungen..." ;;
        en:mime_header) echo ">> Setting default applications..." ;;

        de:done) echo "=== Fertig. Einstellungen wurden angewendet. ===" ;;
        en:done) echo "=== Done. Settings have been applied. ===" ;;
    esac
}

# -------------------------------------
# Start
# -------------------------------------
msg header
echo

# -------------------------------------
# GNOME Extensions
# -------------------------------------
msg ext_header

# Dash to Dock
gnome-extensions enable dash-to-dock@micxgx.gmail.com \
    || msg ext_warn "Dash to Dock"

# AppIndicator / KStatusNotifier
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com \
    || msg ext_warn "AppIndicator / KStatusNotifier"

echo

# -------------------------------------
# Default applications (xdg-mime)
# -------------------------------------
msg mime_header

# PDF
xdg-mime default org.gnome.Papers.desktop application/pdf

# Video
xdg-mime default org.videolan.VLC.desktop video/mp4
xdg-mime default org.videolan.VLC.desktop video/x-matroska
xdg-mime default org.videolan.VLC.desktop video/webm

# Audio
xdg-mime default org.gnome.Decibels.desktop audio/mpeg
xdg-mime default org.gnome.Decibels.desktop audio/ogg
xdg-mime default org.gnome.Decibels.desktop audio/flac

# Mail
xdg-mime default org.mozilla.Thunderbird.desktop x-scheme-handler/mailto

# Browser (Chrome)
xdg-mime default com.google.Chrome.desktop x-scheme-handler/http
xdg-mime default com.google.Chrome.desktop x-scheme-handler/https

echo
msg done
