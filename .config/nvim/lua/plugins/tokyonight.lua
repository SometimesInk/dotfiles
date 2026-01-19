return {
	"folke/tokyonight.nvim",
	name = "tokyonight",
	lazy = false,
	priority = 1000,
	opts = {
		style = "storm",
		styles = {
			-- Available styles @ :help nvim_set_hl
			comments = { italic = true },
			keywords = { italic = true },
			functions = {},
			variables = {},
			-- "dark" / "transparent" / "normal"
			sidebars = "transparent",
			floats = "transparent",
		},
		-- lualine_bold = false,
	},
	config = function()
		vim.cmd.colorscheme("tokyonight");
	end,
}
