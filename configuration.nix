{ config, pkgs, ... }:

let
	username = "typovrak";
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.bat = ''
		mkdir -p ${home}/.config
		chown ${username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/bat
		mkdir ${home}/.config/bat
		chown ${username}:${group} ${home}/.config/bat
		chmod 700 ${home}/.config/bat

		cp ${./config} ${home}/.config/bat/config
		chown ${username}:${group} ${home}/.config/bat/config
		chmod 600 ${home}/.config/bat/config

		mkdir ${home}/.config/bat/themes
		chown ${username}:${group} ${home}/.config/bat/themes
		chmod 700 ${home}/.config/bat/themes

		cp ${./catppuccin-mocha.tmTheme} ${home}/.config/bat/themes/catppuccin-mocha.tmTheme
		chown ${username}:${group} ${home}/.config/bat/themes/catppuccin-mocha.tmTheme
		chmod 600 ${home}/.config/bat/themes/catppuccin-mocha.tmTheme

		${pkgs.util-linux}/bin/runuser -u ${username} -- ${pkgs.bat}/bin/bat cache --build
	'';

	environment.systemPackages = with pkgs; [
		bat
	];
}
