--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- vstacked
vim.keymap.set('n', '<Tab>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })

vim.keymap.set('n', 'u', '<Cmd>undo<CR>', { desc = 'Undo' })
vim.keymap.set('n', 'U', '<Cmd>redo<CR>', { desc = 'Redo' })

vim.keymap.set('n', ']q', '<Cmd>:cnext<CR>', { desc = 'Undo' })
vim.keymap.set('n', '[q', '<Cmd>:cprev<CR>', { desc = 'Redo' })

vim.keymap.set('n', '<Leader>e', '<Cmd>Oil<CR>', { desc = 'Oil' })

vim.keymap.set('n', '<Leader>H', '<Cmd>Alpha<CR>', { desc = 'Home' })

vim.keymap.set('n', '<Leader>W', '<Cmd>:noautocmd wall<CR>', { desc = 'Save All' })

vim.keymap.set('n', '<Leader>cw', '<Cmd>:noautocmd w<CR>', { desc = 'Save' })

vim.keymap.set('n', '<Leader>Q', '<Cmd>qa<CR>', { desc = 'Quit All' })

vim.keymap.set({ 'n', 'x' }, '<A-k>', ':m .-2<CR>==', { desc = 'Move Up' })
vim.keymap.set({ 'n', 'x' }, '<A-j>', ':m .+1<CR>==', { desc = 'Move Down' })

vim.keymap.set('n', '<C-Up>', '<Cmd>resize -2<CR>', { desc = 'Resize split up' })
vim.keymap.set('n', '<C-Down>', '<Cmd>resize +2<CR>', { desc = 'Resize split down' })
vim.keymap.set('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', { desc = 'Resize split left' })
vim.keymap.set('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', { desc = 'Resize split right' })

-- ThePrimeagen
-- Paste without overwriting register and keep position
vim.keymap.set('x', '<Leader>p', [["_dP]], { desc = 'Paste w/o overwriting' })

vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Esc' })

vim.lsp.inlay_hint.enable(true)

vim.wo.wrap = false
vim.o.textwidth = 80

vim.opt.fillchars = { eob = ' ' }

vim.diagnostic.disable()

local symbols = { Error = '󰅚 ', Info = '󰋽 ', Hint = '󰌶 ', Warn = '󰀪 ' }
for name, icon in pairs(symbols) do
  local hl = 'DiagnosticSign' .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

-- https://www.reddit.com/r/neovim/comments/16qcncm/comment/k1w8jgj/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
-- Add border to the diagnostic popup window
vim.diagnostic.config {
  underline = true,
  update_in_insert = false,
  virtual_text = {
    spacing = 4,
    source = 'if_many',
    prefix = '●',
  },
  severity_sort = true,
  float = { border = 'rounded' },
}

vim.g.coc_node_path = 'C:/Users/vstacked/scoop/apps/nvm/current/nodejs/nodejs/node.exe'

-- Some servers have issues with backup files, see #649
vim.opt.backup = false
vim.opt.writebackup = false

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
  local col = vim.fn.col '.' - 1
  return col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = { silent = true, noremap = true, expr = true, replace_keycodes = false }
keyset('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset('i', '<S-TAB>', [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset('i', '\\', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

vim.g.coc_snippet_prev = '<c-k>'

-- Use <c-j> to trigger snippets
keyset('i', '<c-j>', '<Plug>(coc-snippets-expand-jump)')
-- Use <c-space> to trigger completion
keyset('i', '<c-space>', 'coc#refresh()', { silent = true, expr = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
keyset('n', '[g', '<Plug>(coc-diagnostic-prev)', { silent = true })
keyset('n', ']g', '<Plug>(coc-diagnostic-next)', { silent = true })

-- GoTo code navigation
keyset('n', 'gd', '<Plug>(coc-definition)', { silent = true })
keyset('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
keyset('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
keyset('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Use K to show documentation in preview window
function _G.show_docs()
  local cw = vim.fn.expand '<cword>'
  if vim.fn.index({ 'vim', 'help' }, vim.bo.filetype) >= 0 then
    vim.api.nvim_command('h ' .. cw)
  elseif vim.api.nvim_eval 'coc#rpc#ready()' then
    vim.fn.CocActionAsync 'doHover'
  else
    vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
  end
end
keyset('n', 'K', '<CMD>lua _G.show_docs()<CR>', { silent = true })

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup('CocGroup', {})
vim.api.nvim_create_autocmd('CursorHold', {
  group = 'CocGroup',
  command = "silent call CocActionAsync('highlight')",
  desc = 'Highlight symbol under cursor on CursorHold',
})

-- Symbol renaming
keyset('n', '<leader>crn', '<Plug>(coc-rename)', { silent = true })

-- Formatting selected code
keyset('x', '<leader>f', '<Plug>(coc-format-selected)', { silent = true, desc = 'Format Selected' })

vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})
keyset('n', '<leader>f', '<CMD>:Format<CR>', { silent = true })

-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd('FileType', {
  group = 'CocGroup',
  pattern = 'typescript,json',
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = 'Setup formatexpr specified filetype(s).',
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd('User', {
  group = 'CocGroup',
  pattern = 'CocJumpPlaceholder',
  command = "call CocActionAsync('showSignatureHelp')",
  desc = 'Update signature help on jump placeholder',
})

-- Utility function to merge two tables
local function merge_tables(t1, t2)
  local t = {}
  for k, v in pairs(t1) do
    t[k] = v
  end
  for k, v in pairs(t2) do
    t[k] = v
  end
  return t
end

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = { silent = true, nowait = true }
keyset('x', '<leader>ca', '<Plug>(coc-codeaction-selected)', merge_tables({ desc = 'CodeAction Selected' }, opts))
keyset('n', '<leader>ca', '<Plug>(coc-codeaction-selected)', merge_tables({ desc = 'CodeAction Selected' }, opts))

-- Remap keys for apply code actions at the cursor position.
keyset('n', '<leader>cc', '<Plug>(coc-codeaction-cursor)', merge_tables({ desc = 'CodeAction Cursor' }, opts))
-- Remap keys for apply source code actions for current file.
keyset('n', '<leader>cs', '<Plug>(coc-codeaction-source)', merge_tables({ desc = 'CodeAction Source' }, opts))
-- Apply the most preferred quickfix action on the current line.
keyset('n', '<leader>cf', '<Plug>(coc-fix-current)', merge_tables({ desc = 'Fix Current' }, opts))

-- Remap keys for apply refactor code actions.
keyset('n', '<leader>cre', '<Plug>(coc-codeaction-refactor)', { silent = true, desc = 'CodeAction Refactor' })
keyset('x', '<leader>cr', '<Plug>(coc-codeaction-refactor-selected)', { silent = true, desc = 'CodeAction Refactor Selected' })
keyset('n', '<leader>cr', '<Plug>(coc-codeaction-refactor-selected)', { silent = true, desc = 'CodeAction Refactor Selected' })

-- Run the Code Lens actions on the current line
keyset('n', '<leader>cl', '<Plug>(coc-codelens-action)', merge_tables({ desc = 'Codelens Action' }, opts))

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
keyset('x', 'if', '<Plug>(coc-funcobj-i)', opts)
keyset('o', 'if', '<Plug>(coc-funcobj-i)', opts)
keyset('x', 'af', '<Plug>(coc-funcobj-a)', opts)
keyset('o', 'af', '<Plug>(coc-funcobj-a)', opts)
keyset('x', 'ic', '<Plug>(coc-classobj-i)', opts)
keyset('o', 'ic', '<Plug>(coc-classobj-i)', opts)
keyset('x', 'ac', '<Plug>(coc-classobj-a)', opts)
keyset('o', 'ac', '<Plug>(coc-classobj-a)', opts)

-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true, expr = true }
keyset('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
keyset('i', '<C-f>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
keyset('i', '<C-b>', 'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
keyset('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
keyset('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)

-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
keyset('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
keyset('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

-- Add `:Format` command to format current buffer
-- vim.api.nvim_create_user_command('Format', "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
-- vim.api.nvim_create_user_command('Fold', "call CocAction('fold', <f-args>)", { nargs = '?' })

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command('OR', "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})
keyset('n', '<leader>co', '<CMD>:OR<CR>', merge_tables({ desc = 'Organize Imports' }, opts))

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend "%{coc#status()}%{get(b:,'coc_current_function','')}"

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }
-- Show all diagnostics
keyset('n', '<space>cd', ':<C-u>CocList diagnostics<cr>', merge_tables({ desc = 'Diagnostics' }, opts))
-- Manage extensions
keyset('n', '<space>ve', ':<C-u>CocList extensions<cr>', merge_tables({ desc = 'Extensions' }, opts))
-- Show commands
keyset('n', '<space>vc', ':<C-u>CocList commands<cr>', merge_tables({ desc = 'Commands' }, opts))
-- Find symbol of current document
keyset('n', '<space>vo', ':<C-u>CocList outline<cr>', merge_tables({ desc = 'Outline' }, opts))
-- Search workspace symbols
keyset('n', '<space>vs', ':<C-u>CocList -I symbols<cr>', merge_tables({ desc = 'Symbols' }, opts))
-- Do default action for next item
keyset('n', '<space>vj', ':<C-u>CocNext<cr>', merge_tables({ desc = 'Next' }, opts))
-- Do default action for previous item
keyset('n', '<space>vk', ':<C-u>CocPrev<cr>', merge_tables({ desc = 'Prev' }, opts))
-- Resume latest coc list
keyset('n', '<space>vp', ':<C-u>CocListResume<cr>', merge_tables({ desc = 'Resume List' }, opts))
-- vstacked

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- vim.keymap.set('n', '<leader>xq', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup {
        icons = {
          -- set icon mappings to true if you have a Nerd Font
          mappings = vim.g.have_nerd_font,
          -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
          -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
          keys = vim.g.have_nerd_font and {} or {
            Up = '<Up> ',
            Down = '<Down> ',
            Left = '<Left> ',
            Right = '<Right> ',
            C = '<C-…> ',
            M = '<M-…> ',
            D = '<D-…> ',
            S = '<S-…> ',
            CR = '<CR> ',
            Esc = '<Esc> ',
            ScrollWheelDown = '<ScrollWheelDown> ',
            ScrollWheelUp = '<ScrollWheelUp> ',
            NL = '<NL> ',
            BS = '<BS> ',
            Space = '<Space> ',
            Tab = '<Tab> ',
            F1 = '<F1>',
            F2 = '<F2>',
            F3 = '<F3>',
            F4 = '<F4>',
            F5 = '<F5>',
            F6 = '<F6>',
            F7 = '<F7>',
            F8 = '<F8>',
            F9 = '<F9>',
            F10 = '<F10>',
            F11 = '<F11>',
            F12 = '<F12>',
          },
        },
      }

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = 'Code' },
        { '<leader>s', group = 'Search' },
        { '<leader>g', group = 'Git', mode = { 'n', 'v' } },
        { '<leader>f', icon = { icon = '󰉼', color = 'yellow' } },
        { '<leader>e', icon = { icon = '', color = 'azure' } },
        { '<leader>H', icon = { icon = '', color = 'azure' } },
        { '<leader>W', icon = { icon = '󰽄', color = 'grey' } },
        { '<leader>v', group = 'CoC', icon = { icon = '', color = 'cyan' } },
        { '<leader>gh', group = 'Hunk', icon = { icon = '', color = 'cyan' } },
        { '<leader>gt', group = 'Toggle', icon = { icon = '󰨙', color = 'red' } },
        { '<leader>p', group = 'Possession', icon = { icon = '󱑜', color = 'azure' } },
        {
          mode = { 'v' },
          { '<leader>h', group = 'Hunk', icon = { icon = '', color = 'cyan' } },
          { '<leader>s', group = 'Search' },
          { '<leader>f', icon = { icon = '󰉼', color = 'yellow' } },
          { '<leader>c', group = 'Code' },
        },
      }
    end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'cmake' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '-u', -- thats the new thing
          },
          file_ignore_patterns = { 'node_modules', '.git', '.venv' },
          layout_config = {
            horizontal = {
              prompt_position = 'top',
            },
          },
          sorting_strategy = 'ascending',
          path_display = function(_, path)
            local cwd = vim.fn.getcwd()
            cwd = cwd:sub(1, 1):lower() .. cwd:sub(2)

            -- Convert backslashes to forward slashes
            local path_convert = path:gsub('/', '\\')

            -- Remove CWD from the path
            if cwd then
              cwd = cwd:gsub('/', '\\')
              -- Check if the path starts with the CWD and remove it
              if path_convert:sub(1, #cwd) == cwd then
                path_convert = path_convert:sub(#cwd + 1)
              end
            end

            return path_convert
          end,
          --   mappings = {
          --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          --   },
        },
        pickers = {
          live_grep = {
            additional_args = function(_)
              return { '--hidden' }
            end,
          },
          find_files = {
            hidden = true,
            no_ignore = true,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          'fzf',
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local get_selection = function()
        local mode = vim.fn.mode()
        local selection = ''

        if mode == 'n' then
          selection = ''
        else
          -- https://www.reddit.com/r/neovim/comments/1dpma3y/how_to_put_selected_text_in_visual_mode_into/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
          vim.cmd.normal { '"zy', bang = true }
          selection = vim.fn.getreg 'z'
        end
        return selection
      end

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
      vim.keymap.set({ 'n', 'x' }, '<leader>sf', function()
        builtin.find_files { default_text = get_selection() }
      end, { desc = 'Search Files' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
      vim.keymap.set({ 'n', 'x' }, '<leader>sw', function()
        builtin.grep_string { default_text = get_selection() }
      end, { desc = 'Search current Word' })
      vim.keymap.set({ 'n', 'x' }, '<leader>sg', function()
        builtin.live_grep { default_text = get_selection() }
      end, { desc = 'Search by Grep' })
      vim.keymap.set({ 'n', 'x' }, '<leader>sd', function()
        builtin.diagnostics { default_text = get_selection() }
      end, { desc = 'Search Diagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
      vim.keymap.set({ 'n', 'x' }, '<leader>s.', function()
        builtin.oldfiles { default_text = get_selection() }
      end, { desc = 'Search Recent Files ("." for repeat)' })
      vim.keymap.set({ 'n', 'x' }, '<leader><leader>', function()
        builtin.buffers { sort_mru = true, default_text = get_selection() }
      end, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set({ 'n', 'x' }, '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
          default_text = get_selection(),
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = 'Search / in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = 'Search Neovim files' })
    end,
  },

  -- yaml schema support
  {
    'b0o/SchemaStore.nvim',
    lazy = true,
    version = false, -- last release is way too old
  },

  -- { -- You can easily change to a different colorscheme.
  --   -- Change the name of the colorscheme plugin below, and then
  --   -- change the command in the config to whatever the name of that colorscheme is.
  --   --
  --   -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  --   'folke/tokyonight.nvim',
  --   priority = 1000, -- Make sure to load this before all the other start plugins.
  --   init = function()
  --     -- Load the colorscheme here.
  --     -- Like many other themes, this one has different styles, and you could load
  --     -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
  --     vim.cmd.colorscheme 'tokyonight-night'
  --
  --     -- You can configure highlights by doing something like:
  --     vim.cmd.hi 'Comment gui=none'
  --   end,
  -- },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'typescript',
        'json5',
        'git_config',
        'gitcommit',
        'git_rebase',
        'gitignore',
        'gitattributes',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
