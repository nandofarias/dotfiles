local M = {}

---@class AIReviewCommentContext
---@field root string
---@field file string
---@field start_line integer
---@field end_line integer
---@field filetype string
---@field lines string[]
---@field feedback string

---@param context AIReviewCommentContext
---@return string
function M.build_prompt(context)
	return table.concat({
		"Apply this code review comment immediately.",
		"",
		"Repository: " .. context.root,
		"File: " .. context.file,
		string.format("Lines: %d-%d", context.start_line, context.end_line),
		"",
		"Selected code:",
		"```" .. context.filetype,
		table.concat(context.lines, "\n"),
		"```",
		"",
		"Review feedback:",
		context.feedback,
		"",
		"Inspect the surrounding code before editing. Modify the working tree directly, preserve unrelated changes, and run the most focused relevant test or check. Do not only explain the solution.",
	}, "\n")
end

local function send_to_claude(prompt, source_window)
	local ok, terminal = pcall(require, "claudecode.terminal")

	if ok and terminal.send_to_terminal(prompt, { submit = true, focus = false }) then
		vim.notify("Review comment sent to Claude", vim.log.levels.INFO)
		return
	end

	vim.cmd("ClaudeCode")
	vim.defer_fn(function()
		local loaded, retry_terminal = pcall(require, "claudecode.terminal")
		local sent = loaded and retry_terminal.send_to_terminal(prompt, { submit = true, focus = false })

		if sent then
			vim.notify("Review comment sent to Claude", vim.log.levels.INFO)
		else
			vim.notify("Could not send review comment to Claude", vim.log.levels.ERROR)
		end

		if vim.api.nvim_win_is_valid(source_window) then
			vim.api.nvim_set_current_win(source_window)
		end
	end, 500)
end

---@param start_line integer
---@param end_line integer
function M.comment(start_line, end_line)
	local buffer = vim.api.nvim_get_current_buf()
	local source_window = vim.api.nvim_get_current_win()
	local absolute_path = vim.api.nvim_buf_get_name(buffer)

	if absolute_path == "" then
		vim.notify("Review comments require a file-backed buffer", vim.log.levels.WARN)
		return
	end

	if start_line > end_line then
		start_line, end_line = end_line, start_line
	end

	local root = vim.fs.root(absolute_path, ".git") or vim.fn.getcwd()
	local relative_path = vim.fs.relpath(root, absolute_path) or absolute_path
	local lines = vim.api.nvim_buf_get_lines(buffer, start_line - 1, end_line, false)
	local filetype = vim.bo[buffer].filetype

	vim.ui.input({ prompt = "Review comment: " }, function(feedback)
		feedback = feedback and vim.trim(feedback) or ""
		if feedback == "" then
			return
		end

		send_to_claude(
			M.build_prompt({
				root = root,
				file = relative_path,
				start_line = start_line,
				end_line = end_line,
				filetype = filetype,
				lines = lines,
				feedback = feedback,
			}),
			source_window
		)
	end)
end

return M
