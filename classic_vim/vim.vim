" =============================================================================
" Name:         Solar Sooty
" Description:  Dark theme ported from the Solar Sooty TMTheme (gerane/VSCodeThemes)
" Maintainer:   Rafael Borges Dias Baptista (Borjao)
" License:      MIT
" Compatible:   Vim 7+ (gui + 256-color terminal via cterm approximations)
" =============================================================================
" Key palette from TMTheme:
"   bg              #111111   (original uses #111, rendered as ~#111111)
"   fg              #F8F8F2
"   caret           #F8F8F0
"   invisibles      #3B3A32
"   lineHighlight   #2D2D2D
"   selection       #2B2B2B
"   selectionBorder #555555
"   findHighlight   #FFE792   fg #000000
"   comment         #999999
"   string          #F3E87E
"   number/const    #AE81FF   (also: bracketsForeground)
"   variable        #678CB1
"   keyword/storage #EC7600
"   storage.type    #66D9EF   italic
"   class/func/attr #A6E22E
"   func.param      #FD971F   italic
"   tag.name        #FE890C
"   lib.func/type   #66D9EF
"   lib.const       #FFFFFF
"   json.str.value  #CFCFC2
"   embedded.bg     #131313
"   diff.del        #FF4A52
"   diff.ins        #A6E22E
"   diff.chg        #E6DB74
" =============================================================================

highlight clear
if exists('syntax_on')
    syntax reset
endif
let g:colors_name = 'solar_sooty'

" ── Helper ───────────────────────────────────────────────────────────────────
" s:hi(group, fg_hex, bg_hex, gui_attr, cterm_attr)
" Pass '' to leave a field at its default.
function! s:hi(group, fg, bg, gui, cterm) abort
    let l:cmd = 'highlight ' . a:group
    if a:fg  != '' | let l:cmd .= ' guifg='  . a:fg  . ' ctermfg=' . s:c(a:fg)  | endif
    if a:bg  != '' | let l:cmd .= ' guibg='  . a:bg  . ' ctermbg=' . s:c(a:bg)  | endif
    if a:gui != '' | let l:cmd .= ' gui='    . a:gui                              | endif
    if a:cterm != '' | let l:cmd .= ' cterm=' . a:cterm                           | endif
    execute l:cmd
endfunction

" ── xterm-256 approximation table ────────────────────────────────────────────
function! s:c(hex) abort
    let l:map = {
        \ '#111111': 233,
        \ '#F8F8F2': 253,
        \ '#F8F8F0': 230,
        \ '#3B3A32': 237,
        \ '#2D2D2D': 236,
        \ '#2B2B2B': 235,
        \ '#555555': 240,
        \ '#FFE792': 221,
        \ '#000000': 16,
        \ '#999999': 246,
        \ '#F3E87E': 227,
        \ '#AE81FF': 141,
        \ '#678CB1': 67,
        \ '#EC7600': 208,
        \ '#66D9EF': 81,
        \ '#A6E22E': 148,
        \ '#FD971F': 208,
        \ '#FE890C': 208,
        \ '#FFFFFF': 231,
        \ '#CFCFC2': 251,
        \ '#FF4A52': 203,
        \ '#E6DB74': 185,
        \ '#FFFFAA': 229,
        \ '#FF0000': 196,
        \ '#FFEF85': 229,
        \ '#D30000': 160,
        \ '#131313': 233,
        \ }
    return get(l:map, toupper(a:hex), 'NONE')
endfunction

" ════════════════════════════════════════════════════════════════
" 1. BASE UI
" ════════════════════════════════════════════════════════════════

call s:hi('Normal',        '#F8F8F2', '#111111', 'NONE', 'NONE')
call s:hi('NormalNC',      '#F8F8F2', '#111111', 'NONE', 'NONE')
call s:hi('Cursor',        '#111111', '#F8F8F0', 'NONE', 'NONE')
call s:hi('CursorLine',    '',        '#2D2D2D', 'NONE', 'NONE')
call s:hi('CursorColumn',  '',        '#2D2D2D', 'NONE', 'NONE')
call s:hi('ColorColumn',   '',        '#2D2D2D', 'NONE', 'NONE')
call s:hi('Visual',        '',        '#2B2B2B', 'NONE', 'NONE')
call s:hi('VisualNOS',     '',        '#2B2B2B', 'NONE', 'NONE')

" Invisibles / whitespace
call s:hi('NonText',       '#3B3A32', '',        'NONE', 'NONE')
call s:hi('SpecialKey',    '#3B3A32', '',        'NONE', 'NONE')
call s:hi('Whitespace',    '#3B3A32', '',        'NONE', 'NONE')
call s:hi('EndOfBuffer',   '#3B3A32', '',        'NONE', 'NONE')

" Search — findHighlight
call s:hi('Search',        '#000000', '#FFE792', 'NONE',  'NONE')
call s:hi('IncSearch',     '#000000', '#FFE792', 'bold',  'bold')
call s:hi('CurSearch',     '#000000', '#FFE792', 'bold',  'bold')
call s:hi('Substitute',    '#000000', '#FFE792', 'NONE',  'NONE')

" Gutter / numbers
call s:hi('LineNr',        '#555555', '',        'NONE',  'NONE')
call s:hi('LineNrAbove',   '#555555', '',        'NONE',  'NONE')
call s:hi('LineNrBelow',   '#555555', '',        'NONE',  'NONE')
call s:hi('CursorLineNr',  '#F8F8F2', '#2D2D2D', 'bold',  'bold')
call s:hi('SignColumn',    '#555555', '#111111', 'NONE',  'NONE')
call s:hi('FoldColumn',    '#555555', '#111111', 'NONE',  'NONE')
call s:hi('Folded',        '#999999', '#2D2D2D', 'NONE',  'NONE')

" Status / tab bar
call s:hi('StatusLine',    '#F8F8F2', '#2D2D2D', 'NONE',  'NONE')
call s:hi('StatusLineNC',  '#999999', '#2D2D2D', 'NONE',  'NONE')
call s:hi('TabLine',       '#999999', '#2D2D2D', 'NONE',  'NONE')
call s:hi('TabLineSel',    '#F8F8F2', '#111111', 'bold',  'bold')
call s:hi('TabLineFill',   '',        '#111111', 'NONE',  'NONE')

" Wild / popup
call s:hi('WildMenu',      '#000000', '#FFE792', 'bold',  'bold')
call s:hi('Pmenu',         '#F8F8F2', '#2D2D2D', 'NONE',  'NONE')
call s:hi('PmenuSel',      '#000000', '#FFE792', 'bold',  'bold')
call s:hi('PmenuSbar',     '',        '#3B3A32', 'NONE',  'NONE')
call s:hi('PmenuThumb',    '',        '#555555', 'NONE',  'NONE')

" Splits
call s:hi('VertSplit',     '#2D2D2D', '#111111', 'NONE',  'NONE')
call s:hi('WinSeparator',  '#2D2D2D', '#111111', 'NONE',  'NONE')

" Messages
call s:hi('ModeMsg',       '#A6E22E', '',        'bold',  'bold')
call s:hi('MoreMsg',       '#A6E22E', '',        'bold',  'bold')
call s:hi('Question',      '#A6E22E', '',        'bold',  'bold')
call s:hi('Title',         '#A6E22E', '',        'bold',  'bold')
call s:hi('WarningMsg',    '#EC7600', '',        'bold',  'bold')
call s:hi('ErrorMsg',      '#F8F8F0', '#FF4A52', 'bold',  'bold')

" Matching brackets — bracketsForeground=#AE81FF bracketsOptions=underline
call s:hi('MatchParen',    '#AE81FF', '',        'underline', 'underline')

" Misc UI
call s:hi('Conceal',       '#999999', '',        'NONE',  'NONE')
call s:hi('Directory',     '#66D9EF', '',        'NONE',  'NONE')
call s:hi('QuickFixLine',  '',        '#2B2B2B', 'NONE',  'NONE')

" Diff
call s:hi('DiffAdd',       '#A6E22E', '#131313', 'NONE',  'NONE')
call s:hi('DiffDelete',    '#FF4A52', '#131313', 'NONE',  'NONE')
call s:hi('DiffChange',    '#E6DB74', '#131313', 'NONE',  'NONE')
call s:hi('DiffText',      '#E6DB74', '#2B2B2B', 'bold',  'bold')

" Spelling
call s:hi('SpellBad',      '#FF4A52', '',        'undercurl', 'underline')
call s:hi('SpellCap',      '#66D9EF', '',        'undercurl', 'underline')
call s:hi('SpellLocal',    '#A6E22E', '',        'undercurl', 'underline')
call s:hi('SpellRare',     '#AE81FF', '',        'undercurl', 'underline')

" ════════════════════════════════════════════════════════════════
" 2. CORE SYNTAX GROUPS
" ════════════════════════════════════════════════════════════════

" comment → #999999
call s:hi('Comment',       '#999999', '', 'NONE',           'NONE')

" string → #F3E87E
call s:hi('String',        '#F3E87E', '', 'NONE',           'NONE')
call s:hi('Character',     '#F3E87E', '', 'NONE',           'NONE')

" constant.numeric → #AE81FF
call s:hi('Number',        '#AE81FF', '', 'NONE',           'NONE')
call s:hi('Float',         '#AE81FF', '', 'NONE',           'NONE')
call s:hi('Boolean',       '#AE81FF', '', 'NONE',           'NONE')
call s:hi('Constant',      '#AE81FF', '', 'NONE',           'NONE')

" variable → #678CB1
call s:hi('Identifier',    '#678CB1', '', 'NONE',           'NONE')

" keyword / storage → #EC7600
call s:hi('Keyword',       '#EC7600', '', 'NONE',           'NONE')
call s:hi('Statement',     '#EC7600', '', 'NONE',           'NONE')
call s:hi('Conditional',   '#EC7600', '', 'NONE',           'NONE')
call s:hi('Repeat',        '#EC7600', '', 'NONE',           'NONE')
call s:hi('Label',         '#EC7600', '', 'NONE',           'NONE')
call s:hi('Exception',     '#EC7600', '', 'NONE',           'NONE')

" keyword.operator → #EC7600 (operators: +,-,*,/,=,<,>, etc.)
call s:hi('Operator',      '#EC7600', '', 'NONE',           'NONE')

" storage.type → #66D9EF italic  (class/struct/interface/enum keywords, type names)
call s:hi('Type',          '#66D9EF', '', 'italic',         'italic')
call s:hi('Typedef',       '#66D9EF', '', 'italic',         'italic')
call s:hi('Structure',     '#66D9EF', '', 'italic',         'italic')

" storage (no .type) → #EC7600 orange  (public/private/static/readonly/const/abstract)
call s:hi('StorageClass',  '#EC7600', '', 'NONE',           'NONE')

" entity.name.class → #A6E22E underline
" entity.name.function → #A6E22E
call s:hi('Function',      '#A6E22E', '', 'NONE',           'NONE')

" PreProc family — #A6E22E / #EC7600 for include
call s:hi('PreProc',       '#A6E22E', '', 'NONE',           'NONE')
call s:hi('Include',       '#EC7600', '', 'NONE',           'NONE')
call s:hi('Define',        '#A6E22E', '', 'NONE',           'NONE')
call s:hi('Macro',         '#A6E22E', '', 'NONE',           'NONE')
call s:hi('PreCondit',     '#A6E22E', '', 'NONE',           'NONE')

" variable.parameter → #FD971F italic
call s:hi('SpecialChar',   '#FD971F', '', 'italic',         'italic')

" entity.name.tag → #FE890C
call s:hi('Tag',           '#FE890C', '', 'NONE',           'NONE')

" support.function / support.type / support.class → #66D9EF
call s:hi('Special',       '#66D9EF', '', 'NONE',           'NONE')

" support.constant → #FFFFFF
call s:hi('SpecialComment','#FFFFFF', '', 'NONE',           'NONE')

" CRITICAL — Punctuation / Delimiters:
"   bracketsForeground = #AE81FF (underline) → parens, brackets, braces
"   bracketContentsForeground = #F8F8F2 semi-transparent → content inside
"   JSON string values = #CFCFC2 (meta.structure.dictionary.json)
"   General delimiters (commas, semicolons, colons) inherit fg (#F8F8F2)
call s:hi('Delimiter',     '#AE81FF', '', 'NONE',           'NONE')

" invalid → bg #EC7600 fg #F8F8F0
call s:hi('Error',         '#F8F8F0', '#EC7600', 'NONE',    'NONE')

" invalid.deprecated → bg #AE81FF fg #F8F8F0
call s:hi('Underlined',    '#F8F8F0', '#AE81FF', 'underline','underline')

" Todo (comments with TODO/FIXME/etc.)
call s:hi('Todo',          '#000000', '#FFE792', 'bold',    'bold')

" ════════════════════════════════════════════════════════════════
" 3. TREESITTER CAPTURES (NeoVim & Vim 9 with nvim-treesitter)
" ════════════════════════════════════════════════════════════════

" — Comments
highlight! link @comment                    Comment
highlight! link @comment.documentation      Comment
highlight! link @comment.error              DiagnosticError
highlight! link @comment.warning            DiagnosticWarn
highlight! link @comment.todo               Todo
highlight! link @comment.note               SpecialComment

" — Literals
highlight! link @string                     String
highlight! link @string.regex               String
highlight! link @string.regexp              String
highlight! link @string.escape              SpecialChar
highlight! link @string.special             SpecialChar
highlight! link @string.special.symbol      Constant
highlight! link @string.special.url         Underlined
highlight! link @character                  Character
highlight! link @character.special          SpecialChar
highlight! link @number                     Number
highlight! link @number.float               Float
highlight! link @boolean                    Boolean
highlight! link @constant                   Constant
highlight! link @constant.builtin           Constant
highlight! link @constant.macro             Macro

" — Variables
highlight! link @variable                   Identifier
highlight! link @variable.builtin           Constant
highlight! link @variable.parameter         SpecialChar
highlight! link @variable.parameter.builtin SpecialChar
highlight! link @variable.member            Identifier

" — Keywords
highlight! link @keyword                    Keyword
highlight! link @keyword.coroutine          Keyword
" storage.type.function → cyan italic: function/def/func/fn/fun across all languages
highlight! link @keyword.function           Type
highlight! link @keyword.operator           Operator
highlight! link @keyword.return             Keyword
highlight! link @keyword.import             Include
highlight! link @keyword.exception          Exception
highlight! link @keyword.conditional        Conditional
highlight! link @keyword.conditional.ternary Operator
highlight! link @keyword.repeat             Repeat
highlight! link @keyword.debug              Special
highlight! link @keyword.directive          PreProc
highlight! link @keyword.directive.define   Define

" — Operators
highlight! link @operator                   Operator

" — Punctuation — THE CRITICAL PART
" bracketsForeground = #AE81FF underline → parens, brackets, braces
" bracketContentsForeground = #F8F8F2 → content between brackets
" General punctuation (commas, dots, semicolons) → fg
highlight! link @punctuation.bracket        Delimiter
highlight! link @punctuation.delimiter      Normal
highlight! link @punctuation.special        Operator

" — Keywords (additions)
" storage (no .type) → orange: public/private/static/readonly/const/async/abstract/override
highlight! link @keyword.modifier           Keyword
" storage.type → cyan italic: class/struct/interface/enum/record keywords
highlight! link @keyword.type               Type

" — Types
highlight! link @type                       Type
highlight! link @type.builtin               Type
" entity.name.class → green + underline (class/struct name in declaration)
call s:hi('@type.definition', '#A6E22E', '', 'underline', 'underline')
" storage (no .type) → orange
highlight! link @type.qualifier             StorageClass
highlight! link @storageclass               StorageClass
highlight! link @attribute                  Function
highlight! link @attribute.builtin          Special
highlight! link @namespace                  Type
highlight! link @module                     Type
highlight! link @module.builtin             Special

" — Functions
highlight! link @function                   Function
highlight! link @function.builtin           Special
highlight! link @function.call              Function
highlight! link @function.macro             Macro
highlight! link @function.method            Function
highlight! link @function.method.call       Function
highlight! link @constructor                Function

" — Properties / Fields
highlight! link @property                   Identifier
highlight! link @field                      Identifier

" — Tags (HTML, XML, JSX, TSX)
highlight! link @tag                        Tag
highlight! link @tag.attribute              Function
highlight! link @tag.delimiter              Delimiter

" — Markup / Markdown
highlight! link @markup.heading             Title
highlight! link @markup.heading.1           Title
highlight! link @markup.heading.2           Type
highlight! link @markup.heading.3           Keyword
highlight! link @markup.heading.4           String
highlight! link @markup.heading.5           Comment
highlight! link @markup.heading.6           Comment
highlight! link @markup.link                Special
highlight! link @markup.link.url            Underlined
highlight! link @markup.link.label          Function
highlight! link @markup.raw                 String
highlight! link @markup.raw.block           String
highlight! link @markup.italic              Comment
highlight! link @markup.strong              Title
highlight! link @markup.strikethrough       Comment
highlight! link @markup.underline           Underlined
highlight! link @markup.quote               Comment
highlight! link @markup.list                Operator
highlight! link @markup.list.checked        Function
highlight! link @markup.list.unchecked      Comment
highlight! link @markup.math                Number

" — Diff
highlight! link @diff.plus                  DiffAdd
highlight! link @diff.minus                 DiffDelete
highlight! link @diff.delta                 DiffChange

" ════════════════════════════════════════════════════════════════
" 4. LINTER / DIAGNOSTICS
" ════════════════════════════════════════════════════════════════

call s:hi('DiagnosticError',           '#FF4A52', '',        'NONE',      'NONE')
call s:hi('DiagnosticWarn',            '#FFEF85', '',        'NONE',      'NONE')
call s:hi('DiagnosticInfo',            '#F8F8F2', '',        'NONE',      'NONE')
call s:hi('DiagnosticHint',            '#FFFFAA', '',        'NONE',      'NONE')
call s:hi('DiagnosticUnderlineError',  '',        '',        'undercurl', 'underline')
call s:hi('DiagnosticUnderlineWarn',   '',        '',        'undercurl', 'underline')
call s:hi('DiagnosticUnderlineInfo',   '',        '',        'undercurl', 'underline')
call s:hi('DiagnosticUnderlineHint',   '',        '',        'undercurl', 'underline')

" ════════════════════════════════════════════════════════════════
" 5. LANGUAGE-SPECIFIC HIGHLIGHT GROUPS
"    (classic Vim syntax plugins — before treesitter)
" ════════════════════════════════════════════════════════════════

" ── Python ──────────────────────────────────────────────────────
highlight! link pythonBuiltin       Special
highlight! link pythonBuiltinFunc   Special
highlight! link pythonBuiltinObj    Constant
highlight! link pythonDecorator     Function
highlight! link pythonDottedName    Function
highlight! link pythonException     Exception
highlight! link pythonExceptions    Type
" def/class keywords → storage.type → cyan italic
highlight! link pythonFunction      Type
highlight! link pythonImport        Include
highlight! link pythonOperator      Operator
highlight! link pythonParam         SpecialChar
highlight! link pythonSelf          Constant
highlight! link pythonStatement     Keyword

" ── PHP ─────────────────────────────────────────────────────────
highlight! link phpClass            Type
highlight! link phpClasses          Type
highlight! link phpDocTags          SpecialComment
highlight! link phpFunctions        Function
highlight! link phpMemberSelector   Operator
highlight! link phpMethods          Function
highlight! link phpParent           Delimiter
highlight! link phpRegion           Delimiter
" class/interface/abstract/trait keywords → storage.type → cyan italic
highlight! link phpStructure        Type
highlight! link phpSuperglobals     Constant
highlight! link phpType             Type
highlight! link phpVarSelector      Identifier

" ── JavaScript / TypeScript ──────────────────────────────────────
highlight! link jsArrowFuncArgs     SpecialChar
highlight! link jsBuiltins          Special
highlight! link jsClassDefinition   Type
" class keyword → storage.type.class → cyan italic
highlight! link jsClassKeyword      Type
highlight! link jsExtendsKeyword    Keyword
highlight! link jsFrom              Include
highlight! link jsFuncArgs          SpecialChar
highlight! link jsFuncCall          Function
" function keyword → storage.type.function → cyan italic
highlight! link jsFunction          Type
highlight! link jsGlobalObjects     Special
highlight! link jsImport            Include
highlight! link jsNull              Constant
highlight! link jsObjectKey         Identifier
highlight! link jsObjectProp        Identifier
highlight! link jsOperator          Operator
highlight! link jsParen             Delimiter
highlight! link jsParenIfElse       Delimiter
highlight! link jsParenRepeat       Delimiter
highlight! link jsParenSwitch       Delimiter
highlight! link jsSpreadOperator    Operator
highlight! link jsTemplateBraces    Delimiter
highlight! link jsThis              Constant
highlight! link jsUndefined         Constant
" TypeScript specific
highlight! link typescriptBraces        Delimiter
highlight! link typescriptCall          Function
highlight! link typescriptClassname     Type
highlight! link typescriptEndColons     Normal
highlight! link typescriptFuncName      Function
highlight! link typescriptIdentifier    Identifier
highlight! link typescriptMember        Identifier
highlight! link typescriptOperator      Operator
highlight! link typescriptParens        Delimiter
highlight! link typescriptProp          Identifier
highlight! link typescriptType          Type

" ── HTML / XML ───────────────────────────────────────────────────
" tagsOptions = stippled_underline → approximated as underline in Vim
highlight! link htmlTag             Normal
highlight! link htmlEndTag          Normal
highlight! link htmlTagName         Tag
highlight! link htmlArg             Function
highlight! link htmlSpecialChar     Constant
highlight! link htmlString          String
highlight! link htmlLink            Underlined
highlight! link htmlBold            Title
highlight! link htmlItalic          Comment
highlight! link xmlTag              Normal
highlight! link xmlTagName          Tag
highlight! link xmlAttrib           Function
highlight! link xmlEndTag           Normal
highlight! link xmlProcessingDelim  Delimiter
highlight! link xmlCdataStart       Delimiter
highlight! link xmlCdataCdata       String
highlight! link xmlDocTypeDecl      PreProc

" ── CSS / SCSS / Less ────────────────────────────────────────────
highlight! link cssAtKeyword        Include
highlight! link cssAttrComma        Normal
highlight! link cssAttrRegion       Constant
highlight! link cssBraces           Delimiter
highlight! link cssClassName        Function
highlight! link cssClassNameDot     Operator
highlight! link cssColor            Number
highlight! link cssDefinition       Identifier
highlight! link cssFunctionName     Special
highlight! link cssIdentifier       Identifier
highlight! link cssImportant        Keyword
highlight! link cssProp             Type
highlight! link cssPseudoClass      Keyword
highlight! link cssPseudoClassId    Keyword
highlight! link cssSelector         Tag
highlight! link cssSelectorOp       Operator
highlight! link cssSelectorOp2      Operator
highlight! link cssStringQ          String
highlight! link cssStringQQ         String
highlight! link cssUnitDecorators   Type
highlight! link cssURL              Underlined
highlight! link cssValueLength      Number
highlight! link cssValueNumber      Number
highlight! link cssVendor           Comment
highlight! link scssAmpersand       Operator
highlight! link scssAttribute       Identifier
highlight! link scssMixin           Function
highlight! link scssMixinName       Function
highlight! link scssVariable        Identifier

" ── Lua ──────────────────────────────────────────────────────────
" function keyword → storage.type.function → cyan italic
highlight! link luaFunction         Type
highlight! link luaLocal            Keyword
highlight! link luaSpecialTable     Special
highlight! link luaSpecialValue     Special
highlight! link luaBuiltIn          Special
highlight! link luaBraces           Delimiter
highlight! link luaParens           Delimiter
highlight! link luaTable            Delimiter

" ── C / C++ ──────────────────────────────────────────────────────
highlight! link cBraces             Delimiter
highlight! link cParen              Delimiter
highlight! link cDelimiter          Delimiter
highlight! link cDefine             Define
highlight! link cInclude            Include
highlight! link cOperator           Operator
highlight! link cppAccess           Keyword
highlight! link cppBoolean          Boolean
highlight! link cppExceptions       Exception
highlight! link cppModifier         StorageClass
highlight! link cppOperator         Operator
highlight! link cppStatement        Keyword
highlight! link cppSTLconstant      Constant
highlight! link cppSTLfunction      Function
highlight! link cppSTLtype          Type

" ── C# ───────────────────────────────────────────────────────────
highlight! link csClass             Type
highlight! link csClassType         Type
highlight! link csContextualStatement Keyword
highlight! link csEndColon          Normal
highlight! link csGeneric           Type
highlight! link csInterpolation     SpecialChar
" Interpolation delimiters $"{}" → orange (punctuation.special in TMTheme context)
highlight! link csInterpolationDelim Operator
" csModifier = public/private/static/abstract/readonly/const/async → storage → orange
highlight! link csModifier          StorageClass
highlight! link csNew               Keyword
highlight! link csNewType           Type
highlight! link csOperator          Operator
highlight! link csParens            Delimiter
highlight! link csPPKeyword         PreProc
" csStorage = class/struct/interface/enum/delegate/record → storage.type → cyan italic
highlight! link csStorage           Type
highlight! link csType              Type
highlight! link csUnspecifiedStatement Keyword
highlight! link csXmlTag            SpecialComment

" ── SQL ───────────────────────────────────────────────────────────
highlight! link sqlKeyword          Keyword
highlight! link sqlOperator         Operator
highlight! link sqlSpecial          Special
highlight! link sqlStatement        Statement
highlight! link sqlType             Type

" ── Markdown ──────────────────────────────────────────────────────
highlight! link markdownCode        String
highlight! link markdownCodeBlock   String
highlight! link markdownCodeDelimiter SpecialChar
highlight! link markdownH1          Title
highlight! link markdownH2          Type
highlight! link markdownH3          Keyword
highlight! link markdownH4          String
highlight! link markdownH1Delimiter Operator
highlight! link markdownH2Delimiter Operator
highlight! link markdownItalic      Comment
highlight! link markdownBold        Title
highlight! link markdownLink        Special
highlight! link markdownLinkText    Function
highlight! link markdownUrl         Underlined
highlight! link markdownListMarker  Operator
highlight! link markdownRule        Comment

" ── JSON ──────────────────────────────────────────────────────────
" meta.structure.dictionary.json string.quoted.double.json → #CFCFC2
" (JSON object keys are strings, so they get string color;
"  JSON object values override via this scope)
call s:hi('jsonKeyword',     '#678CB1', '', 'NONE', 'NONE')
call s:hi('jsonString',      '#CFCFC2', '', 'NONE', 'NONE')
call s:hi('jsonBraces',      '#AE81FF', '', 'NONE', 'NONE')
call s:hi('jsonQuote',       '#F3E87E', '', 'NONE', 'NONE')
call s:hi('jsonBoolean',     '#AE81FF', '', 'NONE', 'NONE')
call s:hi('jsonNull',        '#AE81FF', '', 'NONE', 'NONE')
call s:hi('jsonNumber',      '#AE81FF', '', 'NONE', 'NONE')
highlight! link jsonStringMatch  jsonString
highlight! link jsonEscape       SpecialChar

" ── YAML ──────────────────────────────────────────────────────────
highlight! link yamlKey             Identifier
highlight! link yamlAnchor          Special
highlight! link yamlAlias           Special
highlight! link yamlDocumentStart   Keyword
highlight! link yamlBlockCollectionItemStart Operator
highlight! link yamlFlowIndicator   Delimiter

" ── TOML ──────────────────────────────────────────────────────────
highlight! link tomlKey             Identifier
highlight! link tomlTable           Type
highlight! link tomlTableArray      Type

" ── Vim script ────────────────────────────────────────────────────
highlight! link vimCommand          Keyword
highlight! link vimCommentTitle     SpecialComment
highlight! link vimFunc             Function
highlight! link vimFuncName         Function
highlight! link vimGroup            Type
highlight! link vimHiGroup          Type
highlight! link vimIsCommand        Identifier
highlight! link vimLet              Keyword
highlight! link vimMapModKey        Special
highlight! link vimNotation         Special
highlight! link vimOption           Constant
highlight! link vimOper             Operator
highlight! link vimParenSep         Delimiter
highlight! link vimSep              Delimiter
highlight! link vimSetEqual         Operator
highlight! link vimSetSep           Normal
highlight! link vimSubst            Special
highlight! link vimSubstDelim       Delimiter
highlight! link vimUserFunc         Function

" ── Shell / Bash ─────────────────────────────────────────────────
highlight! link shArithmetic        Operator
highlight! link shCmdParenRegion    Delimiter
highlight! link shCmdSubRegion      Delimiter
highlight! link shDerefSimple       Identifier
highlight! link shDerefVar          Identifier
highlight! link shFunction          Function
" function keyword → storage.type.function → cyan italic
highlight! link shFunctionKey       Type
highlight! link shOperator          Operator
highlight! link shParen             Delimiter
highlight! link shRange             Operator

" ── Ruby ──────────────────────────────────────────────────────────
highlight! link rubyAccess          Keyword
highlight! link rubyAttribute       Function
highlight! link rubyBlock           Delimiter
highlight! link rubyBlockParameter  SpecialChar
highlight! link rubyBlockParameterList SpecialChar
" class keyword → storage.type.class → cyan italic
highlight! link rubyClass           Type
highlight! link rubyClassDeclaration Type
highlight! link rubyConstant        Constant
highlight! link rubyControl         Keyword
" def keyword → storage.type.function → cyan italic
highlight! link rubyDefine          Type
highlight! link rubyEscape          SpecialChar
highlight! link rubyFunction        Function
highlight! link rubyGlobalVariable  Identifier
highlight! link rubyInclude         Include
highlight! link rubyInstanceVariable Identifier
highlight! link rubyInterpolation   SpecialChar
highlight! link rubyInterpolationDelimiter Delimiter
" module keyword → storage.type → cyan italic
highlight! link rubyModuleDeclaration Type
highlight! link rubyOperator        Operator
highlight! link rubyPseudoVariable  Constant
highlight! link rubyStringDelimiter String

" ── Go ────────────────────────────────────────────────────────────
highlight! link goBuiltins          Special
highlight! link goConditional       Conditional
" func/var/const/type keywords: func → storage.type.function → cyan italic (dominates)
highlight! link goDeclaration       Type
highlight! link goFunctionCall      Function
highlight! link goLabel             Label
highlight! link goOperator          Operator
highlight! link goPackage           Include
highlight! link goReceiverType      Type
highlight! link goSignedInts        Type
highlight! link goType              Type
highlight! link goUnsignedInts      Type

" ── Rust ──────────────────────────────────────────────────────────
highlight! link rustAttribute       SpecialComment
highlight! link rustDeriveTrait     Special
highlight! link rustEnumVariant     Constant
highlight! link rustFoldBraces      Delimiter
highlight! link rustFuncName        Function
highlight! link rustKeyword         Keyword
highlight! link rustLifetime        Special
highlight! link rustMacro           Macro
highlight! link rustModPath         Type
highlight! link rustOperator        Operator
highlight! link rustSelf            Constant
highlight! link rustSigil           Operator
highlight! link rustStructure       Type
highlight! link rustTrait           Type

" ════════════════════════════════════════════════════════════════
" 6. PLUGIN INTEGRATIONS (classic Vim)
" ════════════════════════════════════════════════════════════════

" NERDTree
highlight! link NERDTreeDir         Directory
highlight! link NERDTreeDirSlash    Delimiter
highlight! link NERDTreeOpenable    Function
highlight! link NERDTreeClosable    Function
highlight! link NERDTreeFile        Normal
highlight! link NERDTreeExecFile    Special

" GitGutter / Signify
call s:hi('GitGutterAdd',           '#A6E22E', '#111111', 'NONE', 'NONE')
call s:hi('GitGutterChange',        '#E6DB74', '#111111', 'NONE', 'NONE')
call s:hi('GitGutterDelete',        '#FF4A52', '#111111', 'NONE', 'NONE')
call s:hi('GitGutterChangeDelete',  '#FD971F', '#111111', 'NONE', 'NONE')
highlight! link SignifySignAdd       GitGutterAdd
highlight! link SignifySignChange    GitGutterChange
highlight! link SignifySignDelete    GitGutterDelete

" ALE
highlight! link ALEError            DiagnosticError
highlight! link ALEWarning          DiagnosticWarn
highlight! link ALEInfo             DiagnosticInfo
highlight! link ALEStyleError       DiagnosticError
highlight! link ALEStyleWarning     DiagnosticWarn
highlight! link ALEErrorSign        DiagnosticError
highlight! link ALEWarningSign      DiagnosticWarn

" ════════════════════════════════════════════════════════════════
" 7. TERMINAL COLOURS (Vim 8+ / NeoVim)
" ════════════════════════════════════════════════════════════════
if has('termguicolors') || has('nvim')
    let g:terminal_color_0  = '#111111'
    let g:terminal_color_1  = '#FF4A52'
    let g:terminal_color_2  = '#A6E22E'
    let g:terminal_color_3  = '#F3E87E'
    let g:terminal_color_4  = '#678CB1'
    let g:terminal_color_5  = '#AE81FF'
    let g:terminal_color_6  = '#66D9EF'
    let g:terminal_color_7  = '#F8F8F2'
    let g:terminal_color_8  = '#3B3A32'
    let g:terminal_color_9  = '#FF4A52'
    let g:terminal_color_10 = '#A6E22E'
    let g:terminal_color_11 = '#FFE792'
    let g:terminal_color_12 = '#66D9EF'
    let g:terminal_color_13 = '#AE81FF'
    let g:terminal_color_14 = '#66D9EF'
    let g:terminal_color_15 = '#F8F8F0'
endif
