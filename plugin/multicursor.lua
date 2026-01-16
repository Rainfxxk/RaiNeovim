local mc = require("multiple-cursors")
mc.setup {
    custom_key_maps = {
        {"n", "<Leader>.", function() mc.align() end},
    },
}
