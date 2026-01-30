{ inputs, pkgs, lib, ...}:

# Note that terracotta, everforest-dark-hard, cupcake, charcoal-dark, chalk, atelier-estuary looked nice as well, would be good to learn how to switch between them.
let
  theme = "${pkgs.base16-schemes}/share/themes/terracotta-dark.yaml";
in
{
  stylix = {
    enable = true;
    base16Scheme = theme;
    image = ./shrew-wallpaper-16.jpg;
    opacity = {
      terminal = 0.9;
      popups = 0.9;
      desktop = 0.9;
    };
    cursor = {
      package = pkgs.capitaine-cursors-themed;
      name = "Capitaine Cursors (Gruvbox)";
      size = 20;
    };
    fonts = {
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
	name = "JetBrains Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
	name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
	name = "DejaVu Serif";
      };
    };
  };
}
