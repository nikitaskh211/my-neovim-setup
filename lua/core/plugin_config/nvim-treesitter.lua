require('nvim-treesitter.configs').setup {
  ensure_installed = {'c', 'cpp', 'lua', 'rust', 'vim'},
  ignore_install = {},
  highlight = {
    enable = true
  }
}
