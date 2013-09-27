" Generated by Inspiration at Sweyla
" http://inspiration.sweyla.com/code/seed/622747/

set background=dark

hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "inspiration-622747"

if version >= 700
  hi CursorLine     guibg=#020015
  hi CursorColumn   guibg=#020015
  hi MatchParen     guifg=#FFAC50 guibg=#020015 gui=bold
  hi Pmenu          guifg=#FFFFFF guibg=#323232
  hi PmenuSel       guifg=#FFFFFF guibg=#F30058
endif

" Background and menu colors
hi Cursor           guifg=NONE guibg=#FFFFFF gui=none
hi Normal           guifg=#FFFFFF guibg=#020015 gui=none
hi NonText          guifg=#FFFFFF guibg=#110F24 gui=none
hi LineNr           guifg=#FFFFFF guibg=#1B192E gui=none
hi Normal           guifg=#FFFFFF guibg=#020015 gui=none
hi StatusLine       guifg=#FFFFFF guibg=#320022 gui=italic
hi StatusLineNC     guifg=#FFFFFF guibg=#2A283D gui=none
hi VertSplit        guifg=#FFFFFF guibg=#1B192E gui=none
hi Folded           guifg=#FFFFFF guibg=#020015 gui=none
hi Title            guifg=#F30058 guibg=NONE	gui=bold
hi Visual           guifg=#FFAC50 guibg=#110F24 gui=none
hi SpecialKey       guifg=#BE4400 guibg=#110F24 gui=none

" Syntax highlighting
hi Comment guifg=#F30058 gui=none
hi Constant guifg=#BE4400 gui=none
hi Number guifg=#BE4400 gui=none
hi Identifier guifg=#FF0C0C gui=none
hi Statement guifg=#FFAC50 gui=none
hi Function guifg=#CC5647 gui=none
hi Special guifg=#FF5E00 gui=none
hi PreProc guifg=#FF5E00 gui=none
hi Keyword guifg=#FFAC50 gui=none
hi String guifg=#E50C0C gui=none
hi Type guifg=#FF77B4 gui=none
hi pythonBuiltin guifg=#FF0C0C gui=none