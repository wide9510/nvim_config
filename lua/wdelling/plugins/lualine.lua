return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		local cmake = require("cmake-tools")

		local cmakeTable = {}
		local function ins_left(component)
			table.insert(cmakeTable, component)
		end

		-- ins_left({
		-- 	function()
		-- 		local type = cmake.get_configure_preset()
		-- 		return "[" .. (type and type or "") .. "]"
		-- 	end,
		-- 	cond = function()
		-- 		return cmake.is_cmake_project() --and not cmake.has_cmake_preset()
		-- 	end,
		-- 	on_click = function(n, mouse)
		-- 		if n == 1 then
		-- 			if mouse == "l" then
		-- 				vim.cmd("CMakeSelectConfigurePreset")
		-- 			end
		-- 		end
		-- 	end,
		-- })
		-- --
		-- ins_left({
		-- 	function()
		-- 		local kit = cmake.get_kit()
		-- 		return "[" .. (kit and kit or "No active kit") .. "]"
		-- 	end,
		-- 	icon = icons.ui.Pencil,
		-- 	cond = function()
		-- 		return cmake.is_cmake_project() --and not cmake.has_cmake_preset()
		-- 	end,
		-- 	on_click = function(n, mouse)
		-- 		if n == 1 then
		-- 			if mouse == "l" then
		-- 				vim.cmd("CMakeSelectKit")
		-- 			end
		-- 		end
		-- 	end,
		-- })

		--
		-- ins_left({
		-- 	function()
		-- 		local c_preset = cmake.get_configure_preset()
		-- 		return "[" .. (c_preset and c_preset or "No Build Preset Selected") .. "]"
		-- 	end,
		-- 	icon = icons.ui.Search,
		-- 	cond = function()
		-- 		return cmake.is_cmake_project() and not cmake.has_cmake_preset()
		-- 	end,
		-- 	on_click = function(n, mouse)
		-- 		if n == 1 then
		-- 			if mouse == "l" then
		-- 				vim.cmd("CMakeSelectBuildType")
		-- 			end
		-- 		end
		-- 	end,
		-- })
		--
		-- ins_left({
		-- 	function()
		-- 		local b_target = cmake.get_build_target()
		-- 		return "[" .. (b_target and b_target or "Build Target") .. "]"
		-- 	end,
		-- 	cond = cmake.is_cmake_project,
		-- 	on_click = function(n, mouse)
		-- 		if n == 1 then
		-- 			if mouse == "l" then
		-- 				vim.cmd("CMakeSelectBuildTarget")
		-- 			end
		-- 		end
		-- 	end,
		-- })
		--
		-- ins_left({
		-- 	function()
		-- 		return "Build"
		-- 	end,
		-- 	icon = icons.ui.Gear,
		-- 	cond = cmake.is_cmake_project,
		-- 	on_click = function(n, mouse)
		-- 		if n == 1 then
		-- 			if mouse == "l" then
		-- 				vim.cmd("CMakeBuild")
		-- 			end
		-- 		end
		-- 	end,
		-- })

		-- ins_left({
		-- 	function()
		-- 		return icons.ui.Debug
		-- 	end,
		-- 	cond = cmake.is_cmake_project,
		-- 	on_click = function(n, mouse)
		-- 		if n == 1 then
		-- 			if mouse == "l" then
		-- 				vim.cmd("CMakeDebug")
		-- 			end
		-- 		end
		-- 	end,
		-- })
		-- ins_left({
		-- 	function()
		-- 		return icons.ui.Run
		-- 	end,
		-- 	cond = cmake.is_cmake_project,
		-- 	on_click = function(n, mouse)
		-- 		if n == 1 then
		-- 			if mouse == "l" then
		-- 				vim.cmd("CMakeRun")
		-- 			end
		-- 		end
		-- 	end,
		-- })

		-- ins_left({
		-- 	function()
		-- 		local l_target = cmake.get_launch_target()
		-- 		return "[" .. (l_target and l_target or "unspecified") .. "]"
		-- 	end,
		-- 	cond = cmake.is_cmake_project,
		-- 	on_click = function(n, mouse)
		-- 		if n == 1 then
		-- 			if mouse == "l" then
		-- 				vim.cmd("CMakeSelectLaunchTarget")
		-- 			end
		-- 		end
		-- 	end,
		-- })

		local colors = {
			blue = "#65D1FF",
			green = "#3EFFDC",
			violet = "#FF61EF",
			yellow = "#FFDA7B",
			red = "#FF4A4A",
			fg = "#c3ccdc",
			bg = "#112638",
			inactive_bg = "#2c3043",
		}

		local my_lualine_theme = {
			normal = {
				a = { bg = colors.blue, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			insert = {
				a = { bg = colors.green, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			visual = {
				a = { bg = colors.violet, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			command = {
				a = { bg = colors.yellow, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			replace = {
				a = { bg = colors.red, fg = colors.bg, gui = "bold" },
				b = { bg = colors.bg, fg = colors.fg },
				c = { bg = colors.bg, fg = colors.fg },
			},
			inactive = {
				a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = "bold" },
				b = { bg = colors.inactive_bg, fg = colors.semilightgray },
				c = { bg = colors.inactive_bg, fg = colors.semilightgray },
			},
		}

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "gruvbox",
			},
			sections = {
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					-- { "encoding" },
					-- { "fileformat" },
					{ "filetype" },
				},
				lualine_c = cmakeTable,
			},
		})
	end,
}
