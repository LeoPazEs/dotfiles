return {
  {
    'zbirenbaum/copilot.lua',
    event = 'VeryLazy',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = false,
        },
        panel = {
          enabled = false,
        },
        filetypes = {
          markdown = true,
          help = true,
          html = true,
          javascript = true,
          typescript = true,
          python = true,
          ['*'] = true,
        },
      }
    end,
  },
}
