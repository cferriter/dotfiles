-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Delete the file currently open.
local function confirm_and_delete_buffer()
  local confirm = vim.fn.confirm("Delete buffer and file?", "&Yes\n&No", 2)

  if confirm == 1 then
    os.remove(vim.fn.expand "%")
    vim.api.nvim_buf_delete(0, { force = true })
  end
end
vim.keymap.set('n', '<leader>rm', confirm_and_delete_buffer)

--  Rerun the last command in the next tmux pane of the current window.
vim.keymap.set('n', '<leader>k', '<cmd>w<cr><cmd>VimuxRunCommand("!!")<cr>', { desc = "'!!' in next tmux pane" })

-- Open Tig blame at current file and line.
vim.keymap.set('n', '<leader>gb', '<cmd>TigBlame<cr>', { desc = "Tig Blame File" })

-- Open Copilot chat.
vim.keymap.set('n', '<leader>ac', '<cmd>CopilotChatToggle<cr>', { desc = "Copilot Chat" })

-- Obsidian keymaps.
vim.keymap.set('n', '<leader>on', '<cmd>ObsidianNew<cr>', { desc = "New" })
vim.keymap.set('n', '<leader>os', '<cmd>ObsidianSearch<cr>', { desc = "Search" })
