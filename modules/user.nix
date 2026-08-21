{...}: # так как это функция, такая запись валидна, хоть ее можно и убрать
{
	users.users."kiwi" = {
	    isNormalUser = true;
	    description = "Victor"; # фактически поле «GECOS» или «comment» в файле /etc/passwd.
	    extraGroups = [ "networkmanager" "wheel" ]; # группы куда включат юзера, wheel - разрешено укправлять sudo
	  };
}
