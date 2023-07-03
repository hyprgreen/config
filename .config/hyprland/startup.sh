#!/usr/bin/env bash
#
# start gnome polkit
/usr/libexec/polkit-gnome-authentication-agent-1 &


# set gtk theme
#gsettings set org.gnome.desktop.interface gtk-theme "Catppuccin-Mocha-Standard-Green-Dark"
#gsettings set org.gnome.desktop.interface icon-theme "Catppuccin-Mocha"
#gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
#gsettings set org.gnome.desktop.interface cursor-size '36'
#gsettings set org.gnome.desktop.interface font-name "ComicMono Nerd Font 13"

# xdg dekstop portal repair on startup
systemctl --user import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK &&\
  dbus-update-activation-environment --systemd import-environment DISPLAY WAYLAND_DISPLAY SWAYSOCK &&\
  killall xdg-desktop-portal &&\
  systemctl --user restart piewire &

# waybar
waybar &

# mako notifications
mako &

# wallpaper
swaybg -m fill -i /usr/share/backgrounds/default.png &

# wlsunset
#wlsunset  -l 31.95 -L 115.86 -t 4000 -T 6500 &

# sway idle
swayidle -w \
          timeout 2700 'swaylock -f -c 000000' \
          timeout 5400 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
          before-sleep 'swaylock -f -c 3600' &
