{ config, pkgs, lib, ... } : 
{
 config = {
    environment.systemPackages = with pkgs; [
      neovim 
      wget
      kitty
      firefox
      tmux
      tree
    ];
  };
}
