{pkgs, ...}:
{
	# services.xserver.enable = false; # она и по умолчанию false

	services.greetd = {
		enable = true;
		restart = true; # сдедует ли перезапускать greetd например во время падения
		useTextGreeter = true; # гарантирует не наложение логов в tty на интерфейс
	    settings = {
	    	default_session = {
	        	command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri-session";
	        	# тут интерполяция деривации tuigreet - можно не прописывать в systempkgs
	        };
	    };
	};

	programs.niri.enable = true;
	fonts.packages = with pkgs; [ nerd-fonts.jetbrains-mono ];
	
	environment.sessionVariables = {
	    XCURSOR_THEME = "Adwaita";
	    XCURSOR_SIZE = "24";
	};
}
