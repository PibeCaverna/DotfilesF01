vim.g.mapleader = " "
local kmp = vim.keymap
--file explorer
kmp.set("n","<leader>e",vim.cmd.Ex)
--manage multiple tabs
kmp.set("n","<leader>tt",":tabnew<CR>")
kmp.set("n","<leader>tw",":tabclose<CR>")
kmp.set("n","<leader>tl",":tabn<CR>")
kmp.set("n","<leader>th",":tabp<CR>")
kmp.set("n","<C-i>",":tabn<CR>")
