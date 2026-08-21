{pkgs, ...}:
{
	nixpkgs.config.allowUnfree = true;

	nix.settings.experimental-features = [
	  "nix-command"
	  "flakes"
	];
	
	environment.systemPackages = with pkgs; [ # "внутри скобок ищи имена в pkgs" -> [pkgs.kitty pkgs.git]
	    kitty
	    git
	    micro
	    nemo
	    #gvfs # для nemo - избыточно, так как модуль services.gvfs сам добавляет пакет в systemPackages
	    amnezia-vpn
	    firefox
	    vscode
	    waybar
	    swaybg
	    wofi
	    swaylock
	    telegram-desktop
	    adwaita-icon-theme
	    #tuigreet # можно не писать - так как в модуле desktop.nix  есть интерполяция деривации tuigreet 
	    figma-linux
	    hyprpicker
	    obsidian
	    gcc
	    clang-tools
	  ];
}
