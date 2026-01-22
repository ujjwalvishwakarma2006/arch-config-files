-- ================================================================================================
-- TITLE : auto-commands
-- ABOUT : automatically run code on defined events (e.g. save, yank)
-- ================================================================================================
-- local on_attach = require("utils.lsp").on_attach

-- Restore last cursor position when reopening a file
local last_cursor_group = vim.api.nvim_create_augroup("LastCursorGroup", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = last_cursor_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Highlight the yanked text for 200ms
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYank", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- format on save using efm langserver and configured formatters
local lsp_fmt_group = vim.api.nvim_create_augroup("FormatOnSaveGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group,
	callback = function()
		local efm = vim.lsp.get_clients({ name = "efm" })
		if vim.tbl_isempty(efm) then
			return
		end
	end,
})

-- on attach function shortcuts
-- local lsp_on_attach_group = vim.api.nvim_create_augroup("LspMappings", {})
-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = lsp_on_attach_group,
-- 	callback = on_attach,
-- })

-- Add to the end of your autocmds. lua file

-- Apply custom transparency settings after colorscheme loads
vim.api.nvim_create_augroup("CustomTransparency", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	group = "CustomTransparency",
	pattern = "duskfox",
	callback = function()
		-- Get duskfox palette
		local palette = require("nightfox.palette").load("duskfox")
		
		-- Set highlights with semi-transparent backgrounds
		vim.api.nvim_set_hl(0, "Visual", { bg = palette.bg1 })
		vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = palette.bg1 })
		vim.api.nvim_set_hl(0, "Search", { bg = palette.sel0, fg = palette.fg1 })
		vim.api.nvim_set_hl(0, "IncSearch", { bg = palette.sel0, fg = palette.fg1 })
	end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
	group = "CustomTransparency",
	pattern = "tokyonight*",
	callback = function()
		-- Get tokyonight colors
		local colors = require("tokyonight.colors").setup()
		
		-- Set highlights with semi-transparent backgrounds
		vim.api.nvim_set_hl(0, "Visual", { bg = colors.bg_visual })
		vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = colors. bg_highlight })
		vim.api.nvim_set_hl(0, "Search", { bg = colors.orange, fg = colors.bg })
		vim.api.nvim_set_hl(0, "IncSearch", { bg = colors.orange, fg = colors.bg })
	end,
})
