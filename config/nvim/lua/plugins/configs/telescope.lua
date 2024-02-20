local ok, telescope = pcall(require, "telescope")

if not ok then
    return
end

telescope.setup {
    picker = {
        hidden = false,
    },
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--no-ignore",
            "--smart-case",
            "--hidden",
            "--glob=!.git/",
            "--glob=!bazel-bin/",
            "--glob=!bazel-instant-android/",
            "--glob=!bazel-out/",
            "--glob=!bazel-testlogs/",
        },
        pickers = {
            find_files = {
                find_command = { 
                    "fd", 
                    "--type=file",
                    "--hidden",
                    "--exclude=.git",
                    "--exclude=bazel-bin",
                    "--exclude=bazel-instant-android",
                    "--exclude=bazel-out",
                    "--exclude=testlogs",
                }
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        },
    }
}

telescope.load_extension "fzf"
