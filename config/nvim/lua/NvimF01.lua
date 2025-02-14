-- install of lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


--here goes all the lazy installs
require('lazy').setup({
  --beter file exploration
  { 'echasnovski/mini.nvim', version = '*' },
  --gruvbox colorscheme
  "ellisonleao/gruvbox.nvim",
  --treesitter (syntax highlighting)
  "nvim-treesitter/nvim-treesitter",
  --Telescope, intended just as dependency
  --"nvim-lua/plenary.nvim",
  {
  "nvim-telescope/telescope.nvim", tag = "0.1.8",
      dependencies = { "nvim-lua/plenary.nvim"}
    },
  --harpoon (buffer and file bookmarking)
  "ThePrimeagen/harpoon",
  --udotree (to see undos)
  "mbbill/undotree"
})

