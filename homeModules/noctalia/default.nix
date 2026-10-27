{ inputs, config, ... }:
let
  dotfiles = "${config.home.homeDirectory}/nix/homeModules/noctalia";
in
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

  xdg.configFile."noctalia/settings.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/settings.toml";
}
