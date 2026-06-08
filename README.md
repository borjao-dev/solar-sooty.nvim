# Solar Sooty — Vim & NeoVim Port

Port fiel do tema **Solar Sooty** (originalmente para VS Code / Sublime Text)
para Vim clássico e NeoVim 0.11+.

Paleta original preservada integralmente: fundo `#080808`, texto `#F8F8F2`,
strings `#F3E87E`, keywords `#EC7600`, funções `#A6E22E`, tipos `#66D9EF`,
constantes/números `#AE81FF`, variáveis `#678CB1`.

---

## Vim clássico (7+)

### Instalação manual

```
~/.vim/colors/solar_sooty.vim
```

### Instalação via plugin manager

**vim-plug:**
```vim
Plug 'seu-usuario/solar-sooty-vim'
```

### Ativação

No seu `~/.vimrc`:
```vim
set termguicolors          " obrigatório para cores exatas (Vim 8+)
colorscheme solar_sooty
```

> Em terminais que não suportam `termguicolors`, o tema cai automaticamente
> para aproximações xterm-256. Todas as cores foram mapeadas manualmente.

---

## NeoVim (0.11.5+)

A versão NeoVim é escrita em Lua pura e cobre:
- Todos os grupos de highlight clássicos
- Treesitter (`@comment`, `@function`, `@lsp.type.*`, etc.)
- Tokens semânticos LSP (`@lsp.type.*`)
- Diagnósticos (`DiagnosticError`, `DiagnosticUnderlineWarn`, etc.)
- Plugins: nvim-cmp, Telescope, nvim-tree, Gitsigns, Which-key, indent-blankline

### Estrutura do plugin

```
solar-sooty-nvim/
├── colors/
│   └── solar_sooty.vim      ← entrypoint (chama o Lua)
└── lua/
    └── solar_sooty/
        └── init.lua         ← toda a lógica
```

### Instalação manual

```
~/.config/nvim/colors/solar_sooty.vim
~/.config/nvim/lua/solar_sooty/init.lua
```

### Instalação via lazy.nvim

```lua
{
    dir = '~/path/to/solar-sooty-nvim',  -- ou URL do repositório
    name = 'solar_sooty',
    priority = 1000,                      -- carrega antes de outros plugins
    config = function()
        vim.cmd.colorscheme('solar_sooty')
    end,
}
```

### Instalação via vim-plug / packer

```vim
Plug 'seu-usuario/solar-sooty-nvim'
```
```lua
use 'seu-usuario/solar-sooty-nvim'
```

### Ativação

No seu `init.lua`:
```lua
vim.opt.termguicolors = true
vim.cmd.colorscheme('solar_sooty')
```

Ou no `init.vim`:
```vim
set termguicolors
colorscheme solar_sooty
```

---

## Mapeamento de tokens (TMTheme → Vim)

| TMTheme scope                         | Grupo Vim              | Cor         |
|---------------------------------------|------------------------|-------------|
| `comment`                             | `Comment`              | `#999999`   |
| `string`                              | `String`               | `#F3E87E`   |
| `constant.numeric`                    | `Number`, `Float`      | `#AE81FF`   |
| `constant.language/character/other`   | `Constant`, `Boolean`  | `#AE81FF`   |
| `variable`                            | `Identifier`           | `#678CB1`   |
| `keyword` / `storage`                 | `Keyword`, `Statement` | `#EC7600`   |
| `storage.type`                        | `Type` (italic)        | `#66D9EF`   |
| `entity.name.class`                   | `@lsp.type.class`      | `#A6E22E`   |
| `entity.name.function`                | `Function`             | `#A6E22E`   |
| `variable.parameter`                  | `@variable.parameter`  | `#FD971F`   |
| `entity.name.tag`                     | `Tag`                  | `#FE890C`   |
| `entity.other.attribute-name`         | `@tag.attribute`       | `#A6E22E`   |
| `support.function` / `support.type`   | `Special`, `Type`      | `#66D9EF`   |
| `support.constant`                    | `SpecialComment`       | `#FFFFFF`   |
| `invalid`                             | `Error`                | bg `#EC7600`|
| `invalid.deprecated`                  | `Underlined`           | bg `#AE81FF`|
| `markup.deleted`                      | `DiffDelete`           | `#FF4A52`   |
| `markup.inserted`                     | `DiffAdd`              | `#A6E22E`   |
| `markup.changed`                      | `DiffChange`           | `#E6DB74`   |
