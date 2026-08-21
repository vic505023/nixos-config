{
	time.timeZone = "Europe/Moscow";

	i18n.defaultLocale = "ru_RU.UTF-8";

	# вместо ручного редактирования /etc/locale.conf
	i18n.extraLocaleSettings = {
	    LC_ADDRESS = "ru_RU.UTF-8"; # формат почтового адреса
	    LC_IDENTIFICATION = "ru_RU.UTF-8"; # метаданные локали для программ
	    LC_MEASUREMENT = "ru_RU.UTF-8"; # система мер
	    LC_MONETARY = "ru_RU.UTF-8"; # валюта
	    LC_NAME = "ru_RU.UTF-8"; # порядок имя/фамилия в формах
	    LC_NUMERIC = "ru_RU.UTF-8"; # разделитель дробной части, сейчас ","
	    LC_PAPER = "ru_RU.UTF-8"; # размер бумаги для печати по умолчанию, чейчас - А4
	    LC_TELEPHONE = "ru_RU.UTF-8"; # формат тел. номера
	    LC_TIME = "ru_RU.UTF-8"; # формат даты и времени
	};
}
