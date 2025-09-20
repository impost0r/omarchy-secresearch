return {
	{
		name = "theme-hotreload",
		dir = vim.fn.stdpath("config"),
		lazy = false,
		priority = 1000,
		config = function()
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyReload",
				callback = function()
					-- Clear the theme module cache
					package.loaded["plugins.theme"] = nil

					local ok, theme_spec = pcall(require, "plugins.theme")
					if ok and theme_spec then
						for _, spec in ipairs(theme_spec) do
							if spec[1] == "LazyVim/LazyVim" and spec.opts and spec.opts.colorscheme then
								local colorscheme = spec.opts.colorscheme
								-- Defer to next tick to escape the autocmd context
								vim.defer_fn(function()
									require("lazy.core.loader").colorscheme(colorscheme)

									pcall(vim.cmd.colorscheme, colorscheme)

									local transparency_file = vim.fn.stdpath("config")
										.. "/plugin/after/transparency.lua"
									if vim.fn.filereadable(transparency_file) == 1 then
										vim.cmd.source(transparency_file)
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
