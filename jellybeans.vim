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

  "Tabpages
  hi TabLine guifg=black guibg=#b0b8c0 gui=italic
  hi TabLineFill guifg=#9098a0
  hi TabLineSel guifg=black guibg=#f0f0f0 gui=italic,bold

  "P-Menu (auto-completion)
  hi Pmenu guifg=white guibg=#000000
  hi PmenuSel guifg=#101010 guibg=#eeeeee
  "PmenuSbar
  "PmenuThumb
endif

hi Visual guibg=#404040

"hi Cursor guifg=NONE guibg=#586068
hi Cursor guibg=#b0d0f0

hi Normal guifg=#e8e8d3 guibg=#151515 ctermfg=white ctermbg=none
"hi LineNr guifg=#808080 guibg=#e0e0e0
hi LineNr guifg=#605958 guibg=#151515 gui=none ctermfg=black
"hi Comment guifg=#5f5a60 gui=italic
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
hi String guifg=#799d6a ctermfg=green
hi Delimiter guifg=#668799 ctermfg=grey
hi Special guifg=#99ad6a ctermfg=green
"hi Number guifg=#ff00fc
"hi Float
"hi Identifier guifg=#7587a6
hi Identifier guifg=#c6b6ee ctermfg=lightcyan
" Type d: 'class'
"hi Structure guifg=#9B859D gui=underline
hi Structure guifg=#8fbfdc gui=NONE ctermfg=lightcyan
hi Function guifg=#fad07a ctermfg=yellow
" dylan: method, library, ... d: if, return, ...
"hi Statement guifg=#7187a1 gui=NONE
hi Statement guifg=#8197bf gui=NONE ctermfg=darkblue
" Keywords  d: import, module...
hi PreProc guifg=#8fbfdc ctermfg=lightblue

hi link Operator Normal

hi Type guifg=#ffb964 gui=NONE ctermfg=yellow
hi NonText guifg=#808080 guibg=#151515

"hi Macro guifg=#a0b0c0 gui=underline

"Tabs, trailing spaces, etc (lcs)
hi SpecialKey guifg=#808080 guibg=#343434

"hi TooLong guibg=#ff0000 guifg=#f8f8f8

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

"hi phpFunctions guifg=#c676be
hi link phpFunctions Function
hi StorageClass guifg=#c59f6f ctermfg=red

" Ruby

hi link rubySharpBang Comment
hi rubyClass guifg=#447799 ctermfg=darkblue
hi rubyIdentifier guifg=#c6b6fe

hi rubyInstanceVariable guifg=#c6b6fe ctermfg=cyan
"hi rubySymbol guifg=#6677ff
hi rubySymbol guifg=#7697d6 ctermfg=blue
hi link rubyGlobalVariable rubyInstanceVariable
hi link rubyModule rubyClass
hi rubyControl guifg=#7597c6

hi link rubyString Special
hi rubyStringDelimiter guifg=#556633 ctermfg=darkgreen
hi link rubyInterpolationDelimiter Identifier

hi rubyRegexpDelimiter guifg=#540063 ctermfg=magenta
hi rubyRegexp guifg=#dd0093 ctermfg=darkmagenta
hi rubyRegexpSpecial guifg=#a40073 ctermfg=magenta

hi rubyPredefinedIdentifier guifg=#de5577 ctermfg=red

" Tag list
hi link TagListFileName Directory
