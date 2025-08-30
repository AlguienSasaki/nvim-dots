-- Here starts my own config, let's see how it works :)
-- By Alguien Sasaki
require("core.plugins")
require("core.loader")
require("core.keymaps")
require("luasnip.loaders.from_vscode").lazy_load()
local null_ls = require("null-ls")

require("mason").setup()
require("mason-null-ls").setup({
    handlers = {},
})
-- transparent background
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
--vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })

-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })

-- [[ Add optional packages ]]
-- Nvim comes bundled with a set of packages that are not enabled by
-- default. You can enable any of them by using the `:packadd` command.

-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after
-- 'updatetime' and when going to insert mode
vim.cmd('packadd! nohlsearch')


colorscheme = (kanagawa)
vim.cmd("colorscheme kanagawa-dragon")
vim.lsp.enable('diagnosticls')
