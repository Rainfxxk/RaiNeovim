require("bufferline").setup{
    options = {
		mode = "buffers",
        always_show_bufferline = false,
        offsets = {
		    {
				filetype = "neo-tree",
				text = "Neo Tree",
                separator = true,
                highlight = "Directory"
			},
		},

        indicator = {
            style = "icon", -- "icon", "underline",
        },

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function( _, _, diag )
            local ret = (diag.error and  "E" .. diag.error .. " " or "") .. (diag.warning and "W" .. diag.warning or "")
            return vim.trim(ret)
        end,
        custom_areas = {
            right = function()
                local result = {
                    {text = ' 󰇘', link = "Normal"},
                }
                return result
            end,
        },
	},

    highlights = {
        fill = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        offset_separator = {
            fg = { attribute = "fg", highlight = "WinSeparator" },
            bg = { attribute = "bg", highlight = "WinSeparator" },
        }
    },
}
