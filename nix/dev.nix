# /etc/nixos/developer.nix
{ pkgs, ... }: {
  environment = {
  	variables = {
	    PKG_CONFIG_PATH = "/run/current-system/sw/lib/pkgconfig";
	    MAMBA_ROOT_PREFIX = "/home/nicolang/.mamba";
	    MAMBA_EXE = "${pkgs.micromamba}/bin/micromamba";
	};	
	shellAliases = {
		dev-edit = "sudo micro /etc/nixos/dev.nix";
	};

	systemPackages = with pkgs; [
	    # Version Control
	    git
	    gitkraken
	
	    # Editors & Testing
	    vscode
	    postman
	
	    # Runtimes & Compilers
	    python3
	    python3Packages.pip
	    micromamba
	    nodejs_22
	    go
	    jdk21
	    gcc
	    cmake
	
	    # Rust Native Toolchain & GUI Libraries
	    cargo
	    rustc
	    pkg-config
	    gtk3
	    pango
	    glib
	    cairo
	    gdk-pixbuf
	    gtk-layer-shell
	
	    # System & Containers
	    docker-compose
	    efibootmgr
	  ];
  };

  #For Conda
  programs.bash.interactiveShellInit =
  ''
      eval "$($MAMBA_EXE shell hook -s bash)"
  '';
  programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
  };

  # ┌─ NIX-LD COMPATIBILITY LAYER ─┐
  # └─> Dynamic linker shim for pre-compiled binary execution
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # Core system requirements
    stdenv.cc.cc
    glibc
    glib
    zlib
    openssl
    curl
    git
    
    # GUI and Electron requirements for the IDE
    alsa-lib
    atk
    cairo
    cups
    dbus
    expat
    fontconfig
    freetype
    gdk-pixbuf
    gtk3
    libGL
    libsecret  # Critical for saving Google AI account authentication tokens
    libuuid
    libxcb
    libxshmfence
    libgbm
    mesa
    nspr
    nss
    pango
    systemd
    wayland    # Essential for smooth scaling on modern compositors
    
    # X11 / Xwayland fallback libraries
    libX11
    libXcomposite
    libXcursor
    libXdamage
    libXext
    libXfixes
    libXi
    libXrandr
    libXrender
    libXtst
    libxkbcommon
  ];
}
