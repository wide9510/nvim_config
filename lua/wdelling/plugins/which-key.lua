return {
	-- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		local wk = require("which-key")
		wk.setup()

		wk.add({
			{ "<leader>b",  group = "De[B]ugger" },
			{ "<leader>c",  group = "[C]ode" },
			{ "<leader>d",  group = "[D]ocument" },
			{ "<leader>r",  group = "[R]ename" },
			{ "<leader>s",  group = "[S]earch" },
			{ "<leader>t",  group = "[T]erminal" },
			{ "<leader>w",  group = "[W]orkspace" },
			{ "<leader>g",  group = "[G]it" },
			{ "<leader>;",  group = "Run Tasks" },
		})
	end,
}
