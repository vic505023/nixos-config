{ config, pkgs, ... }: # файл - одна функция, тут - что она принимает

{ # то, что возвращает функция
  imports = [
    ./hardware-configuration.nix
    ./modules/boot.nix
    ./modules/locale.nix
    ./modules/desktop.nix
    ./modules/services.nix
    ./modules/networking.nix
    ./modules/packages.nix
    ./modules/user.nix
  ];

  # Это значение определяет релиз NixOS, из которого взяты дефолтные настройки для
  # «состояния» — расположения файлов, версии баз данных на твоей системе. 
  # Совершенно нормально и рекомендуется оставить это значение равным версии релиза,
  # на которой система была установлена впервые. Перед изменением значения прочитай
  # документацию по этой опции (например, man configuration.nix или
  # на https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05";
}
