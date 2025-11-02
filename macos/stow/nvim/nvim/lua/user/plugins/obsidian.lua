return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = false,
    ft = "markdown",
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },
    opts = {
        workspaces = {
            {
                name = "Personal",
                path = "~/Obsidian/Personal",
            },
        },
        legacy_commands = false,
        frontmatter = {
            enabled = false,
        }
    }
}
