-- Adds git related signs to the gutter, as well as utilities for managing changes
-- NOTE: gitsigns is already included in init.lua but contains only the base
-- config. This will add also the recommended keymaps.

return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Jump to next git change' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Jump to previous git change' })

        -- Actions
        -- visual mode
        map('v', '<leader>hs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'stage git hunk' })
        map('v', '<leader>hr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = 'reset git hunk' })
        -- normal mode
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = 'git stage hunk' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = 'git reset hunk' })
        map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = 'git Stage buffer' })
        map('n', '<leader>ghu', gitsigns.undo_stage_hunk, { desc = 'git undo stage hunk' })
        map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = 'git Reset buffer' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = 'git preview hunk' })
        map('n', '<leader>ghb', gitsigns.blame_line, { desc = 'git blame line' })
        map('n', '<leader>ghd', gitsigns.diffthis, { desc = 'git diff against index' })
        map('n', '<leader>ghD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git Diff against last commit' })
        -- Toggles
        map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = 'Toggle git show blame line' })
        map('n', '<leader>gtD', gitsigns.toggle_deleted, { desc = 'Toggle git show Deleted' })
      end,
    },
  },
}
