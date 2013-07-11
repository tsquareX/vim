" Generated by Inspiration at Sweyla
" http://inspiration.sweyla.com/code/seed/860319/

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "inspiration-860319"

if version >= 700
  hi CursorLine     guibg=#0B0E00
  hi CursorColumn   guibg=#0B0E00
  hi MatchParen     guifg=#0CFF0C guibg=#0B0E00 gui=bold
  hi Pmenu          guifg=#FFFFFF guibg=#323232
  hi PmenuSel       guifg=#FFFFFF guibg=#1AAB6D
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#FFFFFF gui=none
hi Normal           guifg=#FFFFFF guibg=#0B0E00 gui=none
hi NonText          guifg=#FFFFFF guibg=#1A1D0F gui=none
hi LineNr           guifg=#FFFFFF guibg=#242719 gui=none
hi Normal           guifg=#FFFFFF guibg=#0B0E00 gui=none
hi StatusLine       guifg=#FFFFFF guibg=#0E2D15 gui=italic
hi StatusLineNC     guifg=#FFFFFF guibg=#333628 gui=none
hi VertSplit        guifg=#FFFFFF guibg=#242719 gui=none
hi Folded           guifg=#FFFFFF guibg=#0B0E00 gui=none
hi Title            guifg=#1AAB6D guibg=NONE	gui=bold
hi Visual           guifg=#0CFF0C guibg=#1A1D0F gui=none
hi SpecialKey       guifg=#67398E guibg=#1A1D0F gui=none

" Syntax highlighting
hi Comment guifg=#1AAB6D gui=none
hi Constant guifg=#67398E gui=none
hi Number guifg=#67398E gui=none
hi Identifier guifg=#009ACF gui=none
hi Statement guifg=#0CFF0C gui=none
hi Function guifg=#0CD40C gui=none
hi Special guifg=#30B55B gui=none
hi PreProc guifg=#30B55B gui=none
hi Keyword guifg=#0CFF0C gui=none
hi String guifg=#41CA73 gui=none
hi Type guifg=#5570AB gui=none
hi pythonBuiltin guifg=#009ACF gui=none
