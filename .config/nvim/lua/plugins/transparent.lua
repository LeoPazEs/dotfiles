return {
  'xiyaowong/transparent.nvim',
  lazy = false,
  config = function()
    require('transparent').setup {
      groups = {
        'Normal',
        'NormalNC',
        'FloatBorder',
        'Comment',
        'Constant',
        'Special',
        'Identifier',
        'Statement',
        'PreProc',
        'Type',
        'Underlined',
        'Todo',
        'String',
        'Function',
        'Conditional',
        'Repeat',
        'Operator',
        'Structure',
        'LineNr',
        'NonText',
        'SignColumn',
        'CursorLine',
        'CursorLineNr',
        'StatusLine',
        'StatusLineNC',
        'EndOfBuffer',
        'TelescopeNormal',
        'TelescopeBorder',
        'TelescopePromptTitle',
        'TelescopePromptBorder',
        'PMenu', -- nvim-cmp
      },
      extra_groups = { 'NormalFloat', 'NvimTreeNormal' },
      exclude_groups = {},
    }
    require('transparent').clear_prefix 'NvimTree'
  end,
}
