{ inputs, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    defaultEditor = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      mini-pick
      nvim-treesitter.withAllGrammars

      oil-nvim
      typst-conceal-vim
      typst-preview-nvim
      lean-nvim
      
    ];
    extraLuaConfig = 
    ''
        vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.swapfile = false

	vim.g.mapleader = " "

	vim.lsp.enable('tinymist')

	require ("mini.pick").setup()
        require ("oil").setup()
        '';
  };
}
