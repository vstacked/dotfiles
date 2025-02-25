return {
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle pinned=true win.relative=win win.position=left open_no_results=true<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle pinned=true win.relative=win win.position=left filter.buf=0 open_no_results=true<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>xf',
        '<cmd>lua vim.diagnostic.open_float()<cr>',
        desc = 'Show diagnostics in a floating window.',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
    config = function()
      local trouble = require 'trouble'
      trouble.setup {
        icons = {
          indent = {
            middle = ' ',
            last = ' ',
            top = ' ',
            ws = '│  ',
          },
        },
        modes = {
          diagnostics = {
            groups = {
              { 'filename', format = '{file_icon} {basename:Title} {count}' },
            },
          },
        },
      }

      -- local actions = require 'telescope.actions'
      -- local open_with_trouble = require('trouble.sources.telescope').open

      -- local telescope = require 'telescope'

      -- Use this to add more results without clearing the trouble list
      -- local add_to_trouble = require('trouble.sources.telescope').add

      -- vim.keymap.set('n', ']x', trouble.next, { desc = 'Jump to the next trouble' })
      -- vim.keymap.set('n', '[x', trouble.prev, { desc = 'Jump to the previous trouble' })

      -- vim.keymap.set('n', '<leader>st', open_with_trouble, { desc = 'eyy' })
      -- telescope.setup {
      --   defaults = {
      --     mappings = {
      --       i = { ['<c-t>'] = open_with_trouble },
      --       n = { ['<c-t>'] = open_with_trouble },
      --     },
      --   },
      -- }
    end,
  },
}
