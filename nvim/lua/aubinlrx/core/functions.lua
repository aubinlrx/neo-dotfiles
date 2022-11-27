-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- [[ Split a string by separator ]]
local function split(str, sep)
	local result = {}
	local regex = ("([^%s]+)"):format(sep)
	for each in str:gmatch(regex) do
		table.insert(result, each)
	end
	return result
end

local function is_not_current_file_rb_file()
	return vim.bo.filetype ~= "ruby"
end

-- [[ Open file to a specific line ]]
local function open_to_line(opts)
	local filename = split(opts.args, ":")
	local file_path = ""

	if #filename == 1 then
		file_path = filename[1]
	else
		file_path = "+" .. filename[2] .. " " .. filename[1]
	end

	vim.cmd("e " .. file_path)
end
vim.api.nvim_create_user_command("Open", open_to_line, { nargs = 1 })

-- [[ Locate file from _spec.rb file ]]
local function rb_file_from_spec()
	local filetype = vim.bo.filetype

	if filetype ~= "ruby" then
		return ""
	end

	local file = vim.fn.expand("%")
	local is_spec = file:match("^spec/.*")
	if is_spec then
		file = string.gsub(file, "spec/", "app/")
		file = string.gsub(file, "_spec.rb", ".rb")
	else
		return ""
	end

	return file
end

-- [[ Determine if filename is a spec ]]
local function is_spec_file(filename)
	return filename:match("_spec.rb$")
end

-- [[ Locate spec from ruby file or return filename if already a spec ]]
local function spec_filename()
	local filetype = vim.bo.filetype
	local filename = vim.fn.expand("%")

	if filetype ~= "ruby" then
		print(filename)
		return
	end

	if is_spec_file(filename) then
		return filename
	end

	local filename_wo_ext = vim.fn.expand("%:r")

	local spec_file = ""
	if filename_wo_ext:match("^app/.*") then
		spec_file = string.gsub(filename_wo_ext, "app/", "spec/") .. "_spec.rb"
	elseif filename_wo_ext:match("^scripts/.*") then
		spec_file = "spec/" .. filename_wo_ext .. "_spec.rb"
	end

	return spec_file
end

-- [[ Open file from spec ]]
local function open_rb_file_from_spec()
	local filetype = vim.bo.filetype

	if filetype ~= "ruby" then
		print(vim.fn.expand("%") .. " is not a ruby file.")
	end

	local file = rb_file_from_spec()

	if file == "" then
		print("Can't open file from spec " .. vim.fn.expand("%"))
	else
		vim.cmd("e " .. file)
	end
end
vim.api.nvim_create_user_command("OpenFile", open_rb_file_from_spec, { nargs = 0 })

-- [[ Open spec from file]]
local function open_rb_spec_from_file()
	local filetype = vim.bo.filetype

	if filetype ~= "ruby" then
		print(vim.fn.expand("%") .. " is not ruby a file.")
	end

	local spec_file = spec_filename()

	if spec_file == "" then
		print("Can't open spec file for" .. vim.fn.expand("%"))
	else
		vim.cmd("e " .. spec_file)
	end
end
vim.api.nvim_create_user_command("OpenSpec", open_rb_spec_from_file, { nargs = 0 })

-- [[ Run spec ]]
local function rb_run_spec()
	local filetype = vim.bo.filetype

	if filetype ~= "ruby" then
		print(vim.fn.expand("%") .. " is not a ruby file.")
		return
	end

	local spec_file = spec_filename()

	if spec_file == "" then
		print("Can't determine spec for " .. vim.fn.expand("%"))
	else
		vim.cmd(
			"AsyncRun! /Applications/Alacritty.app/Contents/MacOS/alacritty --hold --working-directory $(pwd) -e bundle exec ./bin/rspec "
				.. spec_file
		)
	end
end
vim.api.nvim_create_user_command("Rspec", rb_run_spec, { nargs = 0 })

-- [[ Run spec for a specific line ]]
local function rb_run_line_spec()
	if is_not_current_file_rb_file() then
		print(vim.fn.expand("%") .. " is not a ruby file.")
		return
	end

	local spec_file = spec_filename()
	local line = vim.api.nvim_win_get_cursor(0)

	if spec_file == "" then
		print("Can't determine spec for " .. vim.fn.expand("%"))
	else
		vim.cmd(
			":AsyncRun! /Applications/Alacritty.app/Contents/MacOS/alacritty --hold --working-directory $(pwd) -e bundle exec ./bin/rspec "
				.. spec_file
				.. ":"
				.. line[1]
		)
	end
end
vim.api.nvim_create_user_command("Lspec", rb_run_line_spec, { nargs = 0 })

local function get_directory(filename)
	local directories = split(filename, "/")
	directories[#directories] = nil

	return table.concat(directories, "/")
end

local function rename_file()
	local old_name = vim.fn.expand("%")
	local new_name = vim.fn.input("Rename: ", old_name, "file")

	if new_name ~= "" and new_name ~= old_name then
		local directory = get_directory(new_name)
		vim.fn.mkdir(directory, "p")

		vim.cmd("saveas " .. new_name)
		vim.cmd("silent !rm " .. old_name)
		vim.cmd("redraw!")
	end
end
vim.api.nvim_create_user_command("RenameFile", rename_file, { nargs = 0 })

local function edit_file(filename)
	if filename == "" then
		return
	end

	local directory = get_directory(filename)

	vim.fn.mkdir(directory, "p")
	vim.cmd("e " .. filename)
	vim.cmd("w")
	vim.cmd("redraw!")
end

local function edit_file_in_current_dir()
	local current_file = vim.fn.expand("%")
	local current_directory = get_directory(current_file)
	local new_file = vim.fn.input("Create: ", current_directory, "file")

	return edit_file(new_file)
end
vim.api.nvim_create_user_command("CreateFile", edit_file_in_current_dir, { nargs = 0 })

local function rb_edit_spec()
	if is_not_current_file_rb_file() then
		print(vim.fn.expand("%") .. " is not a ruby file.")
		return
	end

	local filename = spec_filename()

	if vim.fn.filereadable(filename) ~= 0 then
		open_rb_spec_from_file()
	else
		edit_file(filename)
	end
end
vim.api.nvim_create_user_command("EditSpec", rb_edit_spec, { nargs = 0 })
