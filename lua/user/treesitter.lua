local configs = require "nvim-treesitter.configs"
configs.setup({
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml", "go" } },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = true,
  },
  textobjects = {
    lookahead = true,
    lsp_interop = {
      enable = true,
      border = "rounded",
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer",
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
})
