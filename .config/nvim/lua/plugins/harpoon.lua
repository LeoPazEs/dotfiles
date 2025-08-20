return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    local harpoon_extensions = require 'harpoon.extensions'
    harpoon:extend(harpoon_extensions.builtins.highlight_current_file())

    harpoon.setup {
      settings = {
        save_on_toggle = false,
        sync_on_ui_close = false,
        key = function()
          return vim.loop.cwd()
        end,
      },
    }

    --  Telescope configuration
    local conf = require('telescope.config').values
    local function toggle_telescope(harpoon_files)
      local telescope_finders = require 'telescope.finders'
      local function get_file_paths()
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end
        return file_paths
      end

      require('telescope.pickers')
        .new({}, {
          prompt_title = 'Harpoon',
          finder = telescope_finders.new_table {
            results = get_file_paths(),
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
          attach_mappings = function(prompt_bufnr, map)
            map('i', '<C-r>', function()
              local state = require 'telescope.actions.state'
              local selected_entry = state.get_selected_entry()
              local current_picker = state.get_current_picker(prompt_bufnr)

              table.remove(harpoon_files.items, selected_entry.index)
              current_picker:refresh(telescope_finders.new_table {
                results = get_file_paths(),
              })
            end, { desc = 'Remove item from Harpoon List' })
            return true
          end,
        })
        :find()
    end

    vim.keymap.set('n', '<leader>hm', function()
      toggle_telescope(harpoon:list())
    end, { desc = '[H]arpoon [M]enu' })
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = '[H]arpoon [A]dd' })
    vim.keymap.set('n', '<leader>hp', function()
      harpoon:list():prev()
    end, { desc = '[H]arpoon [P]revious' })
    vim.keymap.set('n', '<leader>hn', function()
      harpoon:list():next()
    end, { desc = '[H]arpoon [N]ext' })
  end,
}
