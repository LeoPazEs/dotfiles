return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20,
      direction = 'float',
      float_opts = {
        border = 'curved',
        winblend = 0,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_terminals = true,
      shade_filetypes = {},
      shading_factor = 2,
      close_on_exit = true,
    }
  end,
}
