local telescope = require("telescope")

telescope.setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = { prompt_position = "top" },
        sorting_strategy = 'ascending',
    },
}

local function load_extension(extensions)
    for _, extension in ipairs(extensions) do
        telescope.load_extension(extension)
    end
end

load_extension({"persistence", "workspace"})
