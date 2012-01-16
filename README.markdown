jellybeans.vim
==============

A colorful, dark color scheme, inspired by [ir_black][] and [twilight][].

Designed primarily for a graphical Vim, but includes support for 256, 88, 16,
and 8 color terminals. On a 16 or 8 color terminal, replace its colors with
those in `ansi-term-colors.txt` for best results.

If you use Apple’s pre-10.7 Terminal.app, the TerminalColours plugin
([Leopard][tc-leopard], [Snow Leopard][tc-snowleopard]) will allow you
to change the default colors.

If you can't change your terminal's colors, add
`let g:jellybeans_use_lowcolor_black = 0` to your .vimrc to render
'black' text as grey.

This script is [vimscript #2555][vimscript] at Vim.org.

### Screenshots

![][preview-ss]


[ir_black]: http://blog.infinitered.com/entries/show/6
[twilight]: http://www.vim.org/scripts/script.php?script_id=1677
[vimscript]: http://www.vim.org/scripts/script.php?script_id=2555
[tc-leopard]: http://ciaranwal.sh/2007/11/01/customising-colours-in-leopard-terminal
[tc-snowleopard]: http://github.com/timmfin/terminalcolours
[preview-ss]: http://nanotech.nanotechcorp.net/downloads/jellybeans-preview.png
