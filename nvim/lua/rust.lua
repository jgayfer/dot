local opts = {
	tools = {
		inlay_hints = {
			only_current_line = true,
			only_current_line_autocmd = "CursorMoved"
		}
	}
}

require('rust-tools').setup(opts)
