# NixOS Monochrome Pixel Rice

This repository contains the declarative dotfiles and system configurations for a minimalist, 8-bit arcade workstation built entirely on **NixOS**.

It relies on a dark terminal, muted pastel accents, and pixel bitmap fonts to deliver a highly contrasted, distraction-free environment.

---

## 🛠 THE TECH STACK

* **OS:** [NixOS](https://nixos.org/) (Generations capped at 5; automated weekly Garbage Collection).
* **Window Manager:** [Hyprland](https://hyprland.org/) (Dynamic Wayland tiling, heavily keyboard-driven).
* **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/) (Global AA disabled, 12px internal padding for 8-bit glyph safety).
* **Shell & Prompt:** [Starship](https://starship.rs/) (Multi-line prompt structure tracking deep paths and live Git states).
* **Launcher & Menus:** [Fuzzel](https://codeberg.org/dnkl/fuzzel) (Handles apps and a custom `CANCEL | SHUTDOWN | RESTART` power script).
* **Lock Screen:** Hyprlock (Centered text-mode NixOS ASCII snowflake, NumLock strictly forced ON).
* **Wallpaper Daemon:** Hyprpaper (Renders static pixel-art assets without scaling artifacts).
* **Eyecandy:** Fastfetch (NixOS ASCII mode), CAVA, Pipes-rs, Cmatrix.
* **Dev Environment:** Go (`~/go/bin` in PATH), Git (Seamlessly authenticated via GitHub PAT).

---

## Color Palette

Design guide and color palette can be found [here]().

---

## HARDWARE TARGETS (DISPLAYS)

The configuration is explicitly mapped for a dual-monitor setup:
1. **Primary (DP-2):** 1440p Landscape. `fit_mode = cover`. The main operational viewport.
2. **Secondary (HDMI-A-1):** 1440p Portrait (Rotated 90°). `fit_mode = contain`. Dedicated to visualizers and Go TUIs. Protected by hard size constraints (`size >600 >150`) to prevent vertical layout crushing.

If you want to edit this, see the first lines of the [Hyprland config]()

---


# NixOS configurations + packages (programms I use)
I don't provide the configuration.nix, but if you want to use a similar config, see the nix-config.txt. The comments explain which parts belong where in the ```configuration.nix```.

Edit using
```bash
sudo nano /etc/nixos/configuration.nix
```

Apply changes using:
```bash
sudo nixos-rebuild switch
```


## INSTALLATION GUIDE
Follow these steps to replicate this exact workstation on a fresh NixOS installation.

1. Clone the Repository
```bash
git clone [https://github.com/yourusername/dotfiles.git](https://github.com/yourusername/dotfiles.git) ~/dotfiles
```
2. Wallpaper
- hyprpaper.conf file expects a specific pixel-art image file.
- Create the necessary directory: ```mkdir -p ~/Pictures/wallpapers```
- Place your desired retro pixel-art wallpaper into that folder and name it 13.png.

3. Link/Apply Configurations
Copy or symlink the dotfiles to their proper locations.

Copy all using:
```bash
cp -r ~/dotfiles/.config/* ~/.config/
```
Or just copy them one by one.
