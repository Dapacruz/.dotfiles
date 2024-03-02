return {
    "epwalsh/obsidian.nvim",
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
                name = "WSI",
                path = "~/Obsidian/WSI",
            },
            {
                name = "Personal",
                path = "~/Obsidian/Personal",
            },
        },
        disable_frontmatter = true,
    }
}
