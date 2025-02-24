return {
  {
    'gennaro-tedesco/nvim-possession',
    event = 'VeryLazy',
    dependencies = {
      'ibhagwan/fzf-lua',
    },
    config = function()
      require('nvim-possession').setup {
        autoload = true, -- default false
        autoswitch = {
          enable = true, -- default false
        },
      }
    end,
    init = function()
      local possession = require 'nvim-possession'
      vim.keymap.set('n', '<leader>pl', function()
        possession.list()
      end, { desc = 'List Sessions' })
      vim.keymap.set('n', '<leader>pn', function()
        possession.new()
      end, { desc = 'New Session' })
      vim.keymap.set('n', '<leader>pu', function()
        possession.update()
      end, { desc = 'Update Session' })
      vim.keymap.set('n', '<leader>pd', function()
        possession.delete()
      end, { desc = 'Delete Session' })
    end,
  },
}
