return {
    "nvim-treesitter/nvim-treesitter",
	branch = "master",
    build = ":TSUpdate",
    -- Use events for better startup performance
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = {
                "bash", "c", "cpp", "css", "dockerfile", "go", "html",
                "javascript", "json", "lua", "markdown", "markdown_inline",
                "python", "rust", "svelte", "typescript", "vue", "yaml",
            },
            auto_install = true,
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<CR>",
                    node_incremental = "<CR>",
                    scope_incremental = "<TAB>",
                    node_decremental = "<S-TAB>",
                },
            },
        })
    end,
}
