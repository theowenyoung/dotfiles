local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "tsserver", "clangd", "denols" }

for _, lsp in ipairs(servers) do
  local options = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
  if lsp == "tsserver" then
    options.root_dir = lspconfig.util.root_pattern "package.json"
  end
  if lsp == "denols" then
    options.root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc")
  end
  lspconfig[lsp].setup(options)
end
