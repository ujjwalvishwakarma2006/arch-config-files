-- ================================================================================================
-- TITLE : melange-nvim
-- ABOUT :  A subtle, warm colorscheme for Neovim inspired by Sublime Text's Melange theme. 
-- LINKS :
--   > github : https://github.com/savq/melange-nvim
-- ================================================================================================

return {
	{
		"xiyaowong/nvim-transparent",
		lazy = false,
		priority = 999,
	},

	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 999,
		config = function()
			require("nightfox").setup({
				options = {
					transparent = true,
				},
			})

			-- Uncomment this to make duskfox the default: 
			-- vim.cmd("colorscheme duskfox")
		end,
	},
	
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 999,
		opts = {
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
			on_colors = function(colors)
				colors.bg_statusline = colors.none
			end,
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			-- This makes tokyonight the default
			vim.cmd("colorscheme tokyonight")
		end,
	},
}
