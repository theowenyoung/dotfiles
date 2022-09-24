local M = {}
local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<Space>ex"] = { ":%bd|e#<CR>", "close all buffers but this one" },
    ["<Space>X"] = { ":bufdo bd<CR>", "close all buffers" },
    ["C-M-w"] = { "<C-w>", "open window manager" },
  },
  i = {
    ["<C-a>"] = { "<ESC>^i", "beginning of line" },
    ["<C-M-w"] = { "<ESC><C-w>", "open window manager" },
  },
  t = { ["<C-M-w>"] = { termcodes "<C-\\><C-N><C-w>", "open window manager" } },
}

M.nvim_spectre = {
  n = {
    ["<Leader>S"] = {
      '<cmd>lua require("spectre").open()<CR>',
      "open spectre find and replace",
    },
    ["<Leader>sw"] = {
      '<esc>:lua require("spectre").open_visual()<CR>',
      "open spectre find current word",
    },
    ["<Leader>ss"] = {
      'viw:lua require("spectre").open_file_search()<cr>',
      "open spectre find current file",
    },
  },
  v = {
    ["<Leader>S"] = {
      '<esc>:lua require("spectre").open_visual()<CR>',
      "open spectre find current word",
    },
  },
}
M.lsp_config = {
  n = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.format { async = true }
      end,
      "lsp formatting",
    },
  },
}
-- more keybinds!
return M
