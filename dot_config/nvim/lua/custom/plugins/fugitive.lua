return {
  'tpope/vim-fugitive',
  event = 'VeryLazy',
  config = function()
    vim.keymap.set('n', '<Leader>gb', '<Cmd>Git blame<CR>', { desc = 'Git Blame' })
  end,
}
