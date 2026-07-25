-- =============================================================================
-- solar_sooty — NeoVim 0.11+ colorscheme (Lua)
-- Ported from the Solar Sooty TMTheme (gerane/VSCodeThemes, Colorsublime)
-- Maintainer: Rafael Borges Dias Baptista (Borjao)
-- =============================================================================

local M = {}

local function hi(name, opts)
    vim.api.nvim_set_hl(0, name, opts)
end

-- ── Palette ──────────────────────────────────────────────────────────────────
-- Sourced directly and exhaustively from the TMTheme.
-- bg is #111 in the canonical Colorsublime copy (= #111111).
local c = {
    -- UI base
    bg           = '#111111',  -- background
    fg           = '#F8F8F2',  -- foreground
    caret        = '#F8F8F0',  -- cursor
    invisibles   = '#3B3A32',  -- whitespace / non-text
    line_hl      = '#2D2D2D',  -- lineHighlight (cursorline)
    selection    = '#2B2B2B',  -- selection
    sel_border   = '#555555',  -- selectionBorder (line numbers etc.)
    find_hl      = '#FFE792',  -- findHighlight (search)
    find_hl_fg   = '#000000',  -- findHighlightForeground
    embedded_bg  = '#131313',  -- embedded source background

    -- Syntax tokens (all from TMTheme)
    comment      = '#999999',  -- comment
    string       = '#F3E87E',  -- string
    number       = '#AE81FF',  -- constant.numeric / constant.language / constant.other
    --                            also bracketsForeground (parens, brackets, braces)
    variable     = '#678CB1',  -- variable
    keyword      = '#EC7600',  -- keyword / storage
    storage_type = '#66D9EF',  -- storage.type (italic)
    func_name    = '#A6E22E',  -- entity.name.function / entity.name.class / entity.other.attribute-name
    func_param   = '#FD971F',  -- variable.parameter (italic)
    tag_name     = '#FE890C',  -- entity.name.tag
    lib_func     = '#66D9EF',  -- support.function
    lib_const    = '#FFFFFF',  -- support.constant
    -- support.type / support.class also → lib_func (#66D9EF) italic
    json_str_val = '#CFCFC2',  -- meta.structure.dictionary.json string.quoted.double.json

    -- Diff / markup
    diff_del     = '#FF4A52',  -- markup.deleted
    diff_ins     = '#A6E22E',  -- markup.inserted
    diff_chg     = '#E6DB74',  -- markup.changed

    -- Invalid
    invalid_bg   = '#EC7600',  -- invalid background
    invalid_fg   = '#F8F8F0',  -- invalid foreground
    dep_bg       = '#AE81FF',  -- invalid.deprecated background

    -- Linter (SublimeLinter)
    lint_note_bg = '#FFFFAA',  -- sublimelinter.notes bg
    lint_warn_bg = '#FFEF85',  -- sublimelinter.warning bg
    lint_err_bg  = '#FF4A52',  -- sublimelinter.illegal bg
    lint_err_ul  = '#FF0000',  -- invalid.illegal underline
    lint_warn_ul = '#D30000',  -- invalid.warning underline
}

function M.load()
    if vim.fn.has('nvim') ~= 1 then
        vim.notify('[solar_sooty] Requires NeoVim.', vim.log.levels.ERROR)
        return
    end

    vim.cmd('highlight clear')
    if vim.fn.exists('syntax_on') == 1 then
        vim.cmd('syntax reset')
    end
    vim.g.colors_name   = 'solar_sooty'
    vim.o.termguicolors = true

    -- ── 1. BASE UI ──────────────────────────────────────────────────────────

    hi('Normal',           { fg = c.fg,        bg = c.bg })
    hi('NormalNC',         { fg = c.fg,        bg = c.bg })
    hi('NormalFloat',      { fg = c.fg,        bg = c.line_hl })
    hi('FloatBorder',      { fg = c.sel_border,bg = c.line_hl })
    hi('FloatTitle',       { fg = c.func_name, bg = c.line_hl, bold = true })

    hi('Cursor',           { fg = c.bg,        bg = c.caret })
    hi('CursorIM',         { fg = c.bg,        bg = c.caret })
    hi('TermCursor',       { fg = c.bg,        bg = c.caret })

    hi('CursorLine',       { bg = c.line_hl })
    hi('CursorColumn',     { bg = c.line_hl })
    hi('ColorColumn',      { bg = c.line_hl })

    hi('Visual',           { bg = c.selection })
    hi('VisualNOS',        { bg = c.selection })

    hi('NonText',          { fg = c.invisibles })
    hi('SpecialKey',       { fg = c.invisibles })
    hi('Whitespace',       { fg = c.invisibles })
    hi('EndOfBuffer',      { fg = c.invisibles })

    -- Search (findHighlight)
    hi('Search',           { fg = c.find_hl_fg, bg = c.find_hl })
    hi('IncSearch',        { fg = c.find_hl_fg, bg = c.find_hl, bold = true })
    hi('CurSearch',        { fg = c.find_hl_fg, bg = c.find_hl, bold = true })
    hi('Substitute',       { fg = c.find_hl_fg, bg = c.find_hl })

    -- Gutter
    hi('LineNr',           { fg = c.sel_border })
    hi('LineNrAbove',      { fg = c.sel_border })
    hi('LineNrBelow',      { fg = c.sel_border })
    hi('CursorLineNr',     { fg = c.fg,         bg = c.line_hl, bold = true })
    hi('SignColumn',       { fg = c.sel_border,  bg = c.bg })
    hi('FoldColumn',       { fg = c.sel_border,  bg = c.bg })
    hi('Folded',           { fg = c.comment,     bg = c.line_hl })

    -- Status / tab bar
    hi('StatusLine',       { fg = c.fg,          bg = c.line_hl })
    hi('StatusLineNC',     { fg = c.comment,     bg = c.line_hl })
    hi('TabLine',          { fg = c.comment,     bg = c.line_hl })
    hi('TabLineSel',       { fg = c.fg,          bg = c.bg,    bold = true })
    hi('TabLineFill',      { bg = c.bg })

    -- Wild / popup menu
    hi('WildMenu',         { fg = c.find_hl_fg, bg = c.find_hl, bold = true })
    hi('Pmenu',            { fg = c.fg,         bg = c.line_hl })
    hi('PmenuSel',         { fg = c.find_hl_fg, bg = c.find_hl, bold = true })
    hi('PmenuSbar',        { bg = c.invisibles })
    hi('PmenuThumb',       { bg = c.sel_border })
    hi('PmenuMatch',       { fg = c.func_name,  bg = c.line_hl, bold = true })
    hi('PmenuMatchSel',    { fg = c.func_name,  bg = c.find_hl, bold = true })

    -- Splits
    hi('VertSplit',        { fg = c.line_hl,    bg = c.bg })
    hi('WinSeparator',     { fg = c.line_hl,    bg = c.bg })

    -- Messages
    hi('ModeMsg',          { fg = c.func_name,  bold = true })
    hi('MoreMsg',          { fg = c.func_name,  bold = true })
    hi('Question',         { fg = c.func_name,  bold = true })
    hi('Title',            { fg = c.func_name,  bold = true })
    hi('WarningMsg',       { fg = c.keyword,    bold = true })
    hi('ErrorMsg',         { fg = c.caret,      bg = c.diff_del, bold = true })

    -- Matching brackets — bracketsForeground=#AE81FF bracketsOptions=underline
    hi('MatchParen',       { fg = c.number,     underline = true })

    -- Misc
    hi('Conceal',          { fg = c.comment })
    hi('Directory',        { fg = c.lib_func })
    hi('QuickFixLine',     { bg = c.selection })

    -- Diff
    hi('DiffAdd',          { fg = c.diff_ins,   bg = c.embedded_bg })
    hi('DiffDelete',       { fg = c.diff_del,   bg = c.embedded_bg })
    hi('DiffChange',       { fg = c.diff_chg,   bg = c.embedded_bg })
    hi('DiffText',         { fg = c.diff_chg,   bg = c.selection, bold = true })

    -- Spelling
    hi('SpellBad',         { sp = c.diff_del,   undercurl = true })
    hi('SpellCap',         { sp = c.lib_func,   undercurl = true })
    hi('SpellLocal',       { sp = c.func_name,  undercurl = true })
    hi('SpellRare',        { sp = c.number,     undercurl = true })

    -- Quickfix
    hi('qfLineNr',         { fg = c.number })
    hi('qfFileName',       { fg = c.lib_func })

    -- ── 2. CORE SYNTAX GROUPS ────────────────────────────────────────────────

    hi('Comment',          { fg = c.comment })

    hi('String',           { fg = c.string })
    hi('Character',        { fg = c.string })

    hi('Number',           { fg = c.number })
    hi('Float',            { fg = c.number })
    hi('Boolean',          { fg = c.number })
    hi('Constant',         { fg = c.number })

    hi('Identifier',       { fg = c.variable })

    hi('Keyword',          { fg = c.keyword })
    hi('Statement',        { fg = c.keyword })
    hi('Conditional',      { fg = c.keyword })
    hi('Repeat',           { fg = c.keyword })
    hi('Label',            { fg = c.keyword })
    hi('Exception',        { fg = c.keyword })
    hi('Operator',         { fg = c.keyword })

    hi('Type',             { fg = c.storage_type, italic = true })  -- storage.type → cyan italic
    hi('Typedef',          { fg = c.storage_type, italic = true })  -- storage.type → cyan italic
    hi('StorageClass',     { fg = c.keyword })                       -- storage (no .type) → orange
    hi('Structure',        { fg = c.storage_type, italic = true })  -- storage.type → cyan italic

    hi('Function',         { fg = c.func_name })

    hi('PreProc',          { fg = c.func_name })
    hi('Include',          { fg = c.keyword })
    hi('Define',           { fg = c.func_name })
    hi('Macro',            { fg = c.func_name })
    hi('PreCondit',        { fg = c.func_name })

    -- variable.parameter → italic #FD971F (SpecialChar)
    hi('SpecialChar',      { fg = c.func_param, italic = true })

    -- entity.name.tag → #FE890C
    hi('Tag',              { fg = c.tag_name })

    -- support.function / support.type → #66D9EF
    hi('Special',          { fg = c.lib_func })

    -- support.constant → #FFFFFF
    hi('SpecialComment',   { fg = c.lib_const })

    -- CRITICAL: bracketsForeground = #AE81FF (= c.number)
    -- Parentheses, brackets, braces all get this color with underline option
    -- In Vim/NeoVim, Delimiter is the group used for punctuation characters
    hi('Delimiter',        { fg = c.number })

    -- invalid → bg #EC7600 fg #F8F8F0
    hi('Error',            { fg = c.invalid_fg, bg = c.invalid_bg })
    -- invalid.deprecated → bg #AE81FF fg #F8F8F0
    hi('Underlined',       { fg = c.invalid_fg, bg = c.dep_bg, underline = true })
    hi('Todo',             { fg = c.find_hl_fg, bg = c.find_hl, bold = true })

    -- ── 3. TREESITTER CAPTURES ───────────────────────────────────────────────

    -- Comments
    hi('@comment',                    { fg = c.comment })
    hi('@comment.documentation',      { fg = c.comment, italic = true })
    hi('@comment.error',              { link = 'DiagnosticError' })
    hi('@comment.warning',            { link = 'DiagnosticWarn' })
    hi('@comment.todo',               { link = 'Todo' })
    hi('@comment.note',               { fg = c.lib_const })

    -- Literals
    hi('@string',                     { fg = c.string })
    hi('@string.regex',               { fg = c.string })
    hi('@string.regexp',              { fg = c.string })
    hi('@string.escape',              { fg = c.func_param, italic = true })
    hi('@string.special',             { fg = c.func_param })
    hi('@string.special.symbol',      { fg = c.number })
    hi('@string.special.url',         { fg = c.lib_func, underline = true })
    hi('@character',                  { fg = c.string })
    hi('@character.special',          { fg = c.func_param })
    hi('@number',                     { fg = c.number })
    hi('@number.float',               { fg = c.number })
    hi('@boolean',                    { fg = c.number })
    hi('@constant',                   { fg = c.number })
    hi('@constant.builtin',           { fg = c.number })
    hi('@constant.macro',             { fg = c.func_name })

    -- Variables
    hi('@variable',                   { fg = c.variable })
    hi('@variable.builtin',           { fg = c.number })        -- self, this, super
    hi('@variable.parameter',         { fg = c.func_param, italic = true })
    hi('@variable.parameter.builtin', { fg = c.func_param, italic = true })
    hi('@variable.member',            { fg = c.variable })

    -- Keywords
    hi('@keyword',                    { fg = c.keyword })
    hi('@keyword.coroutine',          { fg = c.keyword })
    -- storage.type.function → cyan italic: function/def/func/fn/fun across all languages
    hi('@keyword.function',           { fg = c.storage_type, italic = true })
    hi('@keyword.operator',           { fg = c.keyword })
    hi('@keyword.return',             { fg = c.keyword })
    hi('@keyword.import',             { fg = c.keyword })
    hi('@keyword.exception',          { fg = c.keyword })
    hi('@keyword.conditional',        { fg = c.keyword })
    hi('@keyword.conditional.ternary',{ fg = c.keyword })
    hi('@keyword.repeat',             { fg = c.keyword })
    hi('@keyword.debug',              { fg = c.lib_func })
    hi('@keyword.directive',          { fg = c.func_name })
    hi('@keyword.directive.define',   { fg = c.func_name })
    -- storage (no .type) → orange: public/private/static/readonly/const/async/abstract/override
    hi('@keyword.modifier',           { fg = c.keyword })
    -- storage.type → cyan italic: class/struct/interface/enum/record keywords
    hi('@keyword.type',               { fg = c.storage_type, italic = true })

    -- Operators
    hi('@operator',                   { fg = c.keyword })

    -- ── PUNCTUATION — THE KEY SECTION ────────────────────────────────────────
    -- bracketsForeground = #AE81FF (c.number) with underline
    -- bracketContentsForeground = #F8F8F2 A5 (semi-transparent fg, use fg)
    -- tagsOptions = stippled_underline (tag brackets get stippled underline)
    -- Commas, semicolons, dots → normal fg (not coloured in the tmTheme)
    hi('@punctuation.bracket',        { fg = c.number })        -- ( ) [ ] { }
    hi('@punctuation.delimiter',      { fg = c.fg })            -- , ; . :
    hi('@punctuation.special',        { fg = c.keyword })       -- interpolation #{} etc.

    -- Types
    hi('@type',                       { fg = c.storage_type, italic = true })  -- storage.type → cyan italic
    hi('@type.builtin',               { fg = c.storage_type, italic = true })  -- string/int/bool → cyan italic
    hi('@type.definition',            { fg = c.func_name, underline = true })  -- entity.name.class → green + underline
    hi('@type.qualifier',             { fg = c.keyword })                       -- storage (no .type) → orange
    hi('@storageclass',               { fg = c.keyword })                       -- storage (no .type) → orange
    hi('@attribute',                  { fg = c.func_name })
    hi('@attribute.builtin',          { fg = c.lib_func })
    hi('@namespace',                  { fg = c.storage_type })
    hi('@module',                     { fg = c.storage_type })
    hi('@module.builtin',             { fg = c.lib_func })

    -- Functions
    -- All known capture-name variants are mapped as a safety net, since
    -- nvim-treesitter query files change capture names across versions
    -- (e.g. @function.method vs @method, @function.call vs @call).
    hi('@function',                   { fg = c.func_name })
    hi('@function.builtin',           { fg = c.lib_func })
    hi('@function.call',              { fg = c.func_name })
    hi('@function.macro',             { fg = c.func_name })
    hi('@function.method',            { fg = c.func_name })
    hi('@function.method.call',       { fg = c.func_name })
    hi('@method',                     { fg = c.func_name })
    hi('@method.call',                { fg = c.func_name })
    hi('@call',                       { fg = c.func_name })
    hi('@call.function',              { fg = c.func_name })
    hi('@constructor',                { fg = c.func_name })

    -- Properties / fields
    hi('@property',                   { fg = c.variable })
    hi('@field',                      { fg = c.variable })

    -- Tags (HTML, XML, JSX) — tagsOptions=stippled_underline
    hi('@tag',                        { fg = c.tag_name })
    hi('@tag.attribute',              { fg = c.func_name })
    hi('@tag.delimiter',              { fg = c.number })        -- < > / — bracket colour

    -- Markup / Markdown
    hi('@markup.heading',             { fg = c.func_name, bold = true })
    hi('@markup.heading.1',           { fg = c.func_name, bold = true })
    hi('@markup.heading.2',           { fg = c.storage_type, bold = true })
    hi('@markup.heading.3',           { fg = c.keyword, bold = true })
    hi('@markup.heading.4',           { fg = c.string, bold = true })
    hi('@markup.heading.5',           { fg = c.comment, bold = true })
    hi('@markup.heading.6',           { fg = c.comment })
    hi('@markup.link',                { fg = c.lib_func })
    hi('@markup.link.url',            { fg = c.lib_func, underline = true })
    hi('@markup.link.label',          { fg = c.func_name })
    hi('@markup.raw',                 { fg = c.string })
    hi('@markup.raw.block',           { fg = c.string })
    hi('@markup.italic',              { fg = c.fg, italic = true })
    hi('@markup.strong',              { fg = c.fg, bold = true })
    hi('@markup.strikethrough',       { fg = c.comment, strikethrough = true })
    hi('@markup.underline',           { underline = true })
    hi('@markup.quote',               { fg = c.comment, italic = true })
    hi('@markup.list',                { fg = c.keyword })
    hi('@markup.list.checked',        { fg = c.func_name })
    hi('@markup.list.unchecked',      { fg = c.comment })
    hi('@markup.math',                { fg = c.number })

    -- Diff
    hi('@diff.plus',                  { fg = c.diff_ins })
    hi('@diff.minus',                 { fg = c.diff_del })
    hi('@diff.delta',                 { fg = c.diff_chg })

    -- ── 4. LSP SEMANTIC TOKENS ───────────────────────────────────────────────

    -- @lsp.type.class é o grupo BASE (sem modificador), aplicado sempre que
    -- um token é classificado como "class" — inclusive toda vez que você usa
    -- um tipo (HttpClient, JsonSerializer, GmailMessages como tipo genérico,
    -- etc.), não só quando declara. No tmTheme original, isso corresponde a
    -- support.class/storage.type = #66D9EF itálico — NÃO a entity.name.class
    -- (#A6E22E sublinhado), que no tmTheme é exclusivo do NOME da classe no
    -- ponto de declaração. Verde+underline só deve aparecer via o grupo
    -- composto @lsp.typemod.class.declaration (mais abaixo), que tem
    -- prioridade maior e sobrescreve este base especificamente na declaração.
    hi('@lsp.type.class',             { fg = c.storage_type, italic = true })
    hi('@lsp.type.decorator',         { fg = c.func_name })
    hi('@lsp.type.enum',              { fg = c.storage_type, italic = true })
    hi('@lsp.type.enumMember',        { fg = c.number })
    hi('@lsp.type.event',             { fg = c.func_name })
    -- @lsp.type.function/@lsp.type.method: entity.name.function no tmTheme
    -- original é #A6E22E SEM itálico e SEM underline — mesma cor tanto para
    -- declarar quanto para chamar um método/função próprios.
    hi('@lsp.type.function',          { fg = c.func_name })
    hi('@lsp.type.interface',         { fg = c.storage_type, italic = true })
    hi('@lsp.type.macro',             { fg = c.func_name })
    hi('@lsp.type.method',            { fg = c.func_name })
    hi('@lsp.type.modifier',          { fg = c.keyword })            -- storage modifiers → orange
    hi('@lsp.type.namespace',         { fg = c.storage_type })
    hi('@lsp.type.parameter',         { fg = c.func_param, italic = true })
    hi('@lsp.type.property',          { fg = c.variable })
    hi('@lsp.type.regexp',            { fg = c.string })
    hi('@lsp.type.struct',            { fg = c.storage_type, italic = true })
    hi('@lsp.type.type',              { fg = c.storage_type, italic = true })
    hi('@lsp.type.typeParameter',     { fg = c.func_param, italic = true })
    hi('@lsp.type.variable',          { fg = c.variable })
    hi('@lsp.type.keyword',           { fg = c.keyword })
    hi('@lsp.type.comment',           { fg = c.comment })
    hi('@lsp.type.string',            { fg = c.string })
    hi('@lsp.type.number',            { fg = c.number })
    hi('@lsp.type.operator',          { fg = c.keyword })
    hi('@lsp.type.selfKeyword',       { fg = c.number })
    hi('@lsp.type.builtinType',       { fg = c.storage_type, italic = true })
    hi('@lsp.type.lifetime',          { fg = c.lib_func })

    -- LSP modifier overrides (grupo @lsp.mod.<modifier> sozinho, sem tipo)
    -- Não força cor própria — só ajusta estilo (itálico/negrito), preservando
    -- a cor do @lsp.type.* correspondente por baixo.
    hi('@lsp.mod.deprecated',         { fg = c.invalid_fg, bg = c.dep_bg })
    hi('@lsp.mod.abstract',           { italic = true })

    -- ── 4b. LSP TYPEMOD COMPOSITE GROUPS (tipo + modificador combinados) ─────
    -- O Neovim monta grupos @lsp.typemod.<tokenType>.<modifier> quando um
    -- token tem modificadores (ex: um método "static" vira
    -- @lsp.typemod.method.static). Esses grupos compostos têm prioridade
    -- MAIOR que @lsp.type.<tokenType> sozinho, e por padrão o Neovim os
    -- linka para o grupo genérico "@lsp" (sem cor) quando não há um grupo
    -- explícito definido — isso fazia métodos/campos/propriedades static,
    -- readonly, declaration etc. ficarem sem cor mesmo com @lsp.type.method
    -- já mapeado corretamente. Replicamos aqui a cor do tipo base para cada
    -- combinação comum, para que o modificador não apague a cor do tipo.
    --
    -- IMPORTANTE sobre combinação de highlights: quando dois grupos se
    -- sobrepõem em prioridades diferentes, atributos NÃO mencionados no
    -- grupo de prioridade mais alta podem herdar do grupo de prioridade mais
    -- baixa por baixo. Como @lsp.type.class agora é itálico por padrão
    -- (cyan, caso comum de USO de tipo), todo grupo composto de DECLARAÇÃO
    -- (verde+underline, caso raro/especial) precisa zerar italic=false
    -- explicitamente, ou herdaria o itálico do grupo base por baixo.
    hi('@lsp.typemod.method.static',           { fg = c.func_name })
    hi('@lsp.typemod.method.declaration',      { fg = c.func_name })
    hi('@lsp.typemod.method.defaultLibrary',   { fg = c.lib_func })
    hi('@lsp.typemod.function.static',         { fg = c.func_name })
    hi('@lsp.typemod.function.declaration',    { fg = c.func_name })
    hi('@lsp.typemod.function.defaultLibrary', { fg = c.lib_func })

    -- class/struct/interface/enum .declaration: você DECLARANDO o tipo
    -- (public class Foo, struct Bar, interface Baz, enum Qux) →
    -- entity.name.class no tmTheme original → verde + underline, SEM
    -- itálico (zerado explicitamente para não herdar do base cyan-itálico).
    hi('@lsp.typemod.class.declaration',       { fg = c.func_name, underline = true, italic = false })
    hi('@lsp.typemod.struct.declaration',      { fg = c.func_name, underline = true, italic = false })
    hi('@lsp.typemod.interface.declaration',   { fg = c.func_name, underline = true, italic = false })
    hi('@lsp.typemod.enum.declaration',        { fg = c.func_name, underline = true, italic = false })
    -- "static class Foo" / "abstract class Foo": ainda é declaração da sua
    -- própria classe, mantém verde+underline sem itálico.
    hi('@lsp.typemod.class.static',            { fg = c.func_name, underline = true, italic = false })
    hi('@lsp.typemod.class.abstract',          { fg = c.func_name, underline = true, italic = false })

    -- class/struct/interface .defaultLibrary: você USANDO um tipo vindo de
    -- biblioteca externa (HttpClient, JsonSerializer, AuthenticationHeaderValue
    -- etc.) → support.class/storage.type no tmTheme original → cyan itálico,
    -- igual ao base @lsp.type.class. Mantido explícito aqui por robustez,
    -- caso o servidor combine defaultLibrary com outro modificador que crie
    -- prioridade diferente.
    hi('@lsp.typemod.class.defaultLibrary',     { fg = c.storage_type, italic = true, underline = false })
    hi('@lsp.typemod.struct.defaultLibrary',    { fg = c.storage_type, italic = true, underline = false })
    hi('@lsp.typemod.interface.defaultLibrary', { fg = c.storage_type, italic = true, underline = false })
    hi('@lsp.typemod.type.defaultLibrary',      { fg = c.storage_type, italic = true, underline = false })

    hi('@lsp.typemod.property.static',         { fg = c.variable })
    hi('@lsp.typemod.property.readonly',       { fg = c.variable })
    hi('@lsp.typemod.property.declaration',    { fg = c.variable })
    hi('@lsp.typemod.field.static',            { fg = c.variable })
    hi('@lsp.typemod.field.readonly',          { fg = c.variable })
    hi('@lsp.typemod.field.declaration',       { fg = c.variable })
    hi('@lsp.typemod.variable.static',         { fg = c.variable })
    hi('@lsp.typemod.variable.readonly',       { fg = c.variable })
    hi('@lsp.typemod.variable.declaration',    { fg = c.variable })
    hi('@lsp.typemod.variable.defaultLibrary', { fg = c.lib_func })
    hi('@lsp.typemod.parameter.declaration',   { fg = c.func_param, italic = true })
    hi('@lsp.typemod.namespace.declaration',   { fg = c.storage_type })
    hi('@lsp.typemod.enumMember.readonly',     { fg = c.number })
    hi('@lsp.typemod.enumMember.static',       { fg = c.number })

    -- Fallback final: qualquer combinação typemod não coberta explicitamente
    -- acima cai aqui em vez de ficar sem cor. Sem fg definido, herda Normal
    -- (sem cor) — então definimos ao menos a cor base de texto para não
    -- ficar pior que isso, mas o ideal é que os casos comuns acima cubram
    -- a grande maioria dos tokens reais.
    hi('@lsp', { fg = c.fg })

    -- ── 5. DIAGNOSTICS ───────────────────────────────────────────────────────

    -- sublimelinter.illegal → bg #FF4A52 fg #FFFFFF    underline #FF0000
    -- sublimelinter.warning → bg #FFEF85 fg #FFFFFF    underline #D30000
    -- sublimelinter.notes   → bg #FFFFAA fg #FFFFFF
    hi('DiagnosticError',             { fg = c.lint_err_bg })
    hi('DiagnosticWarn',              { fg = c.lint_warn_bg })
    hi('DiagnosticInfo',              { fg = c.fg })
    hi('DiagnosticHint',              { fg = c.lint_note_bg })
    hi('DiagnosticOk',                { fg = c.diff_ins })

    hi('DiagnosticUnderlineError',    { sp = c.lint_err_ul,  undercurl = true })
    hi('DiagnosticUnderlineWarn',     { sp = c.lint_warn_ul, undercurl = true })
    hi('DiagnosticUnderlineInfo',     { sp = c.lib_func,     undercurl = true })
    hi('DiagnosticUnderlineHint',     { sp = c.find_hl,      undercurl = true })

    hi('DiagnosticFloatingError',     { fg = c.lint_err_bg })
    hi('DiagnosticFloatingWarn',      { fg = c.lint_warn_bg })
    hi('DiagnosticFloatingInfo',      { fg = c.fg })
    hi('DiagnosticFloatingHint',      { fg = c.lint_note_bg })

    hi('DiagnosticSignError',         { fg = c.lint_err_bg,  bg = c.bg })
    hi('DiagnosticSignWarn',          { fg = c.lint_warn_bg, bg = c.bg })
    hi('DiagnosticSignInfo',          { fg = c.fg,           bg = c.bg })
    hi('DiagnosticSignHint',          { fg = c.lint_note_bg, bg = c.bg })

    hi('DiagnosticVirtualTextError',  { fg = c.lint_err_bg,  italic = true })
    hi('DiagnosticVirtualTextWarn',   { fg = c.lint_warn_bg, italic = true })
    hi('DiagnosticVirtualTextInfo',   { fg = c.fg,           italic = true })
    hi('DiagnosticVirtualTextHint',   { fg = c.lint_note_bg, italic = true })

    -- ── 6. LANGUAGE-SPECIFIC OVERRIDES ───────────────────────────────────────

    -- JSON — object keys inherit Identifier (#678CB1); values are #CFCFC2
    hi('jsonKeyword',                 { fg = c.variable })
    hi('jsonString',                  { fg = c.json_str_val })
    hi('jsonBraces',                  { fg = c.number })
    hi('jsonQuote',                   { fg = c.string })
    hi('jsonBoolean',                 { fg = c.number })
    hi('jsonNull',                    { fg = c.number })
    hi('jsonNumber',                  { fg = c.number })

    -- HTML / XML — tagsOptions=stippled_underline
    hi('@tag.html',                   { fg = c.tag_name })
    hi('@tag.attribute.html',         { fg = c.func_name })
    hi('@tag.delimiter.html',         { fg = c.number })
    hi('@tag.jsx',                    { fg = c.tag_name })
    hi('@tag.attribute.jsx',          { fg = c.func_name })
    hi('@tag.tsx',                    { fg = c.tag_name })
    hi('@tag.attribute.tsx',          { fg = c.func_name })

    -- CSS
    hi('@property.css',               { fg = c.storage_type, italic = true })
    hi('@type.css',                   { fg = c.tag_name })
    hi('cssClassName',                { fg = c.func_name })
    hi('cssClassNameDot',             { fg = c.keyword })
    hi('cssIdentifier',               { fg = c.variable })
    hi('cssBraces',                   { fg = c.number })
    hi('cssSelectorOp',               { fg = c.keyword })
    hi('cssProp',                     { fg = c.storage_type, italic = true })

    -- PHP
    -- phpStructure = class/interface/trait/abstract/enum keywords → storage.type → cyan italic
    hi('phpStructure',               { link = 'Type' })
    hi('@variable.php',              { fg = c.variable })
    hi('phpVarSelector',             { fg = c.variable })
    hi('phpMemberSelector',          { fg = c.keyword })
    hi('phpParent',                  { fg = c.number })
    -- phpFunction = function keyword → storage.type.function → cyan italic
    hi('phpFunctions',               { link = 'Function' })   -- built-in function calls → green
    hi('@keyword.function.php',      { fg = c.storage_type, italic = true })

    -- Lua
    -- luaFunction = function keyword → storage.type.function → cyan italic
    hi('luaFunction',                { link = 'Type' })
    hi('@punctuation.bracket.lua',   { fg = c.number })
    hi('luaBraces',                  { fg = c.number })
    hi('luaParens',                  { fg = c.number })

    -- Python
    -- def/class in Python: storage.type.function / storage.type.class → cyan italic
    hi('@keyword.function.python',   { fg = c.storage_type, italic = true })
    hi('@keyword.type.python',       { fg = c.storage_type, italic = true })
    hi('@variable.builtin.python',   { fg = c.number })
    hi('pythonBuiltin',              { fg = c.lib_func })

    -- JavaScript / TypeScript
    -- function keyword → storage.type.function → cyan italic
    hi('jsFunction',                 { link = 'Type' })
    hi('@keyword.function.javascript',{ fg = c.storage_type, italic = true })
    hi('@keyword.function.typescript',{ fg = c.storage_type, italic = true })

    -- Ruby
    -- class/module keywords → storage.type.class → cyan italic
    -- def keyword → storage.type.function → cyan italic
    hi('rubyClass',                  { link = 'Type' })
    hi('rubyDefine',                 { link = 'Type' })
    hi('rubyModuleDeclaration',      { link = 'Type' })
    hi('@keyword.function.ruby',     { fg = c.storage_type, italic = true })
    hi('@keyword.type.ruby',         { fg = c.storage_type, italic = true })

    -- Go
    -- func keyword → storage.type.function → cyan italic
    -- var/const/type → storage → orange (goDeclaration covers all; split via treesitter)
    hi('goDeclaration',              { link = 'Type' })  -- func dominates visually
    hi('@keyword.function.go',       { fg = c.storage_type, italic = true })
    hi('@keyword.type.go',           { fg = c.storage_type, italic = true })

    -- Shell / Bash
    -- function keyword → storage.type.function → cyan italic
    hi('shFunctionKey',              { link = 'Type' })
    hi('@keyword.function.bash',     { fg = c.storage_type, italic = true })

    -- C# — overrides for correct storage/storage.type separation
    -- csStorage covers: class, struct, interface, enum, delegate, record, namespace → storage.type → cyan italic
    hi('csStorage',                   { link = 'Type' })
    -- csModifier covers: public, private, protected, static, abstract, sealed, virtual,
    --   override, readonly, extern, const, async, partial → storage → orange
    hi('csModifier',                  { link = 'Keyword' })
    -- csClass / csClassType = type names used as types → cyan italic
    hi('csClass',                     { link = 'Type' })
    hi('csClassType',                 { link = 'Type' })
    hi('csNew',                       { link = 'Keyword' })
    -- Treesitter C# — explicit overrides to guarantee correctness regardless of grammar version
    hi('@keyword.modifier.cs',        { fg = c.keyword })                      -- storage → orange
    hi('@keyword.type.cs',            { fg = c.storage_type, italic = true })  -- storage.type → cyan italic
    hi('@type.definition.cs',         { fg = c.func_name, underline = true })  -- entity.name.class
    -- Brackets and interpolation in C#
    hi('csParens',                    { fg = c.number })
    hi('csInterpolationDelim',        { fg = c.keyword })  -- $"{}" interpolation braces → orange (punctuation.special)

    -- SQL
    hi('sqlKeyword',                  { fg = c.keyword })
    hi('sqlSpecial',                  { fg = c.lib_func })

    -- Markdown
    hi('markdownCode',                { fg = c.string })
    hi('markdownCodeBlock',           { fg = c.string })
    hi('markdownH1',                  { fg = c.func_name, bold = true })
    hi('markdownH2',                  { fg = c.storage_type, bold = true })
    hi('markdownH3',                  { fg = c.keyword, bold = true })
    hi('markdownLink',                { fg = c.lib_func, underline = true })
    hi('markdownUrl',                 { fg = c.lib_func, underline = true })
    hi('markdownLinkText',            { fg = c.func_name })

    -- ── 7. PLUGIN INTEGRATIONS ───────────────────────────────────────────────

    -- nvim-cmp
    hi('CmpItemAbbrMatch',            { fg = c.func_name,   bold = true })
    hi('CmpItemAbbrMatchFuzzy',       { fg = c.func_name })
    hi('CmpItemAbbrDeprecated',       { fg = c.comment,     strikethrough = true })
    hi('CmpItemKindFunction',         { fg = c.func_name })
    hi('CmpItemKindMethod',           { fg = c.func_name })
    hi('CmpItemKindClass',            { fg = c.storage_type })
    hi('CmpItemKindInterface',        { fg = c.storage_type })
    hi('CmpItemKindVariable',         { fg = c.variable })
    hi('CmpItemKindConstant',         { fg = c.number })
    hi('CmpItemKindKeyword',          { fg = c.keyword })
    hi('CmpItemKindString',           { fg = c.string })
    hi('CmpItemKindField',            { fg = c.variable })
    hi('CmpItemKindEnum',             { fg = c.storage_type })
    hi('CmpItemKindEnumMember',       { fg = c.number })
    hi('CmpItemKindSnippet',          { fg = c.func_param })
    hi('CmpItemKindModule',           { fg = c.storage_type })
    hi('CmpItemKindText',             { fg = c.fg })
    hi('CmpItemKindOperator',         { fg = c.keyword })
    hi('CmpItemKindUnit',             { fg = c.number })
    hi('CmpItemMenu',                 { fg = c.comment, italic = true })

    -- blink.cmp (NeoVim 0.11 preferred completion plugin)
    hi('BlinkCmpLabel',               { fg = c.fg })
    hi('BlinkCmpLabelMatch',          { fg = c.func_name, bold = true })
    hi('BlinkCmpLabelDeprecated',     { fg = c.comment, strikethrough = true })
    hi('BlinkCmpKindFunction',        { fg = c.func_name })
    hi('BlinkCmpKindMethod',          { fg = c.func_name })
    hi('BlinkCmpKindClass',           { fg = c.storage_type })
    hi('BlinkCmpKindVariable',        { fg = c.variable })
    hi('BlinkCmpKindKeyword',         { fg = c.keyword })
    hi('BlinkCmpKindConstant',        { fg = c.number })
    hi('BlinkCmpKindSnippet',         { fg = c.func_param })
    hi('BlinkCmpMenu',                { fg = c.fg, bg = c.line_hl })
    hi('BlinkCmpMenuBorder',          { fg = c.sel_border, bg = c.line_hl })
    hi('BlinkCmpMenuSelection',       { fg = c.find_hl_fg, bg = c.find_hl, bold = true })
    hi('BlinkCmpDoc',                 { fg = c.fg, bg = c.line_hl })
    hi('BlinkCmpDocBorder',           { fg = c.sel_border, bg = c.line_hl })
    hi('BlinkCmpSignatureHelp',       { fg = c.fg, bg = c.line_hl })
    hi('BlinkCmpSignatureHelpBorder', { fg = c.sel_border, bg = c.line_hl })

    -- Telescope
    hi('TelescopeNormal',             { fg = c.fg,         bg = c.bg })
    hi('TelescopeBorder',             { fg = c.line_hl,    bg = c.bg })
    hi('TelescopeMatching',           { fg = c.func_name,  bold = true })
    hi('TelescopeSelection',          { bg = c.selection })
    hi('TelescopeSelectionCaret',     { fg = c.keyword })
    hi('TelescopeMultiSelection',     { bg = c.line_hl })
    hi('TelescopePromptNormal',       { fg = c.fg,         bg = c.line_hl })
    hi('TelescopePromptBorder',       { fg = c.line_hl,    bg = c.line_hl })
    hi('TelescopePromptTitle',        { fg = c.func_name,  bold = true })
    hi('TelescopeResultsTitle',       { fg = c.comment })
    hi('TelescopePreviewTitle',       { fg = c.lib_func })

    -- fzf-lua
    hi('FzfLuaNormal',                { fg = c.fg,         bg = c.bg })
    hi('FzfLuaBorder',                { fg = c.line_hl })
    hi('FzfLuaTitle',                 { fg = c.func_name,  bold = true })
    hi('FzfLuaCursorLine',            { bg = c.selection })
    hi('FzfLuaMatch',                 { fg = c.func_name,  bold = true })

    -- nvim-tree
    hi('NvimTreeFolderIcon',          { fg = c.lib_func })
    hi('NvimTreeFolderName',          { fg = c.lib_func })
    hi('NvimTreeOpenedFolderName',    { fg = c.func_name })
    hi('NvimTreeRootFolder',          { fg = c.keyword })
    hi('NvimTreeGitDirty',            { fg = c.diff_chg })
    hi('NvimTreeGitNew',              { fg = c.diff_ins })
    hi('NvimTreeGitDeleted',          { fg = c.diff_del })
    hi('NvimTreeIndentMarker',        { fg = c.invisibles })

    -- neo-tree
    hi('NeoTreeGitAdded',             { fg = c.diff_ins })
    hi('NeoTreeGitModified',          { fg = c.diff_chg })
    hi('NeoTreeGitDeleted',           { fg = c.diff_del })
    hi('NeoTreeRootName',             { fg = c.keyword, bold = true })
    hi('NeoTreeDirectoryIcon',        { fg = c.lib_func })
    hi('NeoTreeDirectoryName',        { fg = c.lib_func })
    hi('NeoTreeFileName',             { fg = c.fg })

    -- Gitsigns
    hi('GitSignsAdd',                 { fg = c.diff_ins,   bg = c.bg })
    hi('GitSignsChange',              { fg = c.diff_chg,   bg = c.bg })
    hi('GitSignsDelete',              { fg = c.diff_del,   bg = c.bg })
    hi('GitSignsAddInline',           { fg = c.diff_ins,   bg = c.embedded_bg })
    hi('GitSignsChangeInline',        { fg = c.diff_chg,   bg = c.embedded_bg })
    hi('GitSignsDeleteInline',        { fg = c.diff_del,   bg = c.embedded_bg })

    -- Which-key
    hi('WhichKey',                    { fg = c.keyword })
    hi('WhichKeyGroup',               { fg = c.lib_func })
    hi('WhichKeyDesc',                { fg = c.fg })
    hi('WhichKeySeperator',           { fg = c.comment })
    hi('WhichKeyNormal',              { fg = c.fg,         bg = c.line_hl })
    hi('WhichKeyBorder',              { fg = c.sel_border, bg = c.line_hl })
    hi('WhichKeyTitle',               { fg = c.func_name,  bold = true })

    -- Indent-blankline / indent-guides
    hi('IblIndent',                   { fg = c.invisibles })
    hi('IblScope',                    { fg = c.sel_border })
    hi('IndentBlanklineChar',         { fg = c.invisibles })
    hi('IndentBlanklineContextChar',  { fg = c.sel_border })

    -- Noice
    hi('NoiceCmdline',                { fg = c.fg,         bg = c.line_hl })
    hi('NoiceCmdlineIcon',            { fg = c.keyword })
    hi('NoiceCmdlineBorder',          { fg = c.sel_border, bg = c.line_hl })
    hi('NoicePopup',                  { fg = c.fg,         bg = c.line_hl })
    hi('NoicePopupBorder',            { fg = c.sel_border, bg = c.line_hl })
    hi('NoiceConfirm',                { fg = c.fg,         bg = c.line_hl })

    -- mini.nvim (mini.statusline, mini.files, mini.pick)
    hi('MiniStatuslineModeNormal',    { fg = c.bg,         bg = c.func_name,   bold = true })
    hi('MiniStatuslineModeInsert',    { fg = c.bg,         bg = c.keyword,     bold = true })
    hi('MiniStatuslineModeVisual',    { fg = c.bg,         bg = c.number,      bold = true })
    hi('MiniStatuslineModeReplace',   { fg = c.bg,         bg = c.diff_del,    bold = true })
    hi('MiniStatuslineModeCommand',   { fg = c.bg,         bg = c.lib_func,    bold = true })
    hi('MiniStatuslineModeOther',     { fg = c.bg,         bg = c.comment })
    hi('MiniStatuslineFilename',      { fg = c.fg,         bg = c.line_hl })
    hi('MiniStatuslineFileinfo',      { fg = c.comment,    bg = c.line_hl })
    hi('MiniStatuslineDevinfo',       { fg = c.variable,   bg = c.line_hl })
    hi('MiniPickMatchCurrent',        { bg = c.selection })
    hi('MiniPickMatchMarked',         { fg = c.find_hl_fg, bg = c.find_hl })
    hi('MiniPickPrompt',              { fg = c.func_name })
    hi('MiniFilesTitle',              { fg = c.func_name, bold = true })
    hi('MiniFilesTitleFocused',       { fg = c.func_name, bold = true, underline = true })
    hi('MiniFilesDirectory',          { fg = c.lib_func })

    -- ── 8. TERMINAL COLOURS ──────────────────────────────────────────────────
    vim.g.terminal_color_0  = c.bg
    vim.g.terminal_color_1  = c.diff_del
    vim.g.terminal_color_2  = c.diff_ins
    vim.g.terminal_color_3  = c.string
    vim.g.terminal_color_4  = c.variable
    vim.g.terminal_color_5  = c.number
    vim.g.terminal_color_6  = c.lib_func
    vim.g.terminal_color_7  = c.fg
    vim.g.terminal_color_8  = c.invisibles
    vim.g.terminal_color_9  = c.diff_del
    vim.g.terminal_color_10 = c.diff_ins
    vim.g.terminal_color_11 = c.find_hl
    vim.g.terminal_color_12 = c.lib_func
    vim.g.terminal_color_13 = c.number
    vim.g.terminal_color_14 = c.lib_func
    vim.g.terminal_color_15 = c.caret

    -- ── 9. RE-APPLY GUARD ─────────────────────────────────────────────────────
    -- Some LSP servers (notably OmniSharp / csharp-ls for C#) register their
    -- own semantic-token highlight groups *after* this colorscheme has already
    -- run — either on LspAttach or on the first semantic-tokens refresh — and
    -- those groups can silently win over ours if they are applied later in
    -- the same buffer. Re-apply the LSP/treesitter-critical subset whenever
    -- an LSP client attaches or semantic tokens refresh, so our palette
    -- always has the last word.
    local reapply_group = vim.api.nvim_create_augroup('SolarSootyReapply', { clear = true })

    local function reapply_critical()
        hi('Function',                    { fg = c.func_name })
        hi('Delimiter',                   { fg = c.number })
        hi('@function',                   { fg = c.func_name })
        hi('@function.call',              { fg = c.func_name })
        hi('@function.method',            { fg = c.func_name })
        hi('@function.method.call',       { fg = c.func_name })
        hi('@method',                     { fg = c.func_name })
        hi('@method.call',                { fg = c.func_name })
        hi('@punctuation.bracket',        { fg = c.number })
        hi('@lsp.type.function',          { fg = c.func_name })
        hi('@lsp.type.method',            { fg = c.func_name })
        hi('@lsp.typemod.function.declaration',  { fg = c.func_name })
        hi('@lsp.typemod.method.declaration',    { fg = c.func_name })
        hi('@lsp.typemod.function.defaultLibrary',{ fg = c.lib_func })
        hi('@lsp.typemod.method.defaultLibrary',  { fg = c.lib_func })
    end

    vim.api.nvim_create_autocmd({ 'LspAttach', 'ColorScheme' }, {
        group = reapply_group,
        callback = function()
            vim.defer_fn(reapply_critical, 0)
        end,
    })
end

return M

