{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {};

  config = {
    services.ollama = {
      enable = true;
      acceleration = "cuda";
    };
  };
}
