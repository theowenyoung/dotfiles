require "custom.options"
local autocmd = vim.api.nvim_create_autocmd

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- auto format on save
local autoformat_group = vim.api.nvim_create_augroup("autoformat", { clear = true })
autocmd("BufWritePre", {
  group = autoformat_group,
  pattern = "*",
  command = "silent! lua vim.lsp.buf.format()",
})
