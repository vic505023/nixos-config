# ЭТО 1 ФУНКЦИЯ
{ config, pkgs, ... }: # принимает аргументы

{ # то, что возвращает функция
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true; # а возвращают функции пары ключ-значение
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  services.xserver.enable = false;

  networking.hostName = "nixos"; # определение hostname
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };
  
  # services.udisks2.enable = true; # можно не писать т.к. в исходнике gvfs этот флаг и так проставляется
  services.gvfs.enable = true; # даёт nemo монтирование флешек, корзину, доступ по sftp/mtp

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."kiwi" = {
    isNormalUser = true;
    description = "Victor";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [ # "внутри скобок ищи имена в pkgs" -> [pkgs.kitty pkgs.git]
    kitty
    git
    micro
    nemo
    amnezia-vpn
    gvfs
    firefox
    vscode
    waybar
    swaybg
    wofi
    swaylock
    telegram-desktop
    adwaita-icon-theme
    tuigreet
    figma-linux
    hyprpicker
    obsidian
    gcc
    clang-tools
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.sessionVariables = {
      XCURSOR_THEME = "Adwaita";
      XCURSOR_SIZE = "24";
    };

  systemd.user.settings.Manager = {
    DefaultEnvironment = "XCURSOR_THEME=Adwaita XCURSOR_SIZE=24";
  };

  # environment.etc."foo".text = "..."; # создаст в папке etc файл в уоторый запишет ...


  programs.niri.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # Это значение определяет релиз NixOS, из которого взяты дефолтные настройки для
  # «состояния» — расположения файлов, версии баз данных на твоей системе. 
  # Совершенно нормально и рекомендуется оставить это значение равным версии релиза,
  # на которой система была установлена впервые. Перед изменением значения прочитай
  # документацию по этой опции (например, man configuration.nix или
  # на https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05";

  systemd.services.amnezia-vpn = {
      description = "AmneziaVPN background service";
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        ExecStart = "/run/current-system/sw/bin/AmneziaVPN-service";
        Restart = "on-failure";
      };
    };

    services.greetd = {
        enable = true;
        settings = {
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
          };
        };
      };

}
