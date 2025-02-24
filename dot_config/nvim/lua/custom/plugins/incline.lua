return {
  {
    'b0o/incline.nvim',
    config = function()
      local helpers = require 'incline.helpers'
      local devicons = require 'nvim-web-devicons'
      require('incline').setup {
        window = {
          margin = { horizontal = 0, vertical = 0 },
          placement = { horizontal = 'right', vertical = 'top' },
          overlap = {
            tabline = false,
            winbar = true,
            borders = false,
            statusline = true,
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':p:.')
          -- local filename = vim.api.nvim_buf_get_name(props.buf)
          if filename == '' then
            filename = '[No Name]'
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local modified = vim.bo[props.buf].modified
          local res = {
            ft_icon and { ' ', ft_icon, ' ', guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or '',
            ' ',
            -- { filename, gui = modified and "italic" or "normal" },
            { filename },
            modified and '•' or '',
            guibg = '#14161e',
          }
          if props.focused then
            return ''
          end
          table.insert(res, ' ')
          return res
        end,
      }
    end,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },
}
