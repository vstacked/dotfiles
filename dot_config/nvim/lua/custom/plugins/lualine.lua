return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VeryLazy',
    config = function()
      local function selectionCount()
        local isVisualMode = vim.fn.mode():find '[Vv]'
        if not isVisualMode then
          return ''
        end
        local starts = vim.fn.line 'v'
        local ends = vim.fn.line '.'
        local lines = starts <= ends and ends - starts + 1 or starts - ends + 1
        return tostring(lines) .. 'L ' .. tostring(vim.fn.wordcount().visual_chars) .. 'C'
      end

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          disabled_filetypes = {
            statusline = { 'alpha' },
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = {
            'branch',
            { 'diff', symbols = { added = ' ', modified = ' ', removed = ' ' } },
            'diagnostics',
          },
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'filetype' },
          -- lualine_x = {  'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { { selectionCount }, 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { { 'filename', path = 1 } },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { 'quickfix', 'fugitive', 'fzf' },
      }
    end,
  },
}
