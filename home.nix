{
  pkgs,
  lib,
  config,
  ...
}:
{
  imports = [
    ./homeModules/noctalia
    ./homeModules/hyprland
  ];

  home.username = "dima";
  home.homeDirectory = "/home/dima";

  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  home.pointerCursor = {
    enable = true;
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
    hyprcursor = {
      enable = true;
      size = 20;
    };
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "lavender";
    gtk.icon.enable = true;
    zsh-syntax-highlighting.enable = true;
    kvantum = {
      enable = true;
      apply = true;
      flavor = "mocha";
      assertStyle = true;
    };
    qt5ct = {
      enable = true;
      assertPlatformTheme = true;
    };
  };
  catppuccin.tmux.extraConfig = ''
    set -g @catppuccin_window_status_style "rounded"
    set -g @catppuccin_window_text " #W"
    set -g @catppuccin_window_current_text " #W"
  '';

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  gtk = {
    enable = true;
    theme = {
      name = "catppuccin-mocha-lavender-standard";
      package = pkgs.catppuccin-gtk.override {
        variant = "mocha";
        accents = [ "lavender" ];
      };
    };
  };

  programs = {
    bat.enable = true;
    eza = {
      enable = true;
      enableZshIntegration = false;
    };
    fzf.enable = true;
    ghostty.enable = true;
    imv.enable = true;
    obs-studio.enable = true;
    starship.enable = true;
    tmux = {
      enable = true;
      baseIndex = 1;
      clock24 = true;
      disableConfirmationPrompt = true;
      customPaneNavigationAndResize = true;
      keyMode = "vi";
      mouse = true;
      terminal = "tmux-256color";
      extraConfig = ''
        set -as terminal-features ",*:RGB"
        bind '"' split-window -v -c "#{pane_current_path}"
        bind % split-window -h -c "#{pane_current_path}"

        set-option -g status-position top
        set-option -g renumber-windows on

        set -gq allow-passthrough on
        set -g status-right-length 100
        set -g status-left ""
        set -g status-right "#{E:@catppuccin_status_session}#{E:@catppuccin_status_directory}"
      '';
    };
    vesktop.enable = true;
    yazi = {
      enable = true;

      plugins = {
        smart-paste = pkgs.yaziPlugins.smart-paste;
        mediainfo = pkgs.yaziPlugins.mediainfo;
        epub-preview = pkgs.fetchFromGitHub {
          owner = "kirasok";
          repo = "epub-preview.yazi";
          rev = "main";
          hash = "sha256-QP92Uk7hDkZduwRSMNXMOygCUeBlXrL7JnKdK1wIRsQ=";
        };
      };
      extraPackages = [ pkgs.mediainfo ];
      keymap = {
        mgr.prepend_keymap = [
          {
            on = "p";
            run = "plugin smart-paste";
            desc = "Paste into the hovered directory or CWD";
          }
          {
            on = "K";
            run = "seek -10";
            desc = "Seek up 10 units in the preview";
          }
          {
            on = "J";
            run = "seek 10";
            desc = "Seek down 10 units in the preview";
          }
        ];
        mgr.append_keymap = [
          {
            on = [
              "g"
              "p"
            ];
            run = "cd ~/dev";
            desc = "Go to the projects directory";
          }
          {
            on = [
              "g"
              "m"
            ];
            run = "cd ~/Downloads/Movies/";
            # run = "cd ~/media/Disk/Movies";
            desc = "Go to the movies directory";
          }
          {
            on = [
              "g"
              "r"
            ];
            run = ''shell -- ya emit cd "$(git rev-parse --show-toplevel)"'';
            desc = "Go to the git root";
          }
        ];
      };
      settings = {
        mgr = {
          sort_by = "natural";
          sort_translit = true;
          linemode = "size";
        };
        tasks.image_alloc = 1073741824;
        plugin = {
          prepend_preloaders = [
            {
              mime = "image/*";
              run = "mediainfo";
            }
            {
              mime = "video/*";
              run = "mediainfo";
            }
            {
              mime = "audio/*";
              run = "mediainfo";
            }
            {
              mime = "application/{subrip,postscript,illustrator,dvb.ait,vnd.adobe.illustrator,eps}";
              run = "mediainfo";
            }
            {
              url = "*.{ai,eps,ait}";
              run = "mediainfo";
            }
          ];
          prepend_previewers = [
            {
              mime = "image/*";
              run = "mediainfo";
            }
            {
              mime = "video/*";
              run = "mediainfo";
            }
            {
              mime = "audio/*";
              run = "mediainfo";
            }
            {
              mime = "application/{subrip,postscript,illustrator,dvb.ait,vnd.adobe.illustrator,eps}";
              run = "mediainfo";
            }
            {
              url = "*.{ai,eps,ait}";
              run = "mediainfo";
            }
            {
              mime = "application/epub+zip";
              run = "epub-preview";
            }
          ];
        };
        opener.set-wallpaper = [
          {
            run = "noctalia msg wallpaper-set %s";
            for = "linux";
            desc = "Set as wallpaper";
          }
        ];
        open.prepend_rules = [
          {
            mime = "image/*";
            use = [
              "open"
              "set-wallpaper"
              "reveal"
            ];
          }
        ];
      };
    };

    zathura.enable = true;
    zed-editor.enable = true;
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      defaultKeymap = "viins";
      history = {
        ignoreAllDups = true;
      };
      historySubstringSearch = {
        enable = true;
        searchUpKey = [
          "^P"
          "^[[A"
        ];
        searchDownKey = [
          "^N"
          "^[[B"
        ];
      };

      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
        cat = "bat";
        gl = "git log --stat --graph --decorate";
        grep = "grep --color=auto";
        la = "eza --all --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first";
        ll = "eza -lah --git --group --time-style='+%d-%b-%y %H:%M' --icons=always --group-directories-first";
        lsl = "eza -lh --group --color=auto --time-style='+%d-%b-%y %H:%M' --git --icons=always --group-directories-first";
        ls = "eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions --group-directories-first";
        lt = "eza --tree --no-time --long --level=2 --icons --git --group-directories-first";
        open = "handlr open";
        cp = "cp -iv";
        mv = "mv -iv";
        rm = "rm -Iv";
        tm = "~/.scripts/tmux.sh";
        tn = "tmux new -s terminal";
        ta = "~/.scripts/tmux-attach.sh";
        tl = "tmux ls";
        c = "clear";
        ntt = "NVIM_APPNAME=nvim-test nvim";
        bios = "systemctl reboot --firmware-setup";
        nrs = "sudo nixos-rebuild switch --flake ~/nix";
        nrt = "sudo nixos-rebuild test --flake ~/nix";
        nrb = "sudo nixos-rebuild build --flake ~/nix";
        upd = "nix store diff-closures /run/current-system ~/result | rg '→' | rg -v '∅'";
      };
      initContent = ''
        zstyle ':completion:*' menu no
        zstyle ':fzf-tab:*' use-fzf-default-opts yes
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
        source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
        mdcd() {
          mkdir -p "$1" && cd "$1"
        }
        bindkey -M viins '^@' autosuggest-accept
        bindkey -M vicmd '^@' autosuggest-accept
        bindkey -M viins '^F' forward-word
        bindkey -M vicmd '^F' forward-word
      '';
    };

    git = {
      enable = true;
      includes = [ { path = "~/.config/git/identity"; } ];
      settings = {
        init.defaultBranch = "main";
        merge.conflictStyle = "diff3";
        diff.colorMoved = "zebra";
      };
    };

    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        navigate = true;
        side-by-side = true;
      };
    };
  };

  xdg.configFile."yazi/theme.toml".source = lib.mkForce (
    pkgs.runCommand "yazi-theme-transparent" { } ''
      substitute \
        ${config.catppuccin.sources.yazi}/${config.catppuccin.yazi.flavor}/catppuccin-${config.catppuccin.yazi.flavor}-${config.catppuccin.yazi.accent}.toml \
        $out \
        --replace-fail 'overall = { bg = "#1e1e2e" }' 'overall = { bg = "reset" }'
    ''
  );
  # Same as system.stateVersion in configuration.nix
  # Do not change
  home.stateVersion = "26.05";
}
