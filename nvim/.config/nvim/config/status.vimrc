if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = ''
let g:airline_powerline_fonts = 1

let g:airline#extensions#quickfix#quickfix_text='QF'
let g:airline#extensions#quickfix#location_text='Loc'

let g:airline_theme='serene'
let g:airline_focuslost_inactive=1
