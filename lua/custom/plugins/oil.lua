local detail = false

return {
	'stevearc/oil.nvim',
	opts = {
		delete_to_trash = false,
		keymaps = {
			['<C-r>'] = {
				desc = 'Run a command on a file',
				callback = function()
					local oil = require('oil');
					-- local selectedLine = vim.fn.getpos("v")[2]
					-- local theFile = require('oil').get_entry_on_line(0, selectedLine);
					local theDir = oil.get_current_dir();
					local theFile = oil.get_cursor_entry();
					-- local fullPath = theDir .. theFile.name;

					-- Construct the full path safely (handles path separators)
					local fullPath = vim.fs.joinpath(theDir, theFile.name)
					-- Escape the path for safe use in a shell command
					local escapedDir = vim.fn.shellescape(theDir);
					local escapedEntryName = vim.fn.shellescape(theFile.name) -- Usually just the name
					local escapedFullPath = vim.fn.shellescape(fullPath)

					-- Prompt the user for a command
					vim.ui.input({ prompt = "Run command: " }, function(userInput)
						-- If the user cancelled (pressed Esc) or entered nothing, do nothing
						if userInput == nil or userInput == "" then
							vim.notify("Command execution cancelled.", vim.log.levels.INFO)
							return
						end

						-- Trim leading/trailing whitespace from user input
						local commandBase = string.gsub(userInput, "^%s*(.-)%s*$", "%1")

						-- Construct the final command by appending the escaped path with a space
						-- local finalCommand = commandBase .. " " .. escapedFullPath
						local finalCommand = string.format("(cd %s && %s %s)",
							escapedDir,
							commandBase,
							escapedEntryName);


						-- Execute the command in the shell
						-- Using vim.cmd('!') executes and shows output (waits for Enter)
						-- Alternatively, use vim.cmd('term ' .. finalCommand) to run in a new terminal buffer
						vim.notify("Executing: " .. finalCommand, vim.log.levels.INFO)
						vim.cmd('!' .. finalCommand)

                        -- Optional: Refresh oil buffer after command execution
                        -- Might be useful if the command modified the file system
                        -- vim.cmd('Oil '..theDir) -- Reopen oil at the current dir
                        -- or just refresh the current buffer if supported by your oil version/config
                        -- oil.refresh()
						require("oil.actions").refresh.callback();


					end)
					-- TODO: ask a promt
					-- TODO: add fullPath to end of the prompt with one space if not exist
					-- TODO: run the prompt in console
				end,
			},
			['gl'] = {
				desc = 'Toggle file detail view',
				callback = function()
					detail = not detail
					if detail then
						require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
					else
						require('oil').set_columns { 'icon' }
					end
				end,
			},
		},
	},
	-- Optional dependencies
	dependencies = { 'nvim-tree/nvim-web-devicons' },
}
