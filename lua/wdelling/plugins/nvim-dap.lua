return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dapvscode = require("dap.ext.vscode")
		local toggleterm = require("toggleterm")

		require("dapui").setup()

		vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

		vim.keymap.set("n", "<F5>", function()
			dap.continue()
		end)
		vim.keymap.set("n", "<F10>", function()
			dap.step_over()
		end)
		vim.keymap.set("n", "<F11>", function()
			dap.step_into()
		end)
		vim.keymap.set("n", "<F12>", function()
			dap.step_out()
		end)
		vim.keymap.set("n", "<Leader>bt", function()
			dap.toggle_breakpoint()
		end, {desc = "Toggle breakpoint"})
		vim.keymap.set("n", "<Leader>bs", function()
			dap.set_breakpoint()
		end, {desc = "Set breakpoint"})
		vim.keymap.set("n", "<Leader>bo", function()
			dapui.toggle()
		end, {desc = "Toggle UI"})
		vim.keymap.set("n", "<Leader>bl", function()
			dapvscode.load_launchjs(nil, { cppdbg = { "c", "cpp" } })
			dap.continue()
		end, {desc = "Start debugger"})

		dap.listeners.after.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
			vim.cmd("ToggleTerm")
		end

		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = "/home/wdelling/.vscode-server/extensions/ms-vscode.cpptools-1.21.6/debugAdapters/bin/OpenDebugAD7",
		}
	end,
}
