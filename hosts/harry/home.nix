{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "tyh";
  home.homeDirectory = "/home/tyh";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  #Allow Federal Spyware Packages
  nixpkgs.config.allowUnfree = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  services.gammastep = {
    enable = true;
    provider = "manual";
    latitude = 42.1;
    longitude = -71.05;
  };
  services.blanket.enable = true;
  programs.wezterm.enable = true;
  programs.kitty.enable = true;
  programs.waybar.enable = true;
  programs.eww.enable = true;
  home.packages = with pkgs; [
    #Non-essential utils
    fzf busybox xfce.thunar wineWowPackages.waylandFull syncthing mpv thunderbird pandoc rockbox-utility yt-dlp  baobab activitywatch awatcher 
    #Productivity
    libreoffice kdePackages.okular firefox librewolf qutebrowser dropbox kdePackages.dolphin bash iamb weechat qbittorrent obsidian ollama calibre lynx kicad-small anki texliveFull
    #Programming Packages 
    neovim ghc rustup gcc qmk typst gprolog
    #Entertainment
    legcord ani-cli mov-cli protonup element-desktop eww prismlauncher heroic spotify

    ];

      
    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/tyh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
