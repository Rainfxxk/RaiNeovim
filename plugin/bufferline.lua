require("bufferline").setup{
    options = {
		mode = "buffers",
        always_show_bufferline = false,
        -- always_show_bufferline = true,
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
	},
    highlights = {
        fill = {
            fg = { attribute = "fg", highlight = "Normal" },
            -- bg = { attribute = "bg", highlight = "NeoTreeTabInactive" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        -- background = {
        --     fg = { attribute = "fg", highlight = "Normal" },
        --     bg = { attribute = "bg", highlight = "NeoTreeTabInactive" },
        -- },
        -- buffer_visible = {
        --     fg = { attribute = "fg", highlight = "Normal" },
        --     bg = { attribute = "ctermbg", highlight = "Normal" },
        -- },
        -- buffer_selected = {
        --     fg = { attribute = "fg", highlight = "Normal" },
        --     bg = { attribute = "bg", highlight = "Normal" },
        --     -- bg = "#363d48",
        --     bold = false,
        --     italic = false,
        -- },
        offset_separator = {
            fg = { attribute = "fg", highlight = "WinSeparator" },
            bg = { attribute = "bg", highlight = "Normal" },
        }
        -- separator = {
        --     fg = { attribute = "fg", highlight = "Normal" },
        --     bg = { attribute = "bg", highlight = "Normal" },
        -- },
        -- separator_selected = {
        --     fg = { attribute = "fg", highlight = "Normal" },
        --     bg = { attribute = "bg", highlight = "Normal" },
        --     bold = false,
        --     italic = false,
        -- },
        -- separator_visible = {
        --     fg = { attribute = "fg", highlight = "Normal" },
        --     bg = { attribute = "bg", highlight = "StatusLineNC" },
        -- },
    --     modified = {
    --         fg = { attribute = "bg", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "StatusLine" },
    --     },
    --     modified_selected = {
    --         fg = { attribute = "red", highlight = "Normal" },
    --         -- fg = "#363d48",
    --         -- bg = { attribute = "bg", highlight = "Normal" },
    --         bg = "#363d48",
    --         -- bg = "#ffffff",
    --         bold = false,
    --         italic = false,
    --     },
    --     modified_visible = {
    --         fg = { attribute = "bg", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "StatusLineNC" },
    --     },
        -- close_button = {
        --     fg = { attribute = "fg", highlight = "Normal" },
        --     bg = { attribute = "bg", highlight = "StatusLine" },
        -- },
    --     close_button_selected = {
    --         fg = { attribute = "fg", highlight = "Normal" },
    --         -- bg = { attribute = "bg", highlight = "Normal" },
    --         bg = "#363d48",
    --         bold = false,
    --         italic = false,
    --     },
    --     close_button_visible = {
    --         fg = { attribute = "yellow", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --     },
    --     diagnostic = {
    --         fg = { attribute = "yellow", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "StatusLine" },
    --     },
    --         diagnostic_visible = {
    --         fg = { attribute = "yellow", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "StatusLine" },
    --         },
    --         diagnostic_selected = {
    --         fg = { attribute = "yellow", highlight = "Normal" },
    --         -- bg = { attribute = "bg", highlight = "Normal" },
    --         bg = "#363d48",
    --             bold = true,
    --             italic = true,
    --         },

    --     info_diagnostic = {
    --         fg = { attribute = "fg", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --         sp = { attribute = "fg", highlight = "Normal" },
    --     },
    --     info_diagnostic_visible = {
    --         fg = { attribute = "fg", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --     },
    --     info_diagnostic_selected = {
    --         fg = { attribute = "fg", highlight = "Normal" },
    --         bg = "#363d48",
    --         sp = { attribute = "fg", highlight = "Normal" },
    --         bold = false,
    --         italic = false,
    --     },
    --     warning = {
    --         fg = { attribute = "yellow", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --         sp = { attribute = "fg", highlight = "Normal" },
    --         },
    --         warning_visible = {
    --         fg = { attribute = "yellow", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --         },
    --         warning_selected = {
    --         fg = { attribute = "yellow", highlight = "Normal" },
    --         bg = "#363d48",
    --         sp = { attribute = "yellow", highlight = "Normal" },
    --             bold = true,
    --             italic = true,
    --         },
    },
}
