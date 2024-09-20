return {
	{
		"stevearc/overseer.nvim",
		opts = {
			strategy = "toggleterm",
			task_list = {
				direction = "left",
				bindings = {
					vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
				}
			}
		},
	},
	{
		vim.keymap.set("n", "<leader>;", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			-- require("overseer").toggle()
			require("overseer").run_template({})
		end),
	},
}
