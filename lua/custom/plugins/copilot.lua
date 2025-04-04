return {
  'github/copilot.vim',
  enabled = false,
  lazy = false,
  init = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ''
    vim.g.copilot_enabled = 0
  end,
  config = function()
    vim.keymap.set('i', '<C-e>', [[copilot#Accept("\<CR>")]], {
      silent = true,
      expr = true,
      script = true,
      replace_keycodes = false,
    })
  end,
}
