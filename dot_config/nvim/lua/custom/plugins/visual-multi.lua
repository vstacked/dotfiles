return {
  'mg979/vim-visual-multi',
  branch = 'master',
  event = 'VeryLazy',
  init = function()
    vim.g.VM_maps = {
      ['Find Under'] = '<C-m>',
      ['Find Subword Under'] = '<C-m>',
    }
  end,
}
