" colors/solar_sooty.vim — NeoVim entrypoint
" This file is intentionally minimal. All logic lives in lua/solar_sooty/init.lua
if !has('nvim')
    echoerr 'solar_sooty: this colorscheme requires NeoVim. Use the classic Vim version instead.'
    finish
endif

lua require('solar_sooty').load()
