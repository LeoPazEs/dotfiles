return {
  'mfussenegger/nvim-dap',
  config = function()
    local dap = require 'dap'

    vim.keymap.set('n', '<F1>', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<F2>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<F3>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<F4>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<F5>', dap.step_back, { desc = 'Debug: Step back debugger' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>B', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })
    vim.fn.sign_define('DapBreakpoint', { text = '🚦', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '📍', texthl = '', linehl = '', numhl = '' })
  end,
}
