local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.lsp-installer"
require("user.lsp.handlers").setup()
require "user.lsp.symbols_outline"
require "user.lsp.scrollbar"
require "user.lsp.null-ls"
