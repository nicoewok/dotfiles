# NixOS Monochrome Pixel Rice

This repository contains the declarative dotfiles and system configurations for a minimalist, 8-bit arcade workstation built entirely on **NixOS**.

It relies on a dark terminal, muted pastel accents, and pixel bitmap fonts to deliver a highly contrasted, distraction-free environment.

---

## THE TECH STACK

* **OS:** [NixOS](https://nixos.org/) (Generations capped at 5; automated weekly Garbage Collection).
* **Window Manager:** [Hyprland](https://hyprland.org/) (Dynamic Wayland tiling, heavily keyboard-driven).
* **Terminal:** [Kitty](https://sw.kovidgoyal.net/kitty/) (Global AA disabled, 12px internal padding for 8-bit glyph safety).
* **Shell & Prompt:** [Starship](https://starship.rs/) (Multi-line prompt structure tracking deep paths and live Git states).
* **Launcher & Menus:** [Fuzzel](https://codeberg.org/dnkl/fuzzel) (Handles apps and a custom `CANCEL | SHUTDOWN | RESTART` power script).
* **Lock Screen:** Hyprlock (Centered text-mode NixOS ASCII snowflake, NumLock strictly forced ON).
* **Wallpaper Daemon:** Hyprpaper.
* **Eyecandy:** Fastfetch (NixOS ASCII mode), CAVA, Pipes-rs, Cmatrix.
* **Dev Environment:** Go (`~/go/bin` in PATH), Git (Seamlessly authenticated via GitHub PAT).

---

# NixOS configurations + packages (programms I use)
I don't provide the configuration.nix, but if you want to use a similar config, see the [nix-config](/nix/configuration.nix.txt). The comments explain which parts belong where in the ```configuration.nix```.

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
2. Packages:
    1. Copy the files from `/nix` into your `/etc/nixos` folder
    2. Edit `configuration.nix.txt` to match your current configuration.nix (look at TODOs)
    3. Apply changes using ```sudo nixos-rebuild switch```
3. Configs
    1. Move folders including their files from `/.config` to your `~/.config`
    2. For wallpapers and images to work:
        - Move contents of `/style` into your `~/Pictures` folder
        - Inside, there is a `colors.md` file which describes the styleguide
    3. Hyprland, Hyprlock and Hyprpaper: change to your user's paths according to the "TODO" comments
    4. Fastfetch: change the image path to fit your user's `Pictures` path (see TODO)
4. Apps:
    - Copy files from `/bin` to `~/.local/bin`

---

## Shortcuts (Hyprland)

| Shortcut | Action |
| :--- | :--- |
| **Window Management** | |
| `SUPER` + `W` | Kill/Close active window |
| `SUPER` + `Space` | Toggle floating state |
| `SUPER` + `F` | Toggle fullscreen |
| `SUPER` + `P` | Toggle pseudo-tiling (Dwindle) |
| **System & Power** | |
| `SUPER` + `L` | Lock screen (Hyprlock) |
| `SUPER` + `SHIFT` + `L` / `M` | Exit Hyprland session |
| `SUPER` + `Escape` | Custom Fuzzel power menu script |
| `Print Screen` | Custom Fuzzel screenshot/capture deck |
| **Applications** | |
| `SUPER` + `Q` | Kitty (Terminal) |
| `SUPER` + `B` | Brave Browser |
| `SUPER` + `E` | Thunar (File Manager) |
| `SUPER` + `R` | Micro Editor (inside Kitty) |
| `SUPER` + `C` | VS Code |
| `SUPER` + `I` | IntelliJ IDEA Ultimate |
| `SUPER` + `G` | GitKraken |
| `SUPER` + `D` | Vesktop (Discord) |
| `SUPER` + `S` | Spotify (Native Wayland) |
| `SUPER` + `A` | Wofi Launcher |
| `SUPER` + `V` | Pavucontrol (Audio Mixer) |
| `SUPER` + `SHIFT` + `S` | Cava Visualizer (inside Kitty) |
| **Workspaces & Displays** | |
| `SUPER` + `1` - `4` | Switch to Workspaces 1-4 (1st Monitor) |
| `SUPER` + `5` - `8` | Switch to Workspaces 5-8 (2nd Monitor) |
| `SUPER` + `SHIFT` + `1` - `6` | Move active window to Workspaces 1-6 |
| `SUPER` + `Tab` | Move active window to Special Workspace |
| `SUPER` + `SHIFT` + `Tab` | Toggle Special Workspace visibility |
| `SUPER` + `SHIFT` + `Left` | Move active window to Left Monitor |
| `SUPER` + `SHIFT` + `Right` | Move active window to Right Monitor |
| **Navigation & Sizing** | |
| `SUPER` + `Arrow key` | Move active window directionally |
| `SUPER` + `CTRL` + `Arrow key` | Resize active window interactively (hold to scale) |


---

## Color Palette

Design guide and color palette can be found [here](/style/colors.md).

---

## Displays

The configuration is explicitly mapped for a dual-monitor setup:
1. **Primary (DP-2):** 1440p Landscape. `fit_mode = cover`. The main operational viewport.
2. **Secondary (HDMI-A-1):** 1440p Portrait (Rotated 90°). `fit_mode = contain`.
If you want to edit this, see the first lines of the [Hyprland config](/.config/hypr/hyprland.conf)

---






