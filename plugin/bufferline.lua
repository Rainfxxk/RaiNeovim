local function highlights()
    -- 定义一个辅助函数，快速生成引用式配置
    local function ref(attr)
      return { attribute = attr, highlight = "Normal" }
    end

    -- 覆盖所有可能影响背景和前景的高亮组
    local groups = {
      "background", "buffer_selected", "buffer_visible", "close_button",
      "close_button_visible", "close_button_selected", "fill", "indicator_selected",
      "indicator_visible", "modified", "modified_selected", "modified_visible",
      "numbers", "numbers_selected", "numbers_visible", "separator",
      "separator_selected", "separator_visible", "tab", "tab_selected",
      "tab_close", "duplicate", "duplicate_selected", "duplicate_visible",
      "pick", "pick_selected", "pick_visible",
      -- LSP 诊断相关
      "error", "error_diagnostic", "error_visible",
      "warning", "warning_diagnostic", "warning_visible",
      "info", "info_diagnostic", "info_visible",
      "hint", "hint_diagnostic", "hint_visible",
    }

    local highlights = {}
    for _, name in ipairs(groups) do
      highlights[name] = {
        fg = ref("fg"),
        bg = ref("bg"),
      }
    end

    highlights.background = {
        fg = { attribute = "fg", highlight = "WhiteSpace" },
        bg = { attribute = "bg", highlight = "Normal" },
    }
    highlights.offset_separator = {
        fg = { attribute = "fg", highlight = "WinSeparator" },
        bg = { attribute = "bg", highlight = "Normal" },
    }
    highlights.separator = {
        fg = { attribute = "bg", highlight = "Normal" },
        bg = { attribute = "bg", highlight = "Normal" },
    }

    return highlights
end

require("bufferline").setup{
    options = {
		mode = "buffers",
        always_show_bufferline = false,
        offsets = {
		    {
				filetype = "neo-tree",
				text = "📁File",
                separator = true,
                highlight = "Normal"
			},
		},

        indicator = {
            -- icon = '> ',
            style = "icon", -- "icon", "underline",
        },

        -- name_formatter = function(buf)
        --     -- buf 包含 "name", "path", "bufnr" 等字段
        --     local name = vim.fn.fnamemodify(buf.name, ":t") -- 只取文件名

        --     -- 判断是否为当前选中 buffer
        --     if buf.bufnr == vim.api.nvim_get_current_buf() then
        --         return "[" .. name .. "]"
        --     end

        --     return name
        -- end,

        diagnostics = "nvim_lsp",
        diagnostics_indicator = function( _, _, diag )
            local ret = (diag.error and  "E" .. diag.error .. " " or "") .. (diag.warning and "W" .. diag.warning or "")
            return vim.trim(ret)
        end,
        custom_areas = {
            right = function()
                local result = {
                    {text = ' Rain ', link = "Normal"},
                }
                return result
            end,
        },
	},

    highlights = highlights()
    -- highlights = {
    --     fill = {
    --         fg = { attribute = "fg", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --     },
    --     background = {
    --         fg = { attribute = "fg", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --     },
    --     separator = {
    --         fg = { attribute = "bg", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --     },
    --     close_button = {
    --         fg = { attribute = "bg", highlight = "Normal" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --     },
    --     offset_separator = {
    --         fg = { attribute = "fg", highlight = "WinSeparator" },
    --         bg = { attribute = "bg", highlight = "Normal" },
    --     }
    -- },
}
