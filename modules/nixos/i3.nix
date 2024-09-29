{ config, pkgs, lib, ... } : 
{
 config = {
    
    environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw
    services.xserver = {
        enable = true;
        
        desktopManager = {
            xterm.enable = false;
            xfce = {
                enable = true;
                noDesktop = true;
                enableXfwm = false;
            };
            wallpaper = {
                combineScreens = true;
                mode = "fill";
            };
        };

        windowManager.i3 = {
            enable = true;
            extraPackages = with pkgs; [
                i3status
                i3lock
                rofi
            ];
        };
    };

    services.displayManager.defaultSession = "xfce+i3";
  };
}
