-- Load vim specific config
vim.cmd('source ~/.vimrc')

-- LSP and completion engine
require('nvim-cmp')
require('lsp')

-- Formatter
require('formatter').setup({
  filetype = {
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
          stdin = true
        }
      end
    },
    ruby = {
      -- rubocop
      function()
        return {
          exe = "bundle exec rubocop",
          args = { '--auto-correct', '--stdin', '%:p', '2>/dev/null', '|', "awk 'f; /^====================$/{f=1}'"},
          stdin = true,
        }
      end
    }
  }
})

-- Initialise plugins
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}

-- Make me pretty
vim.cmd("colorscheme onedark")

-- Lualine
require'lualine'.setup {
  options = { theme = 'onedark' },
}
