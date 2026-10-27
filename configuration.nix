{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking = {
    networkmanager.enable = true;
    hostName = "katiapc";
    firewall.enable = true;
    nftables.enable = true;
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
  };

  hardware = {
    graphics = {
      enable = true;
    };
    nvidia = {
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
    };
    i2c.enable = true;
  };

  services = {
    xserver.videoDrivers = [ "nvidia" ];
    power-profiles-daemon.enable = true;
    displayManager.ly.enable = true;
    printing.enable = true;
    usbmuxd.enable = true;
    pulseaudio.enable = false;
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
    # 2972 - JA11
    udev.extraRules = ''
      ATTRS{idVendor}=="2972", ATTRS{idProduct}=="0102", MODE="0660", GROUP="users"
    '';
  };

  swapDevices = [
    {
      device = "/var/lib/swapfile";
      size = 16 * 1024;
    }
  ];

  time.timeZone = "Europe/Kyiv";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "uk_UA.UTF-8";
      LC_IDENTIFICATION = "uk_UA.UTF-8";
      LC_MEASUREMENT = "uk_UA.UTF-8";
      LC_MONETARY = "uk_UA.UTF-8";
      LC_NAME = "uk_UA.UTF-8";
      LC_NUMERIC = "uk_UA.UTF-8";
      LC_PAPER = "uk_UA.UTF-8";
      LC_TELEPHONE = "uk_UA.UTF-8";
      LC_TIME = "en_GB.UTF-8";
    };
  };

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    auto-optimise-store = true;
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [
      "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
    ];
  };

  security.rtkit.enable = true;

  users.users."dima" = {
    isNormalUser = true;
    description = "dima";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      bash-language-server
      emmet-language-server
      gopls
      vscode-langservers-extracted # css, html, json, eslint
      lua-language-server
      stylua
      tailwindcss-language-server
      typescript-language-server
      nil

      black
      isort
      prettier
      prettierd
      shellcheck
      shfmt
    ];
  };

  fonts = {
    packages = with pkgs; [
      commit-mono
    ];

    fontconfig.defaultFonts = {
      monospace = [ "CommitMono" ];
      sansSerif = [ "Noto Sans" ];
      serif = [ "Noto Serif" ];
    };
  };

  qt.platformTheme = "qt5ct";

  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      xwayland.enable = true;
    };
    nh = {
      enable = true;
      flake = "/home/dima/nix";
      clean.enable = true;
      clean.extraArgs = "--keep 5 --keep-since 6d";
    };
    firefox.enable = true;
    yazi.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
      vimAlias = true;
    };
    bat.enable = true;
    zoxide = {
      enable = true;
      flags = [ "--cmd cd" ];
    };
    ente-auth.enable = true;
    starship = {
      enable = true;
      enableZshIntegration = true;
    };
    zsh = {
      enable = true;
    };
    fzf = {
      keybindings = true;
      fuzzyCompletion = true;
    };
    tmux = {
      enable = true;
    };
    obs-studio.enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment = {
    sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    systemPackages = with pkgs; [
      bitwarden-desktop
      bottom
      brave-origin
      calc
      ddcutil
      fastfetch
      firefox-devedition
      fzf
      fzf-zsh-plugin
      gcc
      ghostty
      gnumake
      kdePackages.dolphin
      mailspring
      nemo
      nodejs
      playerctl
      telegram-desktop
      tree-sitter
      unzip
      vesktop
      vivaldi
      vivaldi-ffmpeg-codecs
      vlc
      zed-editor
      zsh-fzf-tab
      zsh-syntax-highlighting
      ripgrep
      fd
      yt-dlp
      imv
      eza
    ];
  };

  system.stateVersion = "26.05"; # Did you read the comment?
}
