{inputs, pkgs, lib, ... }:
{
programs.nvf = {
  enable = true;
  config.vim = {
      extraPlugins = {
        lean-nvim = {
          package = pkgs.vimPlugins.lean-nvim;
          setup = "require('lean-nvim').setup {}";
        };
        harpoon = {
          package = pkgs.vimPlugins.harpoon;
          setup = "require('harpoon').setup {}";
          after = ["lean-nvim"];
        };
        vimtex = {
          package = pkgs.vimPlugins.vimtex;
          setup = "require('vimtex').setup {}";
          after = ["harpoon"];
        };
      };
  };
  settings.vim = { 
      vimAlias = true;
      globals.mapleader = " ";

      options = {
        tabstop = 2;
        shiftwidth = 2;        
        };

      utility.oil-nvim.enable = true;
      statusline.lualine.enable = true;
      telescope.enable = true;
      autocomplete.nvim-cmp.enable = true;

      keymaps = [ 
      {
        key = "<leader>w";
        mode = "n";
        silent = true;
        action = "<cmd>w<CR>";
      } 
      {
        key = "<leader>o";
        mode = "n";
        silent = true;
        action = "<cmd>Oil .<CR>";
      }
      ];
      lsp.enable = true;
      languages = {
        enableTreesitter = true;
    
        nix.enable = true;
        rust.enable = true;
        clang.enable = true;
        julia.enable = true;
        typst.enable = true;
        python.enable = true;
      };
 };
};
}
