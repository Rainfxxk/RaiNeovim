require("blink.cmp").setup{
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

        ['<s-tab>'] = { 'select_prev', "snippet_backward", 'fallback' },
        ['<tab>'] = { 'select_next', "snippet_forward", 'fallback' },
        ['<Up>'] = { 'select_prev', "snippet_backward", 'fallback' },
        ['<Down>'] = { 'select_next', "snippet_forward", 'fallback' },

        -- disable a keymap from the preset
        ['<C-e>'] = false, -- or {}
  
        -- show with a list of providers
        -- ['<C-space>'] = { "show", "hide", "show_documentation", "hide_documentation" },
        ['<C-space>'] = { "show", "show_documentation", "hide_documentation" },
        

        -- control whether the next command will be run when using a function
        ['<C-n>'] = { 
            function(cmp)
                if some_condition then return end -- runs the next command
                return true -- doesn't run the next command
            end,
            'select_next'
        },
    },


    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { 
        menu = { border = 'single' },
        documentation = {
            window = { 
                border = 'single',
            },
            auto_show = true,
        },
    },

    signature = { window = { border = 'single' } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information

    fuzzy = { implementation = "prefer_rust_with_warning" },
    -- opts_extend = { "sources.default" }
    --
}
