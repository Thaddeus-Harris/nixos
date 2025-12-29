{ inputs, pkgs, ...}:

{
wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "foot"; 
      startup = [
        # Launch Firefox on start
        {command = "qutebrowser";}
      ];
      let modifier = config.xsession.windowManager.i3.config.modifier;
      in lib.mkOptionDefault {
        "${modifier}+b" = "exec qutebrowser";
    };
  };
}
