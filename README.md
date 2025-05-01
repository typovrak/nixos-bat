# 📚 NixOS Bat

> NixOS module to install bat, a cat clone with syntax highlighting, with Catppuccin mocha theme, secure config and pre-built cache.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/bat``` with ```700``` permissions and correct ownership.

- 🎨 **Catppuccin mocha green theme :** Deploys ```catppuccin-mocha.tmTheme``` into ```~/.config/bat/themes``` for consistent styling.

- ⚙️ **Config deployment :** Installs your ```config``` into ```~/.config/bat/config``` with ```600``` permissions.

- ⚡ **Cache build :** Runs ```bat cache --build``` as the user to pre-compile syntax and theme cache.

- 📦 **Package installation :** Ensures ```bat``` is installed via ```environment.systemPackages```.

- 🔄 **Idempotent :** Cleans and recreates config and themes on each rebuild without removing other user data.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing ```~/.config/bat``` before applying changes.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/bat{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-bat = fetchGit {
    url = "https://github.com/typovrak/nixos-bat.git";
    ref = "main";
    rev = "4f4a89ee94b19f3869c5a7b6c2f49104d3ffdf73"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-bat}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Use ```bat``` just like ```cat``` on a file, with syntax highlighting and the Catppuccin mocha green theme
```bash
bat file.txt
```

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
