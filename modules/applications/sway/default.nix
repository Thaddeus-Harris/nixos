{ inputs, pkgs, config, lib, ...}:

let 
  modifier = config.xsession.windowManager.i3.config.modifier;
in {
  wayland.windowManager.sway = {
      enable = true;
      wrapperFeatures.gtk = true; # Fixes common issues with GTK 3 apps
      config = rec {
        modifier = "Mod4";
        # Use kitty as default terminal
        terminal = "foot"; 
	bars = [
	  {extraConfig = "status_command swayrbar \n
	                  position top";}
	  #{command = "\${pkgs.waybar}/bin/waybar";}
	  #{statusCommand = "swayrbar";} 
	];
        keybindings = lib.mkOptionDefault {
          "${modifier}+b" = "exec qutebrowser";
	  "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";
	  "XF86MonBrightnessUp" = "exec brightnessctl set 10%+";
	  "XF86AudioMute" = "exec amixer set Master toggle";
	  "XF86AudioRaiseVolume" = "exec amixer set Master 5%+";
	  "XF86AudioLowerVolume" = "exec amixer set Master 5%-";
          };
	};
  };
}
