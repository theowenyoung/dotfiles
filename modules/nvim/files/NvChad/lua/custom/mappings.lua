local M = {}
local function termcodes(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
-- general
M.general = {
  n = {
    [";"] = { ":", "command mode", opts = { nowait = true } },
    ["<Space>ex"] = { ":%bd|e#<CR>", "close all buffers but this one" },
    ["<Space>X"] = { ":bufdo bd<CR>", "close all buffers" },
    ["C-M-w"] = { "<C-w>", "open window manager" },
    ["gx"] = { ":!open <c-r><c-a><CR>", "open url", opts = {
      silent = true,
    } },
    ["qq"] = { ":q<CR>", "quit" },
    ["<Leader>w"] = { ":w<CR>", "save filee" },
    ["<D-s>"] = { ":w<CR>", "save file" },
    ["<BS>"] = { "<C-^>", "toggle last buffer" },
    ["<Leader>be"] = { ":%bd|e#<CR>", "close all other buffers except the current one" },
    ["x"] = { [["_x]], "delete not cut" },
    ["d"] = { [["_d]], "delete not cut" },
    ["c"] = { [["_c]], "change not cut" },
    ["D"] = { [["_D]], "delete not cut" },
    ["<Leader>x"] = { [[""x]], "delete with cut" },
    ["<Leader>d"] = { [[""d]], "delete with cut" },
    ["<Leader>c"] = { [[""c]], "change with cut" },
    ["<Leader>D"] = { [[""D]], "delete with cut" },
    ["<Leader>s"] = { ":%sno/", "substitute exactly" },
  },
  x = {
    ["x"] = { [["_x]], "delete ../../ not cut" },
    ["d"] = { [["_d]], "delete not cut" },
    ["c"] = { [["_c]], "change not cut" },
    ["D"] = { [["_D]], "delete not cut" },
    ["<Leader>x"] = { [[""x]], "delete with cut" },
    ["<Leader>d"] = { [[""d]], "delete with cut" },
    ["<Leader>c"] = { [[""c]], "change with cut" },
    ["<Leader>D"] = { [[""D]], "delete with cut" },
  },
  i = {
    ["<C-s>"] = { "<ESC>:w<CR>", "save file" },
    ["<C-a>"] = { "<ESC>^i", "beginning of line" },
    ["<C-M-w"] = { "<ESC><C-w>", "open window manager" },
    ["<D-s>"] = { "<ESC>:w<CR>", "save file" },
  },
  t = {
    ["<C-M-w>"] = { termcodes "<C-\\><C-N><C-w>", "open window manager" },
    ["<C-h>"] = { termcodes "<C-\\><C-N>" .. "<C-w>h", "switch left window" },
    ["<C-j>"] = { termcodes "<C-\\><C-N>" .. "<C-w>j", "switch down window" },
    ["<C-k>"] = { termcodes "<C-\\><C-N>" .. "<C-w>k", "switch up window" },
    ["<C-l>"] = { termcodes "<C-\\><C-N>" .. "<C-w>l", "switch right window" },
    ["<C-n>"] = { termcodes "<C-\\><C-N>" .. "<cmd> NvimTreeToggle <CR>", "switch right window" },
  },
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
M.telescope = {
  i = {
    ["<C-M-o>"] = { "<ESC><cmd> Telescope find_files <CR>", "find files" },
    ["<C-M-b>"] = { "<ESC><cmd> Telescope buffers <CR>", "find buffers" },
  },
  n = {
    ["<C-M-o>"] = { "<cmd> Telescope find_files <CR>", "find files" },
    ["<C-M-b>"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
  },
  t = {
    ["<C-M-o>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
        require("telescope.builtin").find_files()
      end,
      "find files",
    },
    ["<C-M-b>"] = {
      function()
        require("nvterm.terminal").toggle "horizontal"
        require("telescope.builtin").find_buffers()
      end,
      "find buffers",
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
    ["<leader>e"] = {
      "<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<CR>",
      "show line diagnostics",
    },
  },
}
-- more keybinds!
return M
