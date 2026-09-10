require("leetcode").setup({
    arg = "leetcode",
    lang = "cpp",
    -- leetcode.cn
    cn = {
        enabled = true,
        translator = true,
        translate_problems = true,
    },
    injector = { -- @type table<lc.lang, lc.inject>
        ["cpp"] = {
            imports = function()
                -- return a different list to omit default imports
                return { "#include <bits/stdc++.h>", "using namespace std;" }
            end,
            after = "int main() {}",
        },
    },
})
