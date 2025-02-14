local opt = vim.opt 

--show line numbers
opt.number = true

-- tabs and indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false --investigate

--search thingies
opt.ignorecase = true
opt.smartcase = true

--makes nvim clipboard sync with system clipboard
opt.clipboard:append("unnamedplus")

-- split windows config
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

