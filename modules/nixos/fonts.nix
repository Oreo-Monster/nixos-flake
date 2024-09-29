{ lib, config, pkgs, ... }:

{
  options = {};

  config = {
      fonts.packages = with pkgs; [
        (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "SourceCodePro" ]; }) 
      ];
  };
}
