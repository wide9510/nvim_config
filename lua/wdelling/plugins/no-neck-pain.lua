return {
	"shortcuts/no-neck-pain.nvim",
	version = "*",
	vim.keymap.set("n", "|", "<CMD>NoNeckPain<CR>", { desc = "Center the buffer" })
}
