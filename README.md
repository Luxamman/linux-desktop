# linux-desktop

A collection of linux-desktop.net resources.

## Debain scripts

After installing Debian 13 as a stable base. Goal: Fast, repeatable and up-to-date app installations for the most important functions, as well as fixing Debian and GNOME weaknesses (on an app basis). Or to put it another way: Quickly create a computer environment for the average user. With web browsing, email, office applications, and multimedia.

- install Flatpak / Flathub for new apps (script debian-flatpak-setup.sh)
- reboot
- install common apps for daily use and remove older versions (debian-apps-setup.sh)

## Installed applications

Installed via APT

- Wine (for running Windows applications)

## Installed via Flatpak (Flathub)

- Extension Manager (GNOME extensions)
- Showtime (video player)
- Papers (PDF viewer)
- VLC (media player)
- Thunderbird (mail client)
- Google Chrome (web browser)
- Shortwave (internet radio)
- g4music (music player)
- ZapZap (WhatsApp client)
- Decibels (audio player)
- GIMP (image editor)
- WineCharm (Wine frontend)
- Simple Scan (scanner utility)
- Déjà Dup (backup tool)
- Tuner (audio settings utility)

## Additional configuration

Grants Google Chrome Flatpak permission to create:

- desktop launchers
- application icons

This allows installing Progressive Web Apps (PWAs) properly.
