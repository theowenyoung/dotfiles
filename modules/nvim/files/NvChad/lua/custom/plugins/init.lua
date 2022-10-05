local overrides = require "custom.plugins.overrides"

return {
  ["MunifTanjim/exrc.nvim"] = {
    config = function()
      require("exrc").setup()
    end,
  },
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
  ["windwp/nvim-spectre"] = {
    config = function()
      require "custom.plugins.nvim-spectre"
    end,
  },
  -- Override plugin definition options
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  -- remove plugin
  -- ["hrsh7th/cmp-path"] = false,
}
