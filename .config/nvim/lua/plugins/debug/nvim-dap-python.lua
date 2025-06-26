return {
  'mfussenegger/nvim-dap-python',
  dependencies = { 'mfussenegger/nvim-dap' },
  config = function()
    local debugpy_path = vim.fn.exepath 'debugpy' .. '/venv/bin/python'

    require('dap-python').setup(debugpy_path)
    vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua require("dap-python").test_method()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>df', '<cmd>lua require("dap-python").test_class()<CR>', { noremap = true, silent = true })
    vim.api.nvim_set_keymap('v', '<leader>ds', '<ESC><cmd>lua require("dap-python").debug_selection()<CR>', { noremap = true, silent = true })

    local dap = require 'dap'
    table.insert(dap.configurations.python, {
      type = 'python',
      request = 'attach',
      name = 'Attach remote (with path mapping)',
      connect = function()
        local host = vim.fn.input 'Host [127.0.0.1]: '
        host = host ~= '' and host or '127.0.0.1'
        local port = tonumber(vim.fn.input 'Port [5678]: ') or 5678
        return { host = host, port = port }
      end,
      pathMappings = function()
        local cwd = '${workspaceFolder}'
        local local_path = vim.fn.input('Local path mapping [' .. cwd .. ']: ')
        local_path = local_path ~= '' and local_path or cwd
        local remote_path = vim.fn.input 'Remote path mapping [.]: '
        remote_path = remote_path ~= '' and remote_path or '.'
        return { { localRoot = local_path, remoteRoot = remote_path } }
      end,
    })
  end,
}
