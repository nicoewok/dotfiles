# /etc/nixos/rice.nix
{ pkgs, ... }: {

  # ┌─ CORE COMPOSITOR ─┐
  # └─> Wayland Window Manager
  programs.hyprland.enable = true;

  # ┌─ DISPLAY MANAGER (LY) ─┐
  # └─> Terminal-based TUI login screen
  systemd.services.display-manager = {
      after = [ "systemd-vconsole-setup.service" ];
      wants = [ "systemd-vconsole-setup.service" ];
  };
  services.displayManager.ly = {
    enable = true;
    settings = {
      border_fg = 2;
      bg = 0;
      fg = 3;
      blank_box = true;
      box_title = "HELP";
      clock = "%H:%M:%S";
      clear_line = true;
      animate = false;
      shutdown_key = "F12";
    };
  };

  # ┌─ CONSOLE TYPOGRAPHY & PALETTE ─┐
  # └─> Hard-coded 8-bit metric colors for Ly and TTY
  console = {
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-116n.psf.gz";
    packages = with pkgs; [ terminus_font ];
    colors = [
      "1c1c1c" "ffb7c5" "87ceeb" "f5f5dc" "b19cd9" "b19cd9" "87ceeb" "f5f5dc"
      "2a2a2a" "ffb7c5" "87ceeb" "f5f5dc" "b19cd9" "b19cd9" "87ceeb" "f5f5dc"
    ];
  };

  # ┌─ SYSTEM FONTS ─┐
  # └─> High-density bitmap scaling grids
  fonts = {
    packages = with pkgs; [
      scientifica
      nerd-fonts.jetbrains-mono

      noto-fonts
      noto-fonts-color-emoji
      noto-fonts-cjk-sans
      corefonts
    ];
    fontconfig = {
      enable = true;
      allowBitmaps = false;
      useEmbeddedBitmaps = false;
      hinting.enable = true;
      antialias = true;
      defaultFonts = {
              monospace = [ "scientifica" "JetBrainsMono Nerd Font" "Noto Sans Mono" ];
              sansSerif = [ "Noto Sans" ];
              serif     = [ "Noto Serif" ];
              emoji     = [ "Noto Color Emoji" ];
            };
    };
    fontDir.enable = true;
  };

  # ┌─ TERMINAL & PROMPT ─┐
  # └─> Starship engine and Yazi explorer
  programs.starship = {
    enable = true;
    interactiveOnly = true;
  };
  programs.yazi = {
    enable = true;
  };

  # File Explorer
  services.gvfs.enable = true;      # Fixes Thunar Auto-Refresh (Issue #2)
  services.tumbler.enable = true;   # Thumbnails

  programs.thunar = {
    enable = true;
    plugins = with pkgs; [ thunar-archive-plugin ];
  };


  # ┌─ AESTHETIC PACKAGES ─┐
  # └─> Core binaries for the Rice setup
  environment.systemPackages = with pkgs; [
    kitty
    fastfetch
    swaybg
    waybar
    wofi
    hyprpaper
    hyprlock
    proggyfonts
    scientifica
    phinger-cursors
    zenity
    cava
    starship
    zathura
    poppler-utils
    fuzzel
    grim
    slurp
    mako
    adwaita-icon-theme
    lxappearance
  ];

  # ┌─ RICING ALIASES ─┐
  # └─> Quick config access
  environment.shellAliases = {
    hypr-config = "micro ~/.config/hypr/hyprland.conf";
    kitty-config = "micro ~/.config/kitty/kitty.conf";
    rice-edit = "sudo micro /etc/nixos/rice.nix";
  };
}
