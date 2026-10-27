{
  config,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/nix/homeModules/hyprland/hypr";
in
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    portalPackage = null;
    systemd.enable = false;
  };
  xdg.configFile."hypr/hyprland.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/hyprland.lua";
  xdg.configFile."hypr/modules".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/modules";

  xdg.configFile."uwsm/env".source =
    "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh";
}
