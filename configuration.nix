{ config, lib, pkgs, ... }:

{

  imports =
    [
      /etc/nixos/hardware-configuration.nix
    ];

  # Remove unecessary preinstalled packages
  environment.defaultPackages = [ ];
  services.xserver.desktopManager.xterm.enable = false;

  nixpkgs.config.allowUnfree = true;

  # Set up only essential programs here
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
    thunar-volman
	thunar-media-tags-plugin
  ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };



  programs.firefox.enable = true;
  environment.systemPackages = with pkgs; [
    waybar
    foot
	kitty
    bash
    git
    wget
    alacritty
    gcc
    gnumake
    jetbrains.webstorm
    jetbrains.jdk
	xdg-utils
	catppuccin-gtk
	rose-pine-gtk-theme
	whitesur-gtk-theme
	tokyonight-gtk-theme
	sierra-gtk-theme
	lavanda-gtk-theme
	paper-gtk-theme
	qogir-theme
	nightfox-gtk-theme
  ];
# add this after environment.systemPackages, otherwise it won't be found
programs.dconf.enable = true;
# Install fonts

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

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
    desktopManager.cinnamon = {
        enable = true;
        #apps.enable = true;
    };
    displayManager.sessionCommands = ''
      feh --bg-fill --randomize ~/nixos-dotfiles/wallpapers/*
    '';
  };

  services.displayManager.ly.enable = true;

  # Sound

  services.pulseaudio.enable = true;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = false;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Disable bluetooth, enable pulseaudio, enable opengl (for Wayland)
  hardware.bluetooth.enable = false;

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
      allowedTCPPorts = [ 443 80 53317 ];
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


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # And This !

  # DO NOT DELETE THIS
  system.stateVersion = "25.05";
  # Did you read the comment?

}

