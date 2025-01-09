return {
  'benmills/vimux',

  vim.keymap.set('n', '<leader>k', '<cmd>w<cr><cmd>VimuxRunCommand("!!")<cr>', { desc = "Rerun last command in next tmux pane" })
}
