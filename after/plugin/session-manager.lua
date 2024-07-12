vim.keymap.set("n", "<leader>s", function() vim.cmd('SessionManager load_session') end)

local Path = require('plenary.path')
local config = require('session_manager.config')
require('session_manager').setup({
  autosave_only_in_session = true
})
