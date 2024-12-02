-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- List all files to fuzzy search on.
vim.keymap.set( 'n', '<C-P>', ':Telescope find_files<CR>')

-- Delete the file currently open.
local function confirm_and_delete_buffer()
  local confirm = vim.fn.confirm("Delete buffer and file?", "&Yes\n&No", 2)

  if confirm == 1 then
    os.remove(vim.fn.expand "%")
    vim.api.nvim_buf_delete(0, { force = true })
  end
end
vim.keymap.set('n', '<leader>rm', confirm_and_delete_buffer)

-- Toggle comment.
local operator_rhs = function()
    return require('vim._comment').operator()
end
vim.keymap.set('v', "<C-F>", operator_rhs, { expr = true, desc = 'Toggle comment' })

local line_rhs = function()
    return require('vim._comment').operator() .. '_'
end
vim.keymap.set('n', "<C-F>", line_rhs, { expr = true, desc = 'Toggle comment line' })


