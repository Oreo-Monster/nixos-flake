{ config, pkgs, lib, ... } : 
{
 config = {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    environment.systemPackages = with pkgs; [
      mako
      libnotify
      swww
      rofi-wayland
      networkmanagerapplet
      waybar
      (waybar.overrideAttrs (oldAttrs: {
        mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
      )
    ];
  };
}
