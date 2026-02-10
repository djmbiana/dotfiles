-- ~/.config/nvim/colors/pripyat.lua
-- Pripyat: warm paper + everforest greens + minimal syntax + golden cursor

local M = {}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

function M.setup()
  vim.o.termguicolors = true
  vim.o.background = "light"
  vim.g.colors_name = "pripyat"

  local c = {
    bg      = "#f4f1e6",
    bg_alt  = "#ede8da",
    base2   = "#e2dccb",
    base3   = "#d6d0bf",
    base5   = "#9d9787",
    base6   = "#6e6a5e",
    fg      = "#3c3a33",

    green1  = "#6f8f5f",
    green2  = "#5f7f4f",
    green3  = "#8f9f7f",
    earth   = "#a68b5b",

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

  -- Cursor (golden)
  hi("Cursor",        { fg = c.cursor_fg, bg = c.cursor })
  hi("lCursor",       { fg = c.cursor_fg, bg = c.cursor })
  hi("CursorIM",      { fg = c.cursor_fg, bg = c.cursor })
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

  -- Messages
  hi("ErrorMsg",      { fg = c.error })
  hi("WarningMsg",    { fg = c.earth })

  -- Links (green)
  hi("Underlined",    { fg = c.green1, underline = true })

  -- Diff (quiet)
  hi("DiffAdd",       { fg = c.green2, bg = c.bg_alt })
  hi("DiffChange",    { fg = c.earth,  bg = c.bg_alt })
  hi("DiffDelete",    { fg = c.error,  bg = c.bg_alt })
  hi("DiffText",      { bg = c.base2 })

  -- === NO SYNTAX HIGHLIGHTING ===
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

  hi("Whitespace",    { fg = c.base2 })
  hi("NonText",       { fg = c.base2 })
end

M.setup()
return M
