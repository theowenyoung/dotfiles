local M = {}
-- local present, cmp = pcall(require, "cmp")
-- local has_copilot, copilot_cmp = pcall("require", "copilot_cmp.comparators")
--
-- local has_words_before = function()
--   if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
--     return false
--   end
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match "^%s*$" == nil
-- end
M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "c",
    "typescript",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",

    -- format
    "prettier",

    -- shell
    "shfmt",
    'shellcheck',
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
  view = {
    adaptive_size = false,
    width = 30,
  },
}

-- cmp
-- M.cmp = {
--   experimental = {
--     native_menu = false,
--     ghost_text = true,
--   },
--   sources = {
--     { name = "copilot" },
--     { name = "luasnip" },
--     { name = "nvim_lsp" },
--     { name = "buffer" },
--     { name = "nvim_lua" },
--     { name = "path" },
--   },
--
--   mapping = {
--     ["<C-p>"] = cmp.mapping.select_prev_item(),
--     ["<C-n>"] = cmp.mapping.select_next_item(),
--     ["<C-d>"] = cmp.mapping.scroll_docs(-4),
--     ["<C-f>"] = cmp.mapping.scroll_docs(4),
--     ["<C-Space>"] = cmp.mapping.complete(),
--     ["<C-e>"] = cmp.mapping.close(),
--     ["<CR>"] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = false,
--     },
--     ["<Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() and has_words_before() then
--         cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
--       elseif cmp.visible() then
--         cmp.select_next_item()
--       elseif require("luasnip").expand_or_jumpable() then
--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
--     ["<S-Tab>"] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif require("luasnip").jumpable(-1) then
--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
--       else
--         fallback()
--       end
--     end, {
--       "i",
--       "s",
--     }),
--   },
-- }

return M
