{ config, lib, pkgs, ... }:

{

  imports =
    [
      ./hardware-configuration.nix
    ];

  # Remove unecessary preinstalled packages
  environment.defaultPackages = [ ];
  services.xserver.desktopManager.xterm.enable = false;


  # Set up only essential programs here
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    acpi
    tlp
    git
    wget
    alacritty
    gcc
    gnumake
  ];

  # Install fonts
  fonts = {
    fonts = with pkgs; [
      jetbrains-mono
      roboto
      openmoji-color
      (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    ];

    fontconfig = {
      hinting.autohint = true;
      defaultFonts = {
        emoji = [ "OpenMoji Color" ];
      };
    };
  };

  nix = {
    settings.auto-optimise-store = true;
    settings.allowed-users = [ "caleb" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs = true
      keep-derivations = true
    '';
  };

  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
    windowManager.qtile.enable = true;
    windowManager.dwm = {
      enable = true;
      package = pkgs.dwm.overrideAttrs {
        src = ./config/dwm;
      };
    };
    displayManager.sessionCommands = ''
      feh --bg-fill --randomize ~/nixos-dotfiles/wallpapers/*
    '';
  };

  services.displayManager.ly.enable = true;

  # Sound

  hardware.pulseaudio.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = false;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Disable bluetooth, enable pulseaudio, enable opengl (for Wayland)
  hardware = {
    bluetooth.enable = false;
  };

  users.users.caleb = {
    isNormalUser = true;
    extraGroups = [ "input" "wheel" ];
    packages = with pkgs; [
      tree
    ];
  };

  networking = {
    hostName = "cdell";
    networkmanager.enable = true;

    firewall = {
      enable = true;
      allowedTCPPorts = [ 443 80 ];
      allowedUDPPorts = [ 443 80 44857 ];
      allowPing = false;
    };
  };

  time.timeZone = "Pacific/Auckland";
  i18n.defaultLocale = "en_US.UTF-8";

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      efiSupport = true;
      useOSProber = false;
      devices = [ "nodev" ];
    };
  };

  # Stay Away From this !
  # DO NOT DELETE THIS
  system.stateVersion = "25.05";
  # Did you read the comment?

}

