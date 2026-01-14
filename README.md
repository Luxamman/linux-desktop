# linux-desktop

A collection of scripts and notes used on  
https://linux-desktop.net

The goal of this repository is to help create **simple, stable, and low-maintenance Linux desktop systems** for everyday users.

This is **not** a distribution, framework, or enterprise solution.  
It is a pragmatic, Flatpak-first approach for private desktop computers.

---

## Debian desktop scripts

The following scripts are designed to be used **after installing Debian 13 GNOME** as a stable base system (GNOME desktop).

---

## Philosophy

- **Scripts for experienced users**
- **A finished system for non-technical users**

The scripts are meant to be executed by someone familiar with Linux basics.  
The resulting system, however, is designed for everyday users who should not need to touch the terminal at all.

---

### Goal

Fast installation for pros, usable system for users. Like for your parents or grandparents system. 

- Fast and repeatable setup
- Migrate users from Windows to Linux with minimal friction
- Use old or older hardware for loger
- Up-to-date desktop applications via Flatpak
- Minimal changes to the base system
- Reduced maintenance effort
- A familiar desktop for average users

In short:  
**Quickly create a usable desktop environment for web browsing, email, documents, and multimedia.**

---

## Recommended workflow

1. **Backup your data**
2. Download **Debian 13 Live GNOME** https://www.debian.org/distrib/ 
3. Test the system and install Debian
4. Run the Flatpak setup script
5. Reboot
6. Run the application setup script
7. Apply desktop extras and settings

---
## Running the scripts

The scripts can be marked as executable, but the do not need to be. 

To make it executable:

- Rightclick on file
- Options
- Run as program

Or: run them explicitly using `bash` aka. Terminal:

bash install-flatpak.sh
bash debian-apps-setup.sh
bash debian-extras-and-settings.sh

---

## Scripts overview

### 1. `install-flatpak.sh`

Installs Flatpak support and enables Flathub.

This script:

- Installs Flatpak
- Installs the GNOME Software Flatpak plugin
- Adds the Flathub repository (if not already present)

This enables installing and updating desktop applications independently from the base system.

---

### 2. `debian-apps-setup.sh`

Removes selected preinstalled applications and installs commonly used desktop software.

#### Removed applications (APT, if present)

- Evince (PDF viewer)
- Thunderbird (APT version)
- Evolution
- Simple Scan (APT version)
- Totem (GNOME Videos), if installed

These are replaced with Flatpak-based alternatives to avoid duplicate applications and outdated versions.

#### Installed via APT

- **Wine** (for running Windows applications, optional)

#### Installed via Flatpak (Flathub)

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

---

### 3. `debian-extras-and-settings.sh`

Applies small but useful desktop improvements.

This script:

- Enables selected GNOME extensions:
  - Dash to Dock
  - AppIndicator / KStatusNotifierItem Support
- Sets sensible default applications (PDF, audio, video, mail, browser)

No deep shell customization is enforced.  
Users can adjust settings later if desired.

---

## Additional configuration

The application setup script grants the Google Chrome Flatpak permission to create:

- desktop launchers
- application icons

This is required for installing **Progressive Web Apps (PWAs)** properly.

---

## Scope and limitations

These scripts intentionally:

- do **not** modify kernels or drivers
- do **not** replace system components
- do **not** enforce heavy GNOME customization
- do **not** attempt full system automation

They are meant for **private desktop systems** and **everyday use**, not for enterprise management.

---

## License

MIT License
