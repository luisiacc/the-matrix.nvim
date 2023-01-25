local M = {}

-- local _debug = function(content)
--   local f = io.open("/home/acc/.nvim.debug.log", "a")
--
--   f:write(vim.inspect(content) .. "\n")
--   f.close()
-- end

function M.setup(config)
  config = config or require("thematrix.config")
  local colors = require("thematrix.colors")
  local c = colors.config(config)

  local theme = {}
  theme.defer = {}
  theme.base = {
    NormalFloat = { fg = c.foreground, bg = c.background_dark },
    Normal = { fg = c.foreground, bg = c.background },
    Comment = { fg = c.comment, style = config.comment_style },
    Constant = { fg = c.dark_green },
    String = { fg = c.green0, style = config.string_style },
    Character = { fg = c.green0 },
    Number = { fg = c.green1 },
    Boolean = { fg = c.gray2 },
    Float = { fg = c.green1 },
    Identifier = { fg = c.green0, style = config.variable_style },
    Function = { fg = c.green0 },
    Statement = { fg = c.green1 },
    Conditional = { fg = c.foreground },
    Repeat = { fg = c.green0 },
    Label = { fg = c.gray3 },
    Operator = { fg = c.foreground },
    Keyword = { fg = c.green1, style = config.keyword_style },
    Exception = { fg = c.green0 },
    PreProc = { fg = c.green0 },
    Include = { fg = c.green1 },
    Define = { fg = c.green0 },
    Title = { fg = c.foreground },
    Macro = { fg = c.green0 },
    PreCondit = { fg = c.green0 },
    Type = { fg = c.green0 },
    StorageClass = { fg = c.green0 },
    Structure = { fg = c.green0 },
    Typedef = { fg = c.green0 },
    Special = { fg = c.gray3 },
    SpecialComment = { fg = c.comment },
    MoreMsg = { fg = c.foreground },
    Error = { fg = c.green1, style = "bold" },
    Todo = { fg = c.green0, style = "bold" },
    CursorLineNr = { fg = c.comment, style = "bold" },
    debugPc = { bg = c.error_green1 },
    Conceal = { fg = c.comment },
    Directory = { fg = c.gray3 },

    TabLine = { bg = c.dark, fg = c.comment }, -- tab pages line, not active tab page label
    TabLineFill = { bg = c.background }, -- tab pages line, where there are no labels
    TabLineSel = { fg = c.foreground, bg = c.background_dark }, -- tab pages line, active tab page label

    DiffAdd = { bg = c.diff.add },
    DiffChange = { bg = c.diff.change },
    DiffDelete = { bg = c.diff.delete },
    DiffText = { bg = c.diff.text },

    ErrorMsg = { fg = c.green1 },
    VertSplit = { fg = c.gray1 },
    Folded = { fg = c.comment },
    IncSearch = { bg = c.dark_green },
    LineNr = { fg = c.dark_green },
    MatchParen = { bg = c.green0, style = "underline" },
    NonText = { fg = c.comment },
    Pmenu = { fg = c.foreground, bg = c.gray1 },
    PmenuSel = { fg = c.background, bg = c.green0 },
    Question = { fg = c.green0 },
    QuickFixLine = { fg = c.background, bg = c.green0 },
    Search = { bg = c.dark_green },
    SpecialKey = { fg = c.comment },
    SpellBad = { fg = c.green1, style = "underline" },
    SpellCap = { fg = c.green1 },
    SpellLocal = { fg = c.green1 },
    SpellRare = { fg = c.green1 },
    StatusLine = { fg = c.foreground, bg = c.dark_green },
    StatusLineNC = { fg = c.comment },
    StatusLineTerm = { fg = c.foreground, bg = c.dark_green },
    StatusLineTermNC = { fg = c.dark_green },
    Terminal = { fg = c.foreground, bg = c.background },
    VisualNOS = { fg = c.dark_green },
    WarningMsg = { fg = c.green0 },
    WildMenu = { fg = c.background, bg = c.green0 },
    EndOfBuffer = { fg = c.background },

    -- Tree Sitter
    ["@boolean"] = { fg = c.gray2 },
    ["@define"] = { fg = c.green1 },
    ["@comment"] = { fg = c.comment, style = config.comment_style },
    ["@error"] = { fg = c.green1 },
    ["@punctuation.delimiter"] = { fg = c.foreground },
    ["@punctuation.bracket"] = { fg = c.foreground },
    ["@punctuation.special"] = { fg = c.foreground },
    ["@constant"] = { fg = c.green1, style = "bold" },
    ["@definition.constant"] = { fg = c.green1, style = "bold" },
    ["@constant.builtin"] = { fg = c.green1 },
    ["@string"] = { fg = c.string, style = config.string_style },
    ["@character"] = { fg = c.string },
    ["@number"] = { fg = c.green0 },
    ["@namespace"] = { fg = c.green0 },
    ["@func.builtin"] = { fg = c.green0 },
    ["@function"] = { fg = c.green, style = config.function_style },
    ["@function.call"] = { fg = c.green, style = config.function_style },
    ["@function.builtin"] = { fg = c.green, style = config.function_style },
    ["@func.macro"] = { fg = c.green },
    ["@parameter"] = { fg = c.green0, style = "nocombine" },
    ["@parameter.reference"] = { fg = c.gray3 },
    ["@method"] = { fg = c.green, style = config.function_style },
    ["@field"] = { fg = c.green0 },
    ["@property"] = { fg = c.green0 },
    ["@constructor"] = { fg = c.green0, style = "nocombine" },
    ["@conditional"] = { fg = c.green1 },
    ["@repeat"] = { fg = c.green1 },
    ["@label"] = { fg = c.green0 },
    ["@keyword"] = { fg = c.green1, style = config.keyword_style },
    ["@keyword.return"] = { fg = c.green1, style = config.keyword_style },
    ["@keyword.function"] = { fg = c.green1, style = config.keyword_style },
    ["@keyword.operator"] = { fg = c.green1 },
    ["@operator"] = { fg = c.foreground },
    ["@exception"] = { fg = c.green1 },
    ["@type"] = { fg = c.green05 },
    ["@type.builtin"] = { fg = c.green0 },
    ["@type.qualifier"] = { fg = c.gray2 },
    ["@storageclass.lifetime"] = { fg = c.gray2 },
    ["@structure"] = { fg = c.green0 },
    ["@variable"] = { fg = c.foreground, style = config.variable_style },
    ["@variable.builtin"] = { fg = c.green0 },
    ["@text"] = { fg = c.green0 },
    ["@text.strong"] = { fg = c.green0 },
    ["@text.emphasis"] = { fg = c.green0 },
    ["@text.underline"] = { fg = c.green0 },
    ["@text.title"] = { fg = c.green0 },
    ["@text.literal"] = { fg = c.green0 },
    ["@uri"] = { fg = c.green0 },
    ["@tag"] = { fg = c.green0 },
    ["@tag.delimiter"] = { fg = c.comment },
    ["@tag.attribute"] = { fg = c.green0 },
    --
    -- per language TreeSitter
    ["@attribute.python"] = { fg = c.gray2, style = "bold" },
    ["@decorator"] = { fg = c.gray2, style = "bold" },
    ["@variable.rust"] = { fg = c.foreground, style = "NONE" },
    ["@conditional.javascript"] = { fg = c.green1 },
    ["@variable.javascript"] = { fg = c.green0 },

    -- htmlArg = { fg = c.green0 },
    -- htmlBold = { fg = c.green1, style = "bold" },
    -- htmlEndTag = { fg = c.foreground },
    -- htmlH1 = { fg = c.foreground },
    -- htmlH2 = { fg = c.foreground },
    -- htmlH3 = { fg = c.foreground },
    -- htmlH4 = { fg = c.foreground },
    -- htmlH5 = { fg = c.foreground },
    -- htmlH6 = { fg = c.foreground },
    -- htmlItalic = { fg = c.green0, style = "italic" },
    -- htmlLink = { fg = c.foreground, style = "underline" },
    -- htmlSpecialChar = { fg = c.green0 },
    -- htmlSpecialTagName = { fg = c.green0 },
    -- htmlTag = { fg = c.gray3 },
    -- htmlTagN = { fg = c.gray2 },
    -- htmlTagName = { fg = c.gray2 },
    -- htmlTitle = { fg = c.foreground },
    --
    -- markdownBlockquote = { fg = c.comment },
    -- markdownBold = { fg = c.green1, style = "bold" },
    -- markdownCode = { fg = c.green0 },
    -- markdownCodeBlock = { fg = c.comment },
    -- markdownCodeDelimiter = { fg = c.comment },
    -- markdownH1 = { fg = c.foreground },
    -- markdownH2 = { fg = c.foreground },
    -- markdownH3 = { fg = c.foreground },
    -- markdownH4 = { fg = c.foreground },
    -- markdownH5 = { fg = c.foreground },
    -- markdownH6 = { fg = c.foreground },
    -- markdownHeadingDelimiter = { fg = c.gray2 },
    -- markdownHeadingRule = { fg = c.comment },
    -- markdownId = { fg = c.green0 },
    -- markdownIdDeclaration = { fg = c.green0 },
    -- markdownIdDelimiter = { fg = c.green0 },
    -- markdownItalic = { fg = c.green0, style = "italic" },
    -- markdownLinkDelimiter = { fg = c.green0 },
    -- markdownLinkText = { fg = c.green0 },
    -- markdownListMarker = { fg = c.gray2 },
    -- markdownOrdegreen1ListMarker = { fg = c.gray2 },
    -- markdownRule = { fg = c.comment },
    -- markdownUrl = { fg = c.green0, style = "underline" },
    --
    -- phpInclude = { fg = c.green0 },
    -- phpClass = { fg = c.green0 },
    -- phpClasses = { fg = c.green0 },
    -- phpFunction = { fg = c.green0 },
    -- phpType = { fg = c.green0 },
    -- phpKeyword = { fg = c.green0 },
    -- phpVarSelector = { fg = c.foreground },
    -- phpIdentifier = { fg = c.foreground },
    -- phpMethod = { fg = c.green0 },
    -- phpBoolean = { fg = c.green0 },
    -- phpParent = { fg = c.foreground },
    -- phpOperator = { fg = c.green0 },
    -- phpRegion = { fg = c.green0 },
    -- phpUseNamespaceSeparator = { fg = c.foreground },
    -- phpClassNamespaceSeparator = { fg = c.foreground },
    -- phpDocTags = { fg = c.green0 },
    -- phpDocParam = { fg = c.green0 },
    --
    -- CocExplorerIndentLine = { fg = c.comment },
    -- CocExplorerBufferRoot = { fg = c.gray2 },
    -- CocExplorerFileRoot = { fg = c.gray2 },
    -- CocExplorerBufferFullPath = { fg = c.comment },
    -- CocExplorerFileFullPath = { fg = c.comment },
    -- CocExplorerBufferReadonly = { fg = c.green0 },
    -- CocExplorerBufferModified = { fg = c.green0 },
    -- CocExplorerBufferNameVisible = { fg = c.gray2 },
    -- CocExplorerFileReadonly = { fg = c.green0 },
    -- CocExplorerFileModified = { fg = c.green0 },
    -- CocExplorerFileHidden = { fg = c.comment },
    -- CocExplorerHelpLine = { fg = c.green0 },
    -- CocHighlightText = { bg = c.dark },
    --
    -- EasyMotionTarget = { fg = c.green1, style = "bold" },
    -- EasyMotionTarget2First = { fg = c.green1, style = "bold" },
    -- EasyMotionTarget2Second = { fg = c.green1, style = "bold" },
    --
    -- StartifyNumber = { fg = c.foreground },
    -- StartifySelect = { fg = c.green0 },
    -- StartifyBracket = { fg = c.green0 },
    -- StartifySpecial = { fg = c.gray2 },
    -- StartifyVar = { fg = c.green0 },
    -- StartifyPath = { fg = c.green0 },
    -- StartifyFile = { fg = c.foreground },
    -- StartifySlash = { fg = c.foreground },
    -- StartifyHeader = { fg = c.dark_green },
    -- StartifySection = { fg = c.green0 },
    -- StartifyFooter = { fg = c.green0 },
    --
    -- WhichKey = { fg = c.green0 },
    -- WhichKeySeperator = { fg = c.green0 },
    -- WhichKeyGroup = { fg = c.gray2 },
    -- WhichKeyDesc = { fg = c.green0 },
    --
    -- diffAdded = { fg = c.green0 },
    -- diffRemoved = { fg = c.green1 },
    -- diffFileId = { fg = c.green0 },
    -- diffFile = { fg = c.comment },
    -- diffNewFile = { fg = c.green0 },
    -- diffOldFile = { fg = c.gray2 },

    SignifySignAdd = { fg = c.green0 },
    SignifySignChange = { fg = c.green0 },
    SignifySignDelete = { fg = c.gray2 },
    GitGutterAdd = { fg = c.green0 },
    GitGutterChange = { fg = c.green0 },
    GitGutterDelete = { fg = c.error_green1 },
    debugBreakpoint = { fg = c.error_green1, style = "reverse" },

    VimwikiHeader1 = { fg = c.gray2, style = "bold" },
    VimwikiHeader2 = { fg = c.green0, style = "bold" },
    VimwikiHeader3 = { fg = c.gray3, style = "bold" },
    VimwikiHeader4 = { fg = c.green0, style = "bold" },
    VimwikiHeader5 = { fg = c.green1, style = "bold" },
    VimwikiHeader6 = { fg = c.dark_green, style = "bold" },
    VimwikiLink = { fg = c.green0 },
    VimwikiHeaderChar = { fg = c.dark_green },
    VimwikiHR = { fg = c.green0 },
    VimwikiList = { fg = c.gray2 },
    VimwikiTag = { fg = c.gray2 },
    VimwikiMarkers = { fg = c.dark_green },

    ColorColumn = { bg = c.background_dark },
    SignColumn = { bg = c.background },
    CursorColumn = { bg = c.gray1 },
    CursorLine = { bg = c.highlight },
    FoldColumn = { fg = c.none },
    PmenuSbar = { bg = c.comment },
    PmenuThumb = { bg = c.foreground },
    EasyMotionShade = { fg = c.NONE },
    Visual = { bg = c.dark_green },
    MultiCursor = { bg = c.gray1 },
    Cursor = { bg = c.dark_green, fg = c.NONE },

    -- mix
    GitSignsCurrentLineBlame = { fg = c.dark_green },
    Underlined = { fg = c.error_green1, style = "underline" },
    ["@variable.cpp"] = { fg = c.foreground },

    -- Nvim Tree
    NvimTreeNormal = { fg = c.foreground, bg = c.background_dark },
    NvimTreeNormalNC = { fg = c.foreground, bg = c.background_dark },
    NvimTreeFolderIcon = { fg = c.green0 },
    NvimTreeRootFolder = { fg = c.green0 },
    NvimTreeExecFile = { fg = c.green0, style = "NONE" },

    NvimTreeGitDirty = { fg = c.green1 },
    NvimTreeGitStaged = { fg = c.foreground },
    NvimTreeGitMerge = { fg = c.green0 },
    NvimTreeGitRenamed = { fg = c.green0 },
    NvimTreeGitNew = { fg = c.green0 },
    NvimTreeGitDeleted = { fg = c.green1 },

    -- Hop
    -- HopNextKey = { fg = c.green0, bg = c.dark, style = "bold" },
    -- HopNextKey1 = { fg = c.green0, bg = c.dark, style = "bold" },
    -- HopNextKey2 = { fg = c.milk, bg = c.dark },

    -- indent blankline
    IndentBlanklineChar = { fg = "#414141" },
    IndentBlanklineSpaceChar = { fg = "#414141" },
    IndentBlanklineSpaceCharBlankline = { fg = "#414141" },
    IndentBlanklineContextChar = { fg = "#505050" },

    FloatBorder = { bg = c.background_dark },
    -- Cmp
    CmpDocumentation = { fg = c.foreground, bg = c.bg_float },
    CmpDocumentationBorder = { fg = c.dark_green, bg = c.bg_float },

    CmpItemAbbr = { fg = c.foreground },
    CmpItemAbbrDeprecated = { fg = c.milk, style = "strikethrough" },
    CmpItemAbbrMatch = { fg = c.green0 },
    CmpItemAbbrMatchFuzzy = { fg = c.green0 },

    CmpItemKindDefault = { fg = c.gray3 },
    CmpItemMenu = { fg = c.comment },

    CmpItemKindKeyword = { fg = c.green0 },

    CmpItemKindVariable = { fg = c.green0 },
    CmpItemKindConstant = { fg = c.green0 },
    CmpItemKindReference = { fg = c.green0 },
    CmpItemKindValue = { fg = c.green0 },

    CmpItemKindFunction = { fg = c.gray2 },
    CmpItemKindMethod = { fg = c.gray2 },
    CmpItemKindConstructor = { fg = c.gray2 },

    CmpItemKindClass = { fg = c.dark_green },
    CmpItemKindInterface = { fg = c.dark_green },
    CmpItemKindStruct = { fg = c.dark_green },
    CmpItemKindEvent = { fg = c.dark_green },
    CmpItemKindEnum = { fg = c.dark_green },
    CmpItemKindUnit = { fg = c.dark_green },

    CmpItemKindModule = { fg = c.green0 },

    CmpItemKindProperty = { fg = c.green0 },
    CmpItemKindField = { fg = c.green0 },
    CmpItemKindTypeParameter = { fg = c.green0 },
    CmpItemKindEnumMember = { fg = c.green0 },
    CmpItemKindOperator = { fg = c.green0 },
    CmpItemKindSnippet = { fg = c.gray },

    -- Mutt-Mail:
    -- mailHeader = { fg = c.green1 },
    -- mailHeaderKey = { fg = c.green1 },
    -- mailHeaderEmail = { fg = c.green0 },
    -- mailSubject = { fg = c.green0, style = "italic" },
    --
    -- mailQuoted1 = { fg = c.green0 },
    -- mailQuoted2 = { fg = c.green0 },
    -- mailQuoted3 = { fg = c.green0 },
    -- mailQuoted4 = { fg = c.dark_green },
    -- mailQuoted5 = { fg = c.green0 },
    -- mailQuoted6 = { fg = c.gray2 },
    --
    -- mailQuotedExp1 = { fg = c.milk },
    -- mailQuotedExp2 = { fg = c.green0 },
    -- mailQuotedExp3 = { fg = c.green0 },
    -- mailQuotedExp4 = { fg = c.dark_green },
    -- mailQuotedExp5 = { fg = c.green0 },
    -- mailQuotedExp6 = { fg = c.gray2 },
    --
    -- mailSignature = { fg = c.comment },
    -- mailURL = { fg = c.gray2, style = "underline" },
    -- mailEmail = { fg = c.green0 },

    rainbowcol1 = { fg = c.green0 },
    rainbowcol2 = { fg = c.gray3 },
    rainbowcol3 = { fg = c.green0 },
    rainbowcol4 = { fg = c.green0 },
    rainbowcol5 = { fg = c.green0 },
    rainbowcol6 = { fg = c.gray2 },
    rainbowcol7 = { fg = c.dark_green },

    -- Illuminate:
    -- IlluminatedWordText = { bg = c.gray1 },
    -- IlluminatedWordRead = { bg = c.gray1 },
    -- IlluminatedWordWrite = { bg = c.gray1 },

    -- Dashboard
    -- DashboardHeader = { fg = c.green1 },
    -- DashboardShortCut = { fg = c.green0 },
    -- DashboardCenter = { fg = c.green1 },
    -- DashboardFooter = { fg = c.green0 },
  }

  if config.telescope_theme then
    theme.base = vim.tbl_extend("force", theme.base, {
      -- Telescope
      TelescopeBorder = { fg = c.background_dark, bg = c.background_dark },
      TelescopePromptCounter = { fg = c.milk, bg = c.dark_green },
      TelescopePromptBorder = { fg = c.dark_green, bg = c.medium_gray },
      TelescopePromptNormal = { fg = c.milk, bg = c.dark_green },
      TelescopePromptPrefix = { fg = c.green0, bg = c.dark_green },

      TelescopeNormal = { bg = c.background_dark },

      TelescopePreviewTitle = { fg = c.background, bg = c.green0 },
      TelescopePromptTitle = { fg = c.background, bg = c.green0 },
      TelescopeResultsTitle = { fg = c.background_dark, bg = c.milk },

      TelescopeSelection = { bg = c.diff.change },
    })
  end

  if config.transparent_mode then
    theme.base = vim.tbl_extend("force", theme.base, {
      Visual = { bg = c.dark_green },
      MultiCursor = { bg = c.dark_green },
      Cursor = { bg = c.green0, c.dark },
    })
  end

  theme.base = vim.tbl_extend("force", theme.base, config.highlights or {})
  return theme
end

return M
