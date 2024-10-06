# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./../../modules/nixos/nvidia.nix
    ./../../modules/nixos/i3.nix
    ./../../modules/nixos/system-packages.nix
    ./../../modules/nixos/fonts.nix
    ./../../modules/nixos/ollama.nix
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.luks.devices."luks-6cfdbd06-865a-4d5c-b4f4-28835a12865c".device = "/dev/disk/by-uuid/6cfdbd06-865a-4d5c-b4f4-28835a12865c";
  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  #User
  users.users.eda = {
    isNormalUser = true;
    description = "eda";
    extraGroups = ["networkmanager" "wheel"];
    packages = with pkgs; [];
  };
  #Set up ZSH for the system
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  environment.pathsToLink = ["/share/zsh"];

  # Allow unfree packages
  nixpkgs.config = {
    allowUnfree = true;
    # Needed for Obsidian
    permittedInsecurePackages = [
      "electron-24.8.6"
    ];
  };

  # Enable the OpenSSH daemon.
  programs.ssh = {
    startAgent = true;
  };

  #Sound
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  system.stateVersion = "24.05";
}
