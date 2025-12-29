{pkgs, ...}: {
  config.vim.extraPlugins = {
    aerial = {
      package = pkgs.vimPlugins.vimtex;
      setup = "require('aerial').setup {}";
    };

    harpoon = {
      package = pkgs.vimPlugins.harpoon;
      setup = "require('harpoon').setup {}";
      after = ["vimtex"];
    };
  };
}
