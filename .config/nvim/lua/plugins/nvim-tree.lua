local HEIGHT_RATIO = 0.8 -- You can change this
local WIDTH_RATIO = 0.5 -- You can change this too

return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    enabled = vim.g.have_nerd_font,
  },
  config = function()
    require('nvim-tree').setup {
      disable_netrw = true,
      hijack_netrw = true,
      diagnostics = {
        show_on_dirs = false,
        show_on_open_dirs = true,
        enable = true,
      },
      update_focused_file = {
        enable = false,
        update_root = {
          enable = false,
          ignore_list = {},
        },
        exclude = false,
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      view = {
        -- width = 30,
        -- side = 'left',
        float = {
          enable = true,
          quit_on_focus_loss = true,
          open_win_config = function()
            local screen_w = vim.opt.columns:get()
            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
            local window_w = screen_w * WIDTH_RATIO
            local window_h = screen_h * HEIGHT_RATIO
            local window_w_int = math.floor(window_w)
            local window_h_int = math.floor(window_h)
            local center_x = (screen_w - window_w) / 2
            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
            return {
              border = 'rounded',
              relative = 'editor',
              row = center_y,
              col = center_x,
              width = window_w_int,
              height = window_h_int,
            }
          end,
        },
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
    }
    -- Map keys to open nvim-tree
    vim.api.nvim_set_keymap('n', '<leader>tf', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
  end,
}
