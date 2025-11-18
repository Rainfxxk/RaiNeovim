require("blink.cmp").setup{

    cmdline = { enabled = true },
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = {
        -- set to 'none' to disable the 'default' preset
        preset = 'none',
        ['<enter>'] = { "accept", "fallback" },
        ['<tab>'] = { 'select_next', "snippet_forward", 'fallback' },
        ['<s-tab>'] = { 'select_prev', "snippet_backward", 'fallback' },
        ['<Up>'] = { 'select_prev', "snippet_backward", 'fallback' },
        ['<Down>'] = { 'select_next', "snippet_forward", 'fallback' },
        ['<C-e>'] = false, -- or {}
        ['<C-space>'] = { "show", "show_documentation", "hide_documentation" },
        ['<C-n>'] = { 
            function(cmp)
                if some_condition then return end -- runs the next command
                return true -- doesn't run the next command
            end,
            'select_next'
        },
    },


    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
        menu = { border = 'single' },
        documentation = {
            window = {
                border = 'single',
            },
            auto_show = true,
        },
    },

    signature = {
        window = {
            border = 'single'
        }
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
}

local capabilities = {
  textDocument = {
    foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true
    }
  }
}

capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
