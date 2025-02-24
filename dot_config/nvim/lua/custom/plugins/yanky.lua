return {
  {
    'gbprod/yanky.nvim',
    dependencies = {
      { 'kkharji/sqlite.lua' },
    },
    event = 'VeryLazy',
    opts = {
      ring = { storage = 'sqlite' },
    },
    keys = {
      {
        '<leader>sy',
        function()
          require('telescope').extensions.yank_history.yank_history {}
        end,
        mode = { 'n', 'x' },
        desc = 'Open Yank History',
      },
    },
  },
}
