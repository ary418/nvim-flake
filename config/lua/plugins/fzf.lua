return {
  'fzf-lua',
  keys = {
    { '<leader>ff', '<cmd>FzfLua files<cr>', desc = 'Find files' },
    { '<leader>fb', '<cmd>FzfLua buffers<cr>', desc = 'Switch opened buffers' },
    { '<leader>fg', '<cmd>FzfLua git_commits<cr>', desc = 'Find git commits' },
    { '<leader>gs', '<cmd>FzfLua git_status<cr>', desc = 'Find git status' },
  },
}

