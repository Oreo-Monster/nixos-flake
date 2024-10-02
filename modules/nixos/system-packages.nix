{
  config,
  pkgs,
  lib,
  ...
}: {
  config = {
    environment.systemPackages = with pkgs; [
      neovim
      wget
      kitty
      tmux
      tree
      home-manager
      git
    ];
  };
}
