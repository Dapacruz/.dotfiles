require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = true,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "italic",    -- Value is any valid attr-list value `:help attr-list`
      conditionals = "NONE",
      constants = "NONE",
      functions = "NONE",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "italic,bold",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {},             -- List of various plugins and additional options
    palettes = {},
    specs = {},
    groups = {},
  }
})

-- setup must be called before loading
vim.cmd("colorscheme nordfox")


--function ColorMyPencils()
  --vim.g.gruvbox_contrast_dark = 'hard'
  --vim.g.tokyonight_transparent_sidebar = true
  --vim.g.tokyonight_transparent = true
  --vim.g.gruvbox_invert_selection = '0'
  --vim.opt.background = "dark"

  --local hl = function(thing, opts)
    --vim.api.nvim_set_hl(0, thing, opts)
  --end

  --hl("SignColumn", {
    --bg = "none",
  --})

  --hl("ColorColumn", {
    --ctermbg = 0,
    --bg = "#555555",
  --})

  --hl("CursorLineNR", {
    --bg = "None"
  --})

  --hl("Normal", {
    --bg = "none"
  --})

  --hl("LineNr", {
    --fg = "#5eacd3"
  --})

  --hl("netrwDir", {
    --fg = "#5eacd3"
  --})

--end

--vim.cmd [[
  --try
    --colorscheme tokyonight
    --lua ColorMyPencils()
  --catch /^Vim\%((\a\+)\)\=:E185/
    --colorscheme default
    --set background=dark
  --endtry
--]]
