--local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

null_ls.setup({
        sources = {
                -- Formatters

                -- Stylua for lua
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.stylua,
                -- Clang for c++
                null_ls.builtins.formatting.clang_format,
                null_ls.builtins.diagnostics.clang_check,
                -- Black for python
                --null_ls.builtins.formatting.black.with({
                --        filetypes = { "python" },
                --}),
                null_ls.builtins.formatting.black,
                null_ls.builtins.diagnostics.mypy,
                null_ls.builtins.diagnostics.ruff,

                null_ls.builtins.formatting.beautysh,

                null_ls.builtins.completion.spell,
                require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        },
})

-- Mason null ls
require("mason-null-ls").setup({
        automatic_installation = false,

        methods = {
                diagnostics = true,
                formatting = true,
                code_actions = true,
                completion = true,
                hover = true,
        },

        ensure_installed = {
                "stylua",
                "black",
                "blackd",
                "pyink",
                "beautysh",
                "clang_format",
                "clang_check",
                "isort",
                "autoflake",
        },
})

