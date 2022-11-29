local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt.with {
    filetypes = { "typescript", "typescriptreact", "json" },
  },
  b.formatting.prettier.with { filetypes = { "html", "css", "javascript", "markdown" } },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
  b.formatting.rustfmt,
}

null_ls.setup {
  debug = false,
  sources = sources,
}