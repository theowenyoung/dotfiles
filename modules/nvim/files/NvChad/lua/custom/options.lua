local opt = vim.opt
local g = vim.g
local wo = vim.wo

-- hide cmd line
opt.cmdheight = 0

-- auto reload
opt.autoread = true

opt.exrc = false
-- Make line numbers default

wo.relativenumber = true

-- folder method use treesitter
opt.foldlevel = 99
opt.foldmethod = "indent"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

-- snippets path
g.luasnippets_path = "./snippets"
