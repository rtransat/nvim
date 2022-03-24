local opts = {
  root_dir = require("lspconfig").util.root_pattern "package.json",
  init_options = require("nvim-lsp-ts-utils").init_options,
}

return opts
