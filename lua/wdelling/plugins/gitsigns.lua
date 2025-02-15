return {
	"lewis6991/gitsigns.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("gitsigns").setup({
			current_line_blame = true, -- Enable inline blame
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- Position blame at the end of the line
				delay = 500, -- Delay in milliseconds before showing blame
				ignore_whitespace = false, -- Show blame even for whitespace-only changes
			},
			current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			-- keymaps = {
			-- 	-- Default keymaps
			-- 	noremap = true,
			-- 	["n ]c"] = { expr = true, "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'" },
			-- 	["n [c"] = { expr = true, "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'" },
				-- ["n <leader>hs"] = "<cmd>Gitsigns stage_hunk<CR>",
				-- ["n <leader>hr"] = "<cmd>Gitsigns reset_hunk<CR>",
				-- ["v <leader>hs"] = ":Gitsigns stage_hunk<CR>",
				-- ["v <leader>hr"] = ":Gitsigns reset_hunk<CR>",
				-- ["n <leader>hS"] = "<cmd>Gitsigns stage_buffer<CR>",
				-- ["n <leader>hu"] = "<cmd>Gitsigns undo_stage_hunk<CR>",
				-- ["n <leader>hR"] = "<cmd>Gitsigns reset_buffer<CR>",
				-- ["n <leader>hp"] = "<cmd>Gitsigns preview_hunk<CR>",
				-- ["n <leader>hb"] = "<cmd>Gitsigns blame_line<CR>",
				-- ["n <leader>tb"] = "<cmd>Gitsigns toggle_current_line_blame<CR>",
				-- ["n <leader>hd"] = "<cmd>Gitsigns diffthis<CR>",
				-- ["n <leader>hD"] = "<cmd>Gitsigns diffthis ~<CR>",
				-- ["n <leader>td"] = "<cmd>Gitsigns toggle_deleted<CR>",
			-- },
		})
	end,
}
