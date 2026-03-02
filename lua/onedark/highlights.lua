local M = {}

function M.apply(p)
  local groups = {
    -- =======================================================================
    -- Editor/UI
    -- =======================================================================
    Normal       = {fg = p.fg, bg = p.bg0},
    NormalFloat  = {fg = p.fg, bg = p.bg_d},
    FloatBorder  = {fg = p.grey, bg = p.bg_d},
    FloatTitle   = {fg = p.blue, bg = p.bg_d, bold = true},
    Cursor       = {reverse = true},
    CursorLine   = {bg = p.bg1},
    CursorColumn = {bg = p.bg1},
    CursorLineNr = {fg = p.fg, bold = true},
    LineNr       = {fg = p.grey},
    SignColumn   = {fg = p.fg, bg = p.bg0},
    WinSeparator = {fg = p.bg3},
    Visual       = {bg = p.bg3},
    VisualNOS    = {link = 'Visual'},
    Search       = {fg = p.bg0, bg = p.bg_yellow},
    IncSearch    = {fg = p.bg0, bg = p.orange},
    CurSearch    = {link = 'IncSearch'},
    Substitute   = {fg = p.bg0, bg = p.green},
    MatchParen   = {fg = p.orange, bold = true},
    Pmenu        = {fg = p.fg, bg = p.bg1},
    PmenuSel     = {fg = p.bg0, bg = p.blue},
    PmenuSbar    = {bg = p.bg2},
    PmenuThumb   = {bg = p.grey},
    StatusLine   = {fg = p.fg, bg = p.bg1},
    StatusLineNC = {fg = p.grey, bg = p.bg1},
    TabLine      = {fg = p.grey, bg = p.bg1},
    TabLineFill  = {fg = p.grey, bg = p.bg_d},
    TabLineSel   = {fg = p.fg, bg = p.bg0},
    WinBar       = {link = 'StatusLine'},
    WinBarNC     = {link = 'StatusLineNC'},
    WildMenu     = {link = 'PmenuSel'},
    Folded       = {fg = p.grey, bg = p.bg1},
    FoldColumn   = {fg = p.grey},
    DiffAdd      = {bg = p.diff_add},
    DiffChange   = {bg = p.diff_change},
    DiffDelete   = {bg = p.diff_delete},
    DiffText     = {bg = p.diff_text},
    SpellBad     = {sp = p.red, undercurl = true},
    SpellCap     = {sp = p.yellow, undercurl = true},
    SpellLocal   = {sp = p.blue, undercurl = true},
    SpellRare    = {sp = p.purple, undercurl = true},
    NonText      = {fg = p.bg3},
    SpecialKey   = {fg = p.bg3},
    Title        = {fg = p.orange, bold = true},
    Directory    = {fg = p.blue},
    ErrorMsg     = {fg = p.red, bold = true},
    WarningMsg   = {fg = p.yellow, bold = true},
    MoreMsg      = {fg = p.cyan, bold = true},
    ModeMsg      = {fg = p.fg, bold = true},
    Question     = {fg = p.green},
    Todo         = {fg = p.blue, bold = true},
    ColorColumn  = {bg = p.bg1},
    Conceal      = {fg = p.grey},
    EndOfBuffer  = {fg = p.bg0},

    -- =======================================================================
    -- Syntax
    -- =======================================================================
    Comment        = {fg = p.grey, italic = true},
    Constant       = {fg = p.orange},
    String         = {fg = p.green},
    Character      = {fg = p.orange},
    Number         = {fg = p.orange},
    Boolean        = {fg = p.orange},
    Float          = {fg = p.orange},
    Identifier     = {fg = p.red},
    Function       = {fg = p.blue},
    Statement      = {fg = p.purple},
    Conditional    = {fg = p.purple},
    Repeat         = {fg = p.purple},
    Label          = {fg = p.red},
    Operator       = {fg = p.cyan},
    Keyword        = {fg = p.purple},
    Exception      = {fg = p.purple},
    PreProc        = {fg = p.purple},
    Include        = {fg = p.purple},
    Define         = {fg = p.purple},
    Macro          = {fg = p.purple},
    PreCondit      = {fg = p.purple},
    Type           = {fg = p.yellow},
    StorageClass   = {fg = p.yellow},
    Structure      = {fg = p.yellow},
    Typedef        = {fg = p.yellow},
    Special        = {fg = p.cyan},
    SpecialChar    = {fg = p.cyan},
    Tag            = {fg = p.red},
    Delimiter      = {fg = p.fg},
    SpecialComment = {fg = p.grey, italic = true},
    Debug          = {fg = p.orange},
    Underlined     = {underline = true},
    Ignore         = {fg = p.grey},
    Error          = {fg = p.red},
    Added          = {fg = p.green},
    Changed        = {fg = p.blue},
    Removed        = {fg = p.red},

    -- =======================================================================
    -- Treesitter
    -- =======================================================================

    -- Variables
    ['@variable']              = {fg = p.fg},
    ['@variable.builtin']      = {fg = p.red},
    ['@variable.parameter']    = {fg = p.red},
    ['@variable.member']       = {fg = p.red},

    -- Constants
    ['@constant']              = {link = 'Constant'},
    ['@constant.builtin']      = {fg = p.orange},
    ['@constant.macro']        = {fg = p.orange},

    -- Modules
    ['@module']                = {fg = p.yellow},
    ['@module.builtin']        = {fg = p.yellow},

    -- Labels
    ['@label']                 = {link = 'Label'},

    -- Strings
    ['@string']                = {link = 'String'},
    ['@string.documentation']  = {fg = p.grey, italic = true},
    ['@string.regexp']         = {fg = p.cyan},
    ['@string.escape']         = {fg = p.cyan},
    ['@string.special']        = {fg = p.cyan},
    ['@string.special.symbol'] = {fg = p.cyan},
    ['@string.special.url']    = {fg = p.blue, underline = true},
    ['@string.special.path']   = {fg = p.cyan},

    -- Characters, booleans, numbers
    ['@character']             = {link = 'Character'},
    ['@character.special']     = {link = 'SpecialChar'},
    ['@boolean']               = {link = 'Boolean'},
    ['@number']                = {link = 'Number'},
    ['@number.float']          = {link = 'Float'},

    -- Types
    ['@type']                  = {link = 'Type'},
    ['@type.builtin']          = {fg = p.yellow},
    ['@type.definition']       = {fg = p.yellow},
    ['@attribute']             = {fg = p.yellow},
    ['@attribute.builtin']     = {fg = p.yellow},
    ['@property']              = {fg = p.red},

    -- Functions
    ['@function']              = {link = 'Function'},
    ['@function.builtin']      = {fg = p.blue},
    ['@function.call']         = {fg = p.blue},
    ['@function.macro']        = {fg = p.blue},
    ['@function.method']       = {fg = p.blue},
    ['@function.method.call']  = {fg = p.blue},
    ['@constructor']           = {fg = p.yellow},

    -- Operators
    ['@operator']              = {link = 'Operator'},

    -- Keywords
    ['@keyword']               = {link = 'Keyword'},
    ['@keyword.coroutine']     = {fg = p.purple},
    ['@keyword.function']      = {fg = p.purple},
    ['@keyword.operator']      = {fg = p.cyan},
    ['@keyword.import']        = {fg = p.purple},
    ['@keyword.type']          = {fg = p.purple},
    ['@keyword.modifier']      = {fg = p.purple},
    ['@keyword.repeat']        = {link = 'Repeat'},
    ['@keyword.return']        = {fg = p.purple},
    ['@keyword.debug']         = {link = 'Debug'},
    ['@keyword.exception']     = {link = 'Exception'},
    ['@keyword.conditional']   = {link = 'Conditional'},
    ['@keyword.directive']     = {fg = p.purple},

    -- Punctuation
    ['@punctuation.delimiter'] = {fg = p.fg},
    ['@punctuation.bracket']   = {fg = p.fg},
    ['@punctuation.special']   = {fg = p.cyan},

    -- Comments
    ['@comment']               = {link = 'Comment'},
    ['@comment.documentation'] = {link = 'Comment'},
    ['@comment.error']         = {fg = p.red},
    ['@comment.warning']       = {fg = p.yellow},
    ['@comment.todo']          = {fg = p.blue, bold = true},
    ['@comment.note']          = {fg = p.cyan},

    -- Markup
    ['@markup.strong']         = {bold = true},
    ['@markup.italic']         = {italic = true},
    ['@markup.strikethrough']  = {strikethrough = true},
    ['@markup.underline']      = {underline = true},
    ['@markup.heading']        = {fg = p.orange, bold = true},
    ['@markup.heading.1']      = {fg = p.red, bold = true},
    ['@markup.heading.2']      = {fg = p.orange, bold = true},
    ['@markup.heading.3']      = {fg = p.yellow, bold = true},
    ['@markup.heading.4']      = {fg = p.green, bold = true},
    ['@markup.heading.5']      = {fg = p.blue, bold = true},
    ['@markup.heading.6']      = {fg = p.purple, bold = true},
    ['@markup.quote']          = {fg = p.grey, italic = true},
    ['@markup.math']           = {fg = p.cyan},
    ['@markup.link']           = {fg = p.blue},
    ['@markup.link.label']     = {fg = p.blue},
    ['@markup.link.url']       = {fg = p.cyan, underline = true},
    ['@markup.raw']            = {fg = p.green},
    ['@markup.raw.block']      = {fg = p.green},
    ['@markup.list']           = {fg = p.red},
    ['@markup.list.checked']   = {fg = p.green},
    ['@markup.list.unchecked'] = {fg = p.grey},

    -- Tags (HTML/JSX)
    ['@tag']                   = {fg = p.red},
    ['@tag.builtin']           = {fg = p.red},
    ['@tag.attribute']         = {fg = p.orange},
    ['@tag.delimiter']         = {fg = p.grey},

    -- Diff
    ['@diff.plus']             = {link = 'Added'},
    ['@diff.minus']            = {link = 'Removed'},
    ['@diff.delta']            = {link = 'Changed'},

    -- =======================================================================
    -- Diagnostics
    -- =======================================================================
    DiagnosticError            = {fg = p.red},
    DiagnosticWarn             = {fg = p.yellow},
    DiagnosticInfo             = {fg = p.blue},
    DiagnosticHint             = {fg = p.cyan},
    DiagnosticOk               = {fg = p.green},
    DiagnosticVirtualTextError = {fg = p.dark_red},
    DiagnosticVirtualTextWarn  = {fg = p.dark_yellow},
    DiagnosticVirtualTextInfo  = {fg = p.blue},
    DiagnosticVirtualTextHint  = {fg = p.dark_cyan},
    DiagnosticUnderlineError   = {sp = p.red, undercurl = true},
    DiagnosticUnderlineWarn    = {sp = p.yellow, undercurl = true},
    DiagnosticUnderlineInfo    = {sp = p.blue, undercurl = true},
    DiagnosticUnderlineHint    = {sp = p.cyan, undercurl = true},
    DiagnosticSignError        = {fg = p.red},
    DiagnosticSignWarn         = {fg = p.yellow},
    DiagnosticSignInfo         = {fg = p.blue},
    DiagnosticSignHint         = {fg = p.cyan},
    DiagnosticFloatingError    = {link = 'DiagnosticError'},
    DiagnosticFloatingWarn     = {link = 'DiagnosticWarn'},
    DiagnosticFloatingInfo     = {link = 'DiagnosticInfo'},
    DiagnosticFloatingHint     = {link = 'DiagnosticHint'},
    DiagnosticDeprecated       = {strikethrough = true},

    -- =======================================================================
    -- LSP
    -- =======================================================================
    LspReferenceText            = {bg = p.bg2},
    LspReferenceRead            = {bg = p.bg2},
    LspReferenceWrite           = {bg = p.bg2},
    LspSignatureActiveParameter = {fg = p.orange, bold = true},
    LspInlayHint                = {fg = p.grey, italic = true},
    LspCodeLens                 = {fg = p.grey},
    LspCodeLensSeparator        = {fg = p.grey},

    -- LSP semantic tokens
    ['@lsp.type.comment']                    = {link = 'Comment'},
    ['@lsp.type.enum']                       = {link = 'Type'},
    ['@lsp.type.enumMember']                 = {link = 'Constant'},
    ['@lsp.type.interface']                  = {fg = p.yellow},
    ['@lsp.type.keyword']                    = {link = 'Keyword'},
    ['@lsp.type.namespace']                  = {link = '@module'},
    ['@lsp.type.parameter']                  = {link = '@variable.parameter'},
    ['@lsp.type.property']                   = {link = '@property'},
    ['@lsp.type.variable']                   = {link = '@variable'},
    ['@lsp.type.function']                   = {link = 'Function'},
    ['@lsp.type.method']                     = {link = 'Function'},
    ['@lsp.type.macro']                      = {link = 'Macro'},
    ['@lsp.type.type']                       = {link = 'Type'},
    ['@lsp.type.class']                      = {link = 'Type'},
    ['@lsp.type.struct']                     = {link = 'Type'},
    ['@lsp.type.decorator']                  = {fg = p.yellow},
    ['@lsp.typemod.variable.readonly']       = {link = 'Constant'},
    ['@lsp.typemod.function.defaultLibrary'] = {link = '@function.builtin'},
    ['@lsp.typemod.variable.defaultLibrary'] = {link = '@variable.builtin'},
    ['@lsp.typemod.type.defaultLibrary']     = {link = '@type.builtin'},
    ['@lsp.typemod.variable.deprecated']     = {link = 'DiagnosticDeprecated'},
    ['@lsp.typemod.function.deprecated']     = {link = 'DiagnosticDeprecated'},

    -- =======================================================================
    -- mini.statusline
    -- =======================================================================
    MiniStatuslineModeNormal  = {fg = p.bg0, bg = p.blue, bold = true},
    MiniStatuslineModeInsert  = {fg = p.bg0, bg = p.green, bold = true},
    MiniStatuslineModeVisual  = {fg = p.bg0, bg = p.purple, bold = true},
    MiniStatuslineModeReplace = {fg = p.bg0, bg = p.red, bold = true},
    MiniStatuslineModeCommand = {fg = p.bg0, bg = p.yellow, bold = true},
    MiniStatuslineModeOther   = {fg = p.bg0, bg = p.cyan, bold = true},
    MiniStatuslineDevinfo     = {fg = p.fg, bg = p.bg2},
    MiniStatuslineFilename    = {fg = p.grey, bg = p.bg1},
    MiniStatuslineFileinfo    = {fg = p.fg, bg = p.bg2},
    MiniStatuslineInactive    = {fg = p.grey, bg = p.bg1},

    -- =======================================================================
    -- mini.tabline
    -- =======================================================================
    MiniTablineCurrent         = {fg = p.fg, bg = p.bg0, bold = true},
    MiniTablineVisible         = {fg = p.light_grey, bg = p.bg1},
    MiniTablineHidden          = {fg = p.grey, bg = p.bg_d},
    MiniTablineModifiedCurrent = {fg = p.blue, bg = p.bg0, bold = true},
    MiniTablineModifiedVisible = {fg = p.blue, bg = p.bg1},
    MiniTablineModifiedHidden  = {fg = p.blue, bg = p.bg_d},
    MiniTablineFill            = {bg = p.bg_d},
    MiniTablineTabpagesection  = {fg = p.bg0, bg = p.blue, bold = true},

    -- =======================================================================
    -- mini.cursorword
    -- =======================================================================
    MiniCursorword        = {underline = true},
    MiniCursorwordCurrent = {underline = true},

    -- =======================================================================
    -- mini.indentscope
    -- =======================================================================
    MiniIndentscopeSymbol = {fg = p.blue},

    -- =======================================================================
    -- mini.surround
    -- =======================================================================
    MiniSurround = {fg = p.bg0, bg = p.orange},

    -- =======================================================================
    -- mini.notify
    -- =======================================================================
    MiniNotifyBorder = {link = 'FloatBorder'},
    MiniNotifyNormal = {link = 'NormalFloat'},
    MiniNotifyTitle  = {fg = p.blue, bold = true},

    -- =======================================================================
    -- mini.trailspace
    -- =======================================================================
    MiniTrailspace = {bg = p.red},

    -- =======================================================================
    -- mini.hipatterns
    -- =======================================================================
    MiniHipatternsFixme = {fg = p.bg0, bg = p.red, bold = true},
    MiniHipatternsHack  = {fg = p.bg0, bg = p.yellow, bold = true},
    MiniHipatternsTodo  = {fg = p.bg0, bg = p.blue, bold = true},
    MiniHipatternsNote  = {fg = p.bg0, bg = p.cyan, bold = true},

    -- =======================================================================
    -- mini.starter
    -- =======================================================================
    MiniStarterCurrent    = {underline = true},
    MiniStarterFooter     = {fg = p.grey, italic = true},
    MiniStarterHeader     = {fg = p.blue},
    MiniStarterInactive   = {fg = p.grey},
    MiniStarterItem       = {fg = p.fg},
    MiniStarterItemBullet = {fg = p.blue},
    MiniStarterItemPrefix = {fg = p.yellow},
    MiniStarterSection    = {fg = p.purple, bold = true},
    MiniStarterQuery      = {fg = p.green, bold = true},

    -- =======================================================================
    -- mini.pick
    -- =======================================================================
    MiniPickBorder        = {link = 'FloatBorder'},
    MiniPickBorderBusy    = {fg = p.yellow, bg = p.bg_d},
    MiniPickBorderText    = {fg = p.blue, bg = p.bg_d},
    MiniPickCursor        = {blend = 100},
    MiniPickHeader        = {fg = p.yellow, bold = true},
    MiniPickMatchCurrent  = {bg = p.bg2},
    MiniPickMatchMarked   = {fg = p.blue, bold = true},
    MiniPickMatchRanges   = {fg = p.green, bold = true},
    MiniPickNormal        = {link = 'NormalFloat'},
    MiniPickPreviewLine   = {bg = p.bg2},
    MiniPickPreviewRegion = {link = 'Visual'},
    MiniPickPrompt        = {fg = p.blue, bg = p.bg_d},

    -- =======================================================================
    -- mini.files
    -- =======================================================================
    MiniFilesBorder         = {link = 'FloatBorder'},
    MiniFilesBorderModified = {fg = p.yellow, bg = p.bg_d},
    MiniFilesCursorLine     = {bg = p.bg2},
    MiniFilesDirectory      = {link = 'Directory'},
    MiniFilesFile           = {fg = p.fg},
    MiniFilesNormal         = {link = 'NormalFloat'},
    MiniFilesTitle          = {fg = p.blue, bg = p.bg_d, bold = true},
    MiniFilesTitleFocused   = {fg = p.orange, bg = p.bg_d, bold = true},

    -- =======================================================================
    -- mini.clue
    -- =======================================================================
    MiniClueBorder              = {link = 'FloatBorder'},
    MiniClueDescGroup           = {fg = p.purple},
    MiniClueDescSingle          = {fg = p.fg},
    MiniClueNextKey             = {fg = p.blue, bold = true},
    MiniClueNextKeyWithPostkeys = {fg = p.yellow, bold = true},
    MiniClueSeparator           = {fg = p.grey},
    MiniClueTitle               = {fg = p.blue, bold = true},

    -- =======================================================================
    -- mini.diff
    -- =======================================================================
    MiniDiffSignAdd      = {fg = p.green},
    MiniDiffSignChange   = {fg = p.blue},
    MiniDiffSignDelete   = {fg = p.red},
    MiniDiffOverAdd      = {link = 'DiffAdd'},
    MiniDiffOverChange   = {link = 'DiffText'},
    MiniDiffOverChangeBuf = {link = 'DiffChange'},
    MiniDiffOverContext  = {link = 'DiffChange'},
    MiniDiffOverContextBuf = {},
    MiniDiffOverDelete   = {link = 'DiffDelete'},

    -- =======================================================================
    -- mini.completion
    -- =======================================================================
    MiniCompletionActiveParameter = {underline = true},

    -- =======================================================================
    -- mini.jump
    -- =======================================================================
    MiniJump = {fg = p.bg0, bg = p.orange},

    -- =======================================================================
    -- mini.operators
    -- =======================================================================
    MiniOperatorsExchangeFrom = {bg = p.bg3},

    -- =======================================================================
    -- mini.animate
    -- =======================================================================
    MiniAnimateCursor = {reverse = true},

    -- =======================================================================
    -- mini.map
    -- =======================================================================
    MiniMapNormal      = {link = 'NormalFloat'},
    MiniMapSymbolCount = {fg = p.purple},
    MiniMapSymbolLine  = {fg = p.blue},
    MiniMapSymbolView  = {fg = p.grey},

    -- =======================================================================
    -- mini.deps
    -- =======================================================================
    MiniDepsChangeAdded   = {fg = p.green},
    MiniDepsChangeRemoved = {fg = p.red},
    MiniDepsHint          = {link = 'DiagnosticHint'},
    MiniDepsInfo          = {link = 'DiagnosticInfo'},
    MiniDepsMsgBreaking   = {fg = p.red, bold = true},
    MiniDepsPlaceholder   = {fg = p.grey},
    MiniDepsTitle         = {fg = p.blue, bold = true},
    MiniDepsTitleError    = {fg = p.bg0, bg = p.red, bold = true},
    MiniDepsTitleSame     = {fg = p.grey},
    MiniDepsTitleUpdate   = {fg = p.bg0, bg = p.green, bold = true},
  }

  for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

return M
