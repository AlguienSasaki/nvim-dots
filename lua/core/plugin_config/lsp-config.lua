-- Mason.nvim setup
require("mason").setup{
        ensure_installed = {
                'black',
                'mypy',
        }

}
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').clangd.setup {
  capabilities = capabilities,
--  ...  -- other lspconfig configs
}

require('lspconfig').pyright.setup {
  capabilities = capabilities,
--  ...  -- other lspconfig configs
}

require('lspconfig').bashls.setup {
  capabilities = capabilities,
--  ...  -- other lspconfig configs
}

-- Mason lsp config
require("mason-lspconfig").setup {
    ensure_installed = { 
                "lua_ls", 
                "rust_analyzer", 
--                "bash-language-server", 
                "clangd",
                "pyright",
                "ast_grep",
--                "clang-format",
--                "beautysh", 
--                "bash-debug-adapter", 
--                "cpp-tools", 
--                "cpplint" 
        },
}


--local lspconfig = require('lspconfig:')
vim.lsp.enable({
        'luals',
        'rust_analyzer', 
        'pyright',
        'bashls',
        'clangd',
        'ast_grep',
})
--vim.lsp.enable 'bashls'
--
--
vim.diagnostic.config({
  virtual_text = {
    prefix = "□",  -- Puedes cambiarlo a ">>", "❗", etc.
    spacing = 2,   -- Espacio entre el texto y el código
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- No mostrar en medio de la escritura
})
