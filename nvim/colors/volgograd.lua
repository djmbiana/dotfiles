-- ~/.config/nvim/colors/volgograd.lua
-- Volgograd: gruber-dark-ish + everforest greens + minimal syntax + golden cursor

local M = {}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  vim.o.termguicolors = true
  vim.o.background = "dark"
  vim.g.colors_name = "volgograd"

  local c = {
    bg      = "#181a1b",
    bg_alt  = "#1f2326",
    base2   = "#2a2f33",
    base3   = "#343a40",
    base5   = "#6b737c",
    base6   = "#a5adb6",
    fg      = "#cfd6dd",

    green1  = "#a7c080",
    green2  = "#8faa6a",
    green3  = "#7f9f7f",
    earth   = "#d3b58d",

    cursor  = "#ffdd33",
    cursor_fg = "#000000",
    error   = "#c97f6f",
  }

  -- Core UI
  hi("Normal",        { fg = c.fg, bg = c.bg })
  hi("NormalNC",      { fg = c.fg, bg = c.bg })
  hi("EndOfBuffer",   { fg = c.bg, bg = c.bg })
  hi("SignColumn",    { fg = c.base5, bg = c.bg })
  hi("LineNr",        { fg = c.base5, bg = c.bg })
  hi("CursorLineNr",  { fg = c.fg, bg = c.bg_alt })
  hi("CursorLine",    { bg = c.bg_alt })
  hi("ColorColumn",   { bg = c.bg_alt })
  hi("VertSplit",     { fg = c.base2, bg = c.bg })
  hi("WinSeparator",  { fg = c.base2, bg = c.bg })

  -- Cursor (golden, like Emacs)
  hi("Cursor",        { fg = c.cursor_fg, bg = c.cursor })
  hi("lCursor",       { fg = c.cursor_fg, bg = c.cursor })
  hi("CursorIM",      { fg = c.cursor_fg, bg = c.cursor })
  -- Make sure the terminal cursor matches
  vim.o.guicursor = "n-v-c:block-Cursor,i-ci-ve:block-Cursor,r-cr:block-Cursor,o:block-Cursor"

  -- Selection / search
  hi("Visual",        { bg = c.base3 })
  hi("Search",        { bg = c.base3, fg = c.fg })
  hi("IncSearch",     { bg = c.base3, fg = c.fg })
  hi("CurSearch",     { bg = c.base3, fg = c.fg })
  hi("MatchParen",    { bg = c.base2 })

  -- Statusline / prompts
  hi("StatusLine",    { fg = c.fg, bg = c.bg_alt })
  hi("StatusLineNC",  { fg = c.base6, bg = c.bg_alt })
  hi("ModeMsg",       { fg = c.green2 })
  hi("MoreMsg",       { fg = c.green2 })
  hi("Question",      { fg = c.green2 })
  hi("Title",         { fg = c.fg })

  -- Messages
  hi("ErrorMsg",      { fg = c.error })
  hi("WarningMsg",    { fg = c.earth })

  -- Links (green, no blue)
  hi("Underlined",    { fg = c.green1, underline = true })

  -- Diff (quiet)
  hi("DiffAdd",       { fg = c.green1, bg = c.bg_alt })
  hi("DiffChange",    { fg = c.earth,  bg = c.bg_alt })
  hi("DiffDelete",    { fg = c.error,  bg = c.bg_alt })
  hi("DiffText",      { bg = c.base2 })

  -- === NO SYNTAX HIGHLIGHTING ===
  -- Classic groups
  local mono = { fg = c.fg }
  for _, g in ipairs({
    "Comment","Constant","String","Character","Number","Boolean","Float",
    "Identifier","Function","Statement","Conditional","Repeat","Label",
    "Operator","Keyword","Exception","PreProc","Include","Define","Macro",
    "PreCondit","Type","StorageClass","Structure","Typedef","Special",
    "SpecialChar","Tag","Delimiter","SpecialComment","Debug",
  }) do
    hi(g, mono)
  end

  -- Treesitter groups (Neovim 0.9+)
  for _, g in ipairs({
    "@comment","@punctuation","@punctuation.delimiter","@punctuation.bracket",
    "@constant","@constant.builtin","@string","@string.regex","@string.escape",
    "@number","@boolean","@float","@function","@function.builtin","@method",
    "@keyword","@keyword.function","@keyword.return","@operator",
    "@type","@type.builtin","@variable","@variable.builtin","@field","@property",
    "@constructor","@label","@namespace","@module","@parameter",
    "@tag","@tag.attribute","@tag.delimiter",
  }) do
    hi(g, mono)
  end

  -- Special readability tweaks (still “minimal”)
  hi("Whitespace",    { fg = c.base2 })
  hi("NonText",       { fg = c.base2 })
end

M.setup()
return M
