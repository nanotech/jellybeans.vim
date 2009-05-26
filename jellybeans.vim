" Vim color file
"
"  "    __       _ _       _                             "
"  "    \ \  ___| | |_   _| |__   ___  __ _ _ __  ___    "
"  "     \ \/ _ \ | | | | |  _ \ / _ \/ _  |  _ \/ __|   "
"  "  /\_/ /  __/ | | |_| | |_| |  __/ |_| | | | \__ \   "
"  "  \___/ \___|_|_|\__  |____/ \___|\____|_| |_|___/   "
"  "                 \___/                    256MOD     "
"
"         "A colorful, dark color scheme for Vim."
"
" File:         jellybeans256.vim
" Maintainer:   Daniel Herbert <http://pocket-ninja.com>
" Version:      1.2
" Last Change:  May 26nd, 2009
" Notes:        Added functions from (wombat|desert)256.vim and replaced all
"               hi calls so that jellybeans awesomeness can be replicated as
"               accurately as possible in a 88/256 color terminal.
"               - Credit to David Liang who in turn credits Henry So Jr.
"               - Credit to NanoTech for an awesome colorscheme
"
" " BASED ON THE ORIGINAL JELLYBEANS COLORSCHEME " "
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

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "jellybeans256"


if !has("gui_running") && &t_Co != 88 && &t_Co != 256
	finish
endif

" functions {{{
" returns an approximate grey index for the given grey level
fun <SID>grey_number(x)
	if &t_Co == 88
		if a:x < 23
			return 0
		elseif a:x < 69
			return 1
		elseif a:x < 103
			return 2
		elseif a:x < 127
			return 3
		elseif a:x < 150
			return 4
		elseif a:x < 173
			return 5
		elseif a:x < 196
			return 6
		elseif a:x < 219
			return 7
		elseif a:x < 243
			return 8
		else
			return 9
		endif
	else
		if a:x < 14
			return 0
		else
			let l:n = (a:x - 8) / 10
			let l:m = (a:x - 8) % 10
			if l:m < 5
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual grey level represented by the grey index
fun <SID>grey_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 46
		elseif a:n == 2
			return 92
		elseif a:n == 3
			return 115
		elseif a:n == 4
			return 139
		elseif a:n == 5
			return 162
		elseif a:n == 6
			return 185
		elseif a:n == 7
			return 208
		elseif a:n == 8
			return 231
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 8 + (a:n * 10)
		endif
	endif
endfun

" returns the palette index for the given grey index
fun <SID>grey_color(n)
	if &t_Co == 88
		if a:n == 0
			return 16
		elseif a:n == 9
			return 79
		else
			return 79 + a:n
		endif
	else
		if a:n == 0
			return 16
		elseif a:n == 25
			return 231
		else
			return 231 + a:n
		endif
	endif
endfun

" returns an approximate color index for the given color level
fun <SID>rgb_number(x)
	if &t_Co == 88
		if a:x < 69
			return 0
		elseif a:x < 172
			return 1
		elseif a:x < 230
			return 2
		else
			return 3
		endif
	else
		if a:x < 75
			return 0
		else
			let l:n = (a:x - 55) / 40
			let l:m = (a:x - 55) % 40
			if l:m < 20
				return l:n
			else
				return l:n + 1
			endif
		endif
	endif
endfun

" returns the actual color level for the given color index
fun <SID>rgb_level(n)
	if &t_Co == 88
		if a:n == 0
			return 0
		elseif a:n == 1
			return 139
		elseif a:n == 2
			return 205
		else
			return 255
		endif
	else
		if a:n == 0
			return 0
		else
			return 55 + (a:n * 40)
		endif
	endif
endfun

" returns the palette index for the given R/G/B color indices
fun <SID>rgb_color(x, y, z)
	if &t_Co == 88
		return 16 + (a:x * 16) + (a:y * 4) + a:z
	else
		return 16 + (a:x * 36) + (a:y * 6) + a:z
	endif
endfun

" returns the palette index to approximate the given R/G/B color levels
fun <SID>color(r, g, b)
	" get the closest grey
	let l:gx = <SID>grey_number(a:r)
	let l:gy = <SID>grey_number(a:g)
	let l:gz = <SID>grey_number(a:b)

	" get the closest color
	let l:x = <SID>rgb_number(a:r)
	let l:y = <SID>rgb_number(a:g)
	let l:z = <SID>rgb_number(a:b)

	if l:gx == l:gy && l:gy == l:gz
		" there are two possibilities
		let l:dgr = <SID>grey_level(l:gx) - a:r
		let l:dgg = <SID>grey_level(l:gy) - a:g
		let l:dgb = <SID>grey_level(l:gz) - a:b
		let l:dgrey = (l:dgr * l:dgr) + (l:dgg * l:dgg) + (l:dgb * l:dgb)
		let l:dr = <SID>rgb_level(l:gx) - a:r
		let l:dg = <SID>rgb_level(l:gy) - a:g
		let l:db = <SID>rgb_level(l:gz) - a:b
		let l:drgb = (l:dr * l:dr) + (l:dg * l:dg) + (l:db * l:db)
		if l:dgrey < l:drgb
			" use the grey
			return <SID>grey_color(l:gx)
		else
			" use the color
			return <SID>rgb_color(l:x, l:y, l:z)
		endif
	else
		" only one possibility
		return <SID>rgb_color(l:x, l:y, l:z)
	endif
endfun

" returns the palette index to approximate the 'rrggbb' hex string
fun <SID>rgb(rgb)
	let l:r = ("0x" . strpart(a:rgb, 0, 2)) + 0
	let l:g = ("0x" . strpart(a:rgb, 2, 2)) + 0
	let l:b = ("0x" . strpart(a:rgb, 4, 2)) + 0
	return <SID>color(l:r, l:g, l:b)
endfun

" sets the highlighting for the given group
fun <SID>X(group, fg, bg, attr)
	if a:fg != ""
		exec "hi ".a:group." guifg=#".a:fg." ctermfg=".<SID>rgb(a:fg)
	endif
	if a:bg != ""
		exec "hi ".a:group." guibg=#".a:bg." ctermbg=".<SID>rgb(a:bg)
	endif
	if a:attr != ""
		if a:attr == 'italic'
			exec "hi ".a:group." gui=".a:attr." cterm=none"
		else
			exec "hi ".a:group." gui=".a:attr." cterm=".a:attr
		endif
	endif
endfun
" }}}

if version >= 700
  call <SID>X("CursorLine","","1c1c1c","")
  call <SID>X("CursorColumn","","1c1c1c","")
  call <SID>X("MatchParen","ffffff","80a090","bold")

  call <SID>X("TabLine","000000","b0b8c0","italic")
  call <SID>X("TabLineFill","9098a0","","")
  call <SID>X("TabLineSel","000000","f0f0f0","italic,bold")

  " Auto-completion
  call <SID>X("Pmenu","ffffff","000000","")
  call <SID>X("PmenuSel","101010","eeeeee","")
endif

call <SID>X("Visual","","404040","")

call <SID>X("Cursor","","b0d0f0","")

call <SID>X("Normal","e8e8d3","151515","")
call <SID>X("LineNr","605958","151515","none")
call <SID>X("Comment","888888","","italic")
call <SID>X("Todo","808080","NONE","bold,italic")

call <SID>X("StatusLine","f0f0f0","101010","italic")
call <SID>X("StatusLineNC","a0a0a0","181818","italic")
call <SID>X("VertSplit","181818","181818","italic")

call <SID>X("Folded","a0a8b0","384048","italic")
call <SID>X("FoldColumn","a0a8b0","384048","")
call <SID>X("SignColumn","a0a8b0","384048","")

call <SID>X("Title","70b950","","bold")

call <SID>X("Constant","cf6a4c","","")
call <SID>X("Special","799d6a","","")
call <SID>X("Delimiter","668799","","")

call <SID>X("String","99ad6a","","")
call <SID>X("StringDelimiter","556633","","")

call <SID>X("Identifier","c6b6ee","","")
call <SID>X("Structure","8fbfdc","","NONE")
call <SID>X("Function","fad07a","","")
call <SID>X("Statement","8197bf","","NONE")
call <SID>X("PreProc","8fbfdc","","")

hi link Operator Normal

call <SID>X("Type","ffb964","","NONE")
call <SID>X("NonText","808080","151515","")

call <SID>X("SpecialKey","808080","343434","")

call <SID>X("Search","f0a0c0","302028","underline")

call <SID>X("Directory","dad085","","NONE")
call <SID>X("Error","","902020","")

" Diff

hi link diffRemoved Constant
hi link diffAdded String

" VimDiff

call <SID>X("DiffAdd","","032218","")
call <SID>X("DiffChange","","100920","")
call <SID>X("DiffDelete","220000","220000","")
call <SID>X("DiffText","","000940","")

" PHP

hi link phpFunctions Function
call <SID>X("StorageClass","c59f6f","","")
hi link phpSuperglobal Identifier
hi link phpQuoteSingle StringDelimiter
hi link phpQuoteDouble StringDelimiter
hi link phpBoolean Constant
hi link phpNull Constant
hi link phpArrayPair Operator

" Ruby

hi link rubySharpBang Comment
call <SID>X("rubyClass","447799","","")
call <SID>X("rubyIdentifier","c6b6fe","","")

call <SID>X("rubyInstanceVariable","c6b6fe","","")
call <SID>X("rubySymbol","7697d6","","")
hi link rubyGlobalVariable rubyInstanceVariable
hi link rubyModule rubyClass
call <SID>X("rubyControl","7597c6","","")

hi link rubyString String
hi link rubyStringDelimiter StringDelimiter
hi link rubyInterpolationDelimiter Identifier

call <SID>X("rubyRegexpDelimiter","540063","","")
call <SID>X("rubyRegexp","dd0093","","")
call <SID>X("rubyRegexpSpecial","a40073","","")

call <SID>X("rubyPredefinedIdentifier","de5577","","")

" JavaScript
hi link javaScriptValue Constant
hi link javaScriptRegexpString rubyRegexp

" Tag list
hi link TagListFileName Directory

" delete functions {{{
delf <SID>X
delf <SID>rgb
delf <SID>color
delf <SID>rgb_color
delf <SID>rgb_level
delf <SID>rgb_number
delf <SID>grey_color
delf <SID>grey_level
delf <SID>grey_number
" }}}
