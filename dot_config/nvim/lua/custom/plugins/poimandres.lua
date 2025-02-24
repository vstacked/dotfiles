return {
  {
    'vstacked/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- local p = require("poimandres.palette")
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
        disable_italics = true,
        -- highlight_groups = {
        --   LspReferenceText = { bg = p.pink3 },
        --   LspReferenceRead = { bg = p.pink3 },
        --   LspReferenceWrite = { bg = p.pink3 },
        -- },
      }
    end,
    init = function()
      vim.cmd [[
        silent! colorscheme poimandres
      ]]
    end,
  },
}
