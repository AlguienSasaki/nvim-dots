--lervag/vimtexlocal ensure_packer = function()
--  local fn = vim.fn
--  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
--  if fn.empty(fn.glob(install_path)) > 0 then
--    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
--    vim.cmd [[packadd packer.nvim]]
--    return true
--  end
--  return false
--end
--
--
--local packer_bootstrap = ensure_packer()
--

-- lua/core/plugins.lua
local ensure_packer = function()
        local fn = vim.fn
        local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
                fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
                vim.cmd([[packadd packer.nvim]])
                return true
        end
        return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
        use("wbthomason/packer.nvim")
        use("nvim-lualine/lualine.nvim")
        use("lervag/vimtex")
        use("nvim-tree/nvim-tree.lua")
        use("nvim-tree/nvim-web-devicons")
        use("petertriho/cmp-git")
        use("christoomey/vim-tmux-navigator")
        use("brianhuster/live-preview.nvim")
        use({ "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" })
        use("nathanaelkane/vim-indent-guides")
        use("folke/todo-comments.nvim")
        --use 'folke/trouble.nvim'
        use("jiangmiao/auto-pairs")
        use("stevearc/dressing.nvim")
        use("windwp/nvim-ts-autotag")

        use({
                "epwalsh/obsidian.nvim",
                tag = "*", -- recommended, use latest release instead of latest commit
                requires = {
                        -- Required.
                        "nvim-lua/plenary.nvim",

                        -- see below for full list of optional dependencies 👇
                },
        })

        use({
                "akinsho/toggleterm.nvim",
                tag = "*",
                config = function()
                        require("toggleterm").setup()
                end,
        })
        use({
                "nvim-telescope/telescope.nvim",
                tag = "0.1.8",
                requires = { { "nvim-lua/plenary.nvim" } },
        })
        use("rebelot/kanagawa.nvim")
        use({
                "nvim-treesitter/nvim-treesitter",
                run = function()
                        local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
                        ts_update()
                end,
        })

        use({
                "folke/trouble.nvim",
                config = function()
                        require("trouble").setup()
                        local opts = { noremap = true, silent = true }
                        vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", opts)
                        vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>", opts)
                        vim.api.nvim_set_keymap("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                                opts)
                        vim.api.nvim_set_keymap("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", opts)
                        vim.api.nvim_set_keymap(
                                "n",
                                "<leader>cl",
                                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                                opts
                        )
                        vim.api.nvim_set_keymap("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", opts)
                        vim.api.nvim_set_keymap("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", opts)
                end,
        })
        use("mason-org/mason.nvim")
        use("mason-org/mason-lspconfig.nvim")
        use("neovim/nvim-lspconfig")
        use("nvim-telescope/telescope-ui-select.nvim")

        -- Nvim Cmp
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-cmdline")
        use("hrsh7th/nvim-cmp")
        --
        --  use 'hrsh7th/cmp-vsnip'
        --  use 'hrsh7th/vim-vsnip'
        --
        use("L3MON4D3/LuaSnip")
        use("saadparwaiz1/cmp_luasnip")

        use("nvim-lua/plenary.nvim")
        use("nvimtools/none-ls.nvim")
        use("nvimtools/none-ls-extras.nvim")

        --Snippets
        use("rafamadriz/friendly-snippets")
        use("jay-babu/mason-null-ls.nvim")

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
                require("packer").sync()
        end
end)
