local opt = vim.opt
local g = vim.g
local wo = vim.wo

opt.exrc = false
-- Make line numbers default

wo.relativenumber = true

-- folder method use treesitter
opt.foldlevel = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"


-- snippets path
g.luasnippets_path = "./snippets"
