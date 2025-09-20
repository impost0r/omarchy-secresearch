return {
	{
		name = "theme-hotreload",
		dir = vim.fn.stdpath("config"),
		lazy = false,
		priority = 1000,
		config = function()
			-- Cache the transparency file path
			local transparency_file = vim.fn.stdpath("config") .. "/plugin/after/transparency.lua"
			local has_transparency = vim.fn.filereadable(transparency_file) == 1

			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyReload",
				callback = function()
					package.loaded["plugins.theme"] = nil

					local ok, theme_spec = pcall(require, "plugins.theme")
					if ok and theme_spec then
						for _, spec in ipairs(theme_spec) do
							if spec[1] == "LazyVim/LazyVim" and spec.opts and spec.opts.colorscheme then
								local colorscheme = spec.opts.colorscheme

								vim.defer_fn(function()
									local colorscheme_available =
										vim.tbl_contains(vim.fn.getcompletion("", "color"), colorscheme)

									if not colorscheme_available then
										require("lazy.core.loader").colorscheme(colorscheme)
									end

									local success = pcall(vim.cmd.colorscheme, colorscheme)

									if success then
										if has_transparency then
											vim.defer_fn(function()
												vim.cmd.source(transparency_file)
											end, 1)
										end
									end
								end, 0)

								break
							end
						end
					end
				end,
			})
		end,
	},
}
