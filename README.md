[![NixOS 26.05+](https://img.shields.io/badge/NixOS-26.05%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

# 📚 NixOS Bat

> NixOS module to install bat, a cat clone with syntax highlighting, with Catppuccin mocha theme, secure config and pre-built cache.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🔒 **Secure config directory :** Creates ```~/.config/bat``` with ```700``` permissions and correct ownership.
- 🎨 **Catppuccin mocha green theme :** Deploys ```catppuccin-mocha.tmTheme``` into ```~/.config/bat/themes``` for consistent styling.
- ⚙️ **Config deployment :** Installs your ```config``` into ```~/.config/bat/config``` with ```600``` permissions.
- ⚡ **Cache build :** Runs ```bat cache --build``` as the user to pre-compile syntax and theme cache.
- 📦 **Package installation :** Ensures ```bat``` is installed via ```environment.systemPackages```.
- 🔄 **Idempotent :** Cleans and recreates config and themes on each rebuild without removing other user data.
- 💾 **Backup guidance :** Documentation includes commands to back up any existing ```~/.config/bat``` before applying changes.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── catppuccin-mocha.tmTheme # catppuccin mocha green theme
├── config                   # bat configuration file
├── configuration.nix        # module configuration
├── LICENSE.md               # MIT license
└── README.md                # this documentation

1 directory, 5 files
```

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

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
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

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-bat = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-bat.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-bat}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-bat.git &&
cd nixos-bat &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

Use ```bat``` just like ```cat``` on a file, with syntax highlighting and the Catppuccin mocha green theme
```bash
bat file.txt
```

## 📚 Learn more

- 🦇 [Bat GitHub repository](https://github.com/sharkdp/bat) : Modern ```cat``` clone with syntax highlighting and Git integration.
- 🎨 [Catppuccin for bat](https://github.com/catppuccin/bat) : Theme used in this module.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
