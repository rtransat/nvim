local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({
      extra_args = { "--no-semi", "--single-quote" },
      extra_filetypes = { "toml" },
    }),
    formatting.trim_whitespace,
    formatting.trim_newlines,
    formatting.phpcsfixer.with({
      args = {
        "--no-interaction",
        "--using-cache=no",
        "--quiet",
        "--rules=@PSR12,@Symfony",
        "fix",
        "$FILENAME",
      },
    }),
    formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand "~/.config/null-ls/stylua.toml" },
    }),

    diagnostics.php,
  },
  on_attach = function(client)
    if client.resolved_capabilities.document_formatting then
      vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
    end
  end,
})
