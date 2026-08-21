{
	services.gvfs.enable = true; # даёт nemo монтирование флешек, корзину, доступ по sftp/mtp
	security.rtkit.enable = true;
	# без этого pipewire не может получить realtime-приоритет для аудио
	# (в логах была ошибка: RTKit error: org.freedesktop.DBus.Error.ServiceUnknown)
}
