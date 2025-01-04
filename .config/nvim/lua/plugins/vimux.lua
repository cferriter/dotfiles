return {
  'benmills/vimux',

  vim.keymap.set( 'n', '<leader>k', ':w<CR>:VimuxRunCommand("!!")<CR>', { silent = true })
}
