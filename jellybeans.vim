" Vim color file
"
"  "    __       _ _       _                             "
"  "    \ \  ___| | |_   _| |__   ___  __ _ _ __  ___    "
"  "     \ \/ _ \ | | | | |  _ \ / _ \/ _  |  _ \/ __|   "
"  "  /\_/ /  __/ | | |_| | |_) |  __/ |_| | | | \__ \   "
"  "  \___/ \___|_|_|\__  |____/ \___|\____|_| |_|___/   "
"  "                 \___/                               "
"
"         "A colorful, dark color scheme for Vim."
"
" File:         jellybeans.vim
" Maintainer:   NanoTech <http://nanotech.nanotechcorp.net/>
" Version:      1.1
" Last Change:  May 22nd, 2009
"
" Copyright (c) 2009 NanoTech
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.
"

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "jellybeans"

if version >= 700
  hi CursorLine guibg=#1c1c1c cterm=none
  hi CursorColumn guibg=#1c1c1c
  hi MatchParen guifg=white guibg=#80a090 gui=bold

  hi TabLine guifg=black guibg=#b0b8c0 gui=italic
  hi TabLineFill guifg=#9098a0
  hi TabLineSel guifg=black guibg=#f0f0f0 gui=italic,bold

  " Auto-completion
  hi Pmenu guifg=white guibg=#000000
  hi PmenuSel guifg=#101010 guibg=#eeeeee
endif

hi Visual guibg=#404040

hi Cursor guibg=#b0d0f0

hi Normal guifg=#e8e8d3 guibg=#151515 ctermfg=white ctermbg=none
hi LineNr guifg=#605958 guibg=#151515 gui=none ctermfg=black
hi Comment guifg=#888888 gui=italic ctermbg=none ctermfg=grey
hi Todo guifg=#808080 guibg=NONE gui=bold,italic

hi StatusLine guifg=#f0f0f0 guibg=#101010 gui=italic
hi StatusLineNC guifg=#a0a0a0 guibg=#181818 gui=italic
hi VertSplit guifg=#181818 guibg=#181818 gui=italic

hi Folded guibg=#384048 guifg=#a0a8b0 gui=italic ctermbg=none ctermfg=black
hi FoldColumn guibg=#384048 guifg=#a0a8b0
hi SignColumn guibg=#384048 guifg=#a0a8b0

hi Title guifg=#70b950 gui=bold

hi Constant guifg=#cf6a4c ctermfg=red
hi Special guifg=#799d6a ctermfg=green
hi Delimiter guifg=#668799 ctermfg=grey

hi String guifg=#99ad6a ctermfg=green
hi StringDelimiter guifg=#556633 ctermfg=darkgreen

hi Identifier guifg=#c6b6ee ctermfg=lightcyan
hi Structure guifg=#8fbfdc gui=NONE ctermfg=lightcyan
hi Function guifg=#fad07a ctermfg=yellow
hi Statement guifg=#8197bf gui=NONE ctermfg=darkblue
hi PreProc guifg=#8fbfdc ctermfg=lightblue

hi link Operator Normal

hi Type guifg=#ffb964 gui=NONE ctermfg=yellow
hi NonText guifg=#808080 guibg=#151515

hi SpecialKey guifg=#808080 guibg=#343434

hi Search guifg=#f0a0c0 guibg=#302028 gui=underline ctermbg=none ctermfg=magenta cterm=underline

hi Directory guifg=#dad085 gui=NONE
hi Error guibg=#602020

" Diff

hi link diffRemoved Constant
hi link diffAdded String

" VimDiff

hi DiffAdd guibg=#032218 ctermbg=darkgreen ctermfg=black
hi DiffChange guibg=#100920 ctermbg=darkmagenta ctermfg=black
hi DiffDelete guibg=#220000 guifg=#220000 ctermbg=darkred ctermfg=black
hi DiffText guibg=#000940 ctermbg=darkred

" PHP

hi link phpFunctions Function
hi StorageClass guifg=#c59f6f ctermfg=red
hi link phpSuperglobal Identifier
hi link phpQuoteSingle StringDelimiter
hi link phpQuoteDouble StringDelimiter

" Ruby

hi link rubySharpBang Comment
hi rubyClass guifg=#447799 ctermfg=darkblue
hi rubyIdentifier guifg=#c6b6fe

hi rubyInstanceVariable guifg=#c6b6fe ctermfg=cyan
hi rubySymbol guifg=#7697d6 ctermfg=blue
hi link rubyGlobalVariable rubyInstanceVariable
hi link rubyModule rubyClass
hi rubyControl guifg=#7597c6

hi link rubyString String
hi link rubyStringDelimiter StringDelimiter
hi link rubyInterpolationDelimiter Identifier

hi rubyRegexpDelimiter guifg=#540063 ctermfg=magenta
hi rubyRegexp guifg=#dd0093 ctermfg=darkmagenta
hi rubyRegexpSpecial guifg=#a40073 ctermfg=magenta

hi rubyPredefinedIdentifier guifg=#de5577 ctermfg=red

" JavaScript
hi link javaScriptValue Constant
hi link javaScriptRegexpString rubyRegexp

" Tag list
hi link TagListFileName Directory
