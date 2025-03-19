vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true
vim.opt.mouse = 'a'

vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- Other useful options
vim.opt.tabstop = 2           -- Number of spaces tabs count for
vim.opt.shiftwidth = 2        -- Size of an indent
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.smartindent = true    -- Insert indents automatically
vim.opt.wrap = false          -- Disable line wrap
vim.opt.ignorecase = true     -- Ignore case when searching
vim.opt.smartcase = true      -- Don't ignore case with capitals
vim.opt.termguicolors = true  -- True color support
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.breakindent =true
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'

vim.opt.undofile = true


-- test LOL
-- Custom Keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "jk", "<Esc>", { desc = "exit insert mode like sonic!"})
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and exit" })
vim.keymap.set("n", "<leader>qq", ":qa!<CR>", { desc = "Quit without saving" })


-- Bootstrap lazy.nvim
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

-- Initialize lazy.nvim
if not package.loaded["lazy"] then
  require("lazy").setup("plugins")
end

