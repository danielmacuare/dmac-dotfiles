return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
                integrations = {
                    --cmp = true,
                    gitsigns = true,
                    --mason = true,
                    --lualine = true,
                    neotree = true,
                    --treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    telescope = {
                        enabled = true,
                        -- style = "nvchad"
                    },
                },
            })
            vim.cmd.colorscheme "catppuccin"
        end,
    }
}
