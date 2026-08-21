{
	networking.hostName = "nixos"; # определение hostname
	networking.networkmanager.enable = true;

	# Открывает порты во время фаервола
	# networking.firewall.allowedTCPPorts = [ ... ];
	# networking.firewall.allowedUDPPorts = [ ... ];
	# убирает фаервол (по умолчанию он есть)
	# networking.firewall.enable = false;
       
	# для amnezia-vpn нет готового модуля в nixpkgs, который бы сам сгенерировал systemd-юнит
 	systemd.services.amnezia-vpn = {
	    description = "AmneziaVPN background service"; # просто описание
	    wantedBy = [ "multi-user.target" ]; # запускатеся автоматически при загрузке каждой системы
	    # в момент, когда открывается greetd
	    serviceConfig = {# прямое отражение секции [Service] из классического .service-файла systemd
	        ExecStart = "/run/current-system/sw/bin/AmneziaVPN-service";
	        Restart = "on-failure"; # автоматический перезапуск если процесс упадет
	    };
	};
}
