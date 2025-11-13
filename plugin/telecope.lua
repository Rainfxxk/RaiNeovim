require("telescope").setup {
    vimgrep_arguments = {
                "grep",
                "--extended-regexp",
                "--color=never",
                "--with-filename",
                "--line-number",
                "-b", -- grep doesn't support a `--column` option :(
                "--ignore-case",
                "--recursive",
                "--no-messages",
                "--exclude-dir=*cache*",
                "--exclude-dir=*.git",
                "--exclude=.*",
                "--binary-files=without-match"
                -- git grep also works but limits to only git directories,the above works perfectly
                -- "git", "grep", "--full-name", "--line-number", "--column", "--extended-regexp", "--ignore-case",
                -- "--no-color", "--recursive", "--recurse-submodules", "-I"
    },
}
