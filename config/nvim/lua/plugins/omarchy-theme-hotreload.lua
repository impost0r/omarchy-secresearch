return {
	{
		name = "omarchy-theme-hotreload",
		dir = vim.fn.stdpath("config"),
		lazy = false,
		priority = 1000,
		config = function()
			local function reload_theme()
				-- Clear the module cache
				package.loaded["plugins.theme"] = nil

				local ok, theme_spec = pcall(require, "plugins.theme")
				if ok and theme_spec then
					for _, spec in ipairs(theme_spec) do
						if spec[1] == "LazyVim/LazyVim" and spec.opts and spec.opts.colorscheme then
							local colorscheme = spec.opts.colorscheme

							vim.schedule(function()
								pcall(vim.cmd, "colorscheme " .. colorscheme)
								vim.notify("Theme reloaded: " .. colorscheme, vim.log.levels.INFO)

								-- Reapply transparency if it exists
								local transparency_file = vim.fn.stdpath("config") .. "/plugin/after/transparency.lua"
								if vim.fn.filereadable(transparency_file) == 1 then
									vim.cmd("source " .. transparency_file)
								end
							end)
							break
						end
					end
				end
			end

			-- Listen to Lazy's reload event
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyReload",
				callback = reload_theme,
			})
		end,
	},
}
