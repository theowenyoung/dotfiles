local overrides = require "custom.plugins.overrides"

return {
  ["MunifTanjim/exrc.nvim"] = {
    config = function()
      require("exrc").setup()
    end,
  },
  ["alexghergh/nvim-tmux-navigation"] = {
    config = function()
      local nvim_tmux_nav = require "nvim-tmux-navigation"
      nvim_tmux_nav.setup {
        disable_when_zoomed = true, -- defaults to false
      }
      vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
  },
  ["ybian/smartim"] = {},
  -- ["zbirenbaum/copilot.lua"] = {
  --   event = "InsertEnter",
  --   config = function()
  --     vim.schedule(function()
  --       require("copilot").setup()
  --     end)
  --   end,
  -- },
  -- ["zbirenbaum/copilot-cmp"] = {
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },
  ["kylechui/nvim-surround"] = {
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
  ["github/copilot.vim"] = {
    setup = function()
      -- copliot options
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        yaml = true,
      }
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  },
  -- Override plugin definition options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  -- overrde plugin configs
  ["nvim-treesitter/nvim-treesitter"] = {
    override_options = overrides.treesitter,
  },

  ["williamboman/mason.nvim"] = {
    override_options = overrides.mason,
  },

  ["kyazdani42/nvim-tree.lua"] = {
    override_options = overrides.nvimtree,
  },
  -- ["hrsh7th/nvim-cmp"] = {
  --   override_options = overrides.cmp,
  -- },

  -- Install a plugin
  ["max397574/better-escape.nvim"] = {
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- code formatting, linting etc
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  -- grep and replace
  -- ["windwp/nvim-spectre"] = {
  --   config = function()
  --     require "custom.plugins.nvim-spectre"
  --   end,
  -- },
  -- grep and replace
  ["brooth/far.vim"] = {},
  -- scratch
  ["mtth/scratch.vim"] = {},
  -- Override plugin definition options
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
