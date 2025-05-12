" $HOME/.config/nvim/init.vim

" ***********vim config
" syntax on
" set number relativenumber
" set smartindent cindent
" set cinoptions=g0h2  " no use google style
" set formatoptions=ql
" set tabstop=2  " tab
" set shiftwidth=2
" set softtabstop=2
" set expandtab  " convert tab to space
" au FileType make set noexpandtab  " make cannot change tag to space
" set backspace=indent,eol,start
" set encoding=utf-8
" set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
" set nocompatible  " vi
" set autowrite " auto save
" set cursorline  " UI
" set nohlsearch
" set fillchars=vert:│
" " set splitbelow    " preview window in bottom
" " set completeopt=menu,preview
" autocmd BufEnter * if index(['cpp', 'c'], &filetype) != -1 | set colorcolumn=80 | else | set colorcolumn= | endif
" autocmd FileType defx set nonumber norelativenumber
" set diffopt+=,vertical  " diff is vertical

" " comment MatchParen
" colorscheme darkblue
" " split line style
" hi VertSplit cterm=NONE ctermfg=Green ctermbg=NONE
" hi colorcolumn cterm=NONE ctermfg=NONE ctermbg=DarkGray
" " empty characters in end
" hi ExtraWhitespace ctermbg=red guibg=red
" hi DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" hi DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" hi DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" hi DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
" hi RedundantSpaces ctermbg=red guibg=red
" match RedundantSpaces /\s\+$\| \+\ze\t\|\t/

" cmap <C-A> <Home>
" cmap <C-F> <Right>
" cmap <C-B> <Left>
" " Up/Down can match the prefix
" cmap <C-P> <Up>
" cmap <C-N> <Down>
" cmap <C-T> sp term://bash<CR>
" tmap <Esc> <C-\><C-n> " 使esc在 terminal中也有相同的表现

" GDB debug
" packadd termdebug
" let g:termdebug_wide=1
" nnoremap <silent> <leader>dc  :Continue<cr>
" nnoremap <silent> <leader>ds  :Step<cr>
" nnoremap <silent> <leader>dn  :Over<cr>
" nnoremap <silent> <leader>db  :Break<cr>

" " filetype plugin indent on
" " autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
" au BufRead,BufNewFile *.hcc set filetype=cpp
" " 自动跳转到上次退出的位置
" au BufReadPost * if line("'\"")>1 && line("'\"")<=line("$") | exe "normal! g'\"" | endif
" " let g:python3_host_prog='/usr/local/miniconda3/bin/python'
" " 会使对应的行不能对齐
" " au VimEnter * if &diff | execute 'windo set wrap' | endif


" " ***************PLUGIN vim-snippet
" let g:UltiSnipsExpandTrigger = "<C-f>"
" let g:UltiSnipsListSnippets = "<C-x>"
" let g:UltiSnipsJumpForwardTrigger = "<C-f>"
" let g:UltiSnipsJumpBackwardTrigger = "<C-b>"

" " *****************PLUGIN a.vim
" let g:alternateExtensions_h='c,cpp,cxx,cc,CC,hcc'
" let g:alternateExtensions_hcc='h,hpp'
" " 即使在buffer里也会特别卡
" " let g:alternateSearchPath='sfr:../source,sfr:../src,sfr:../include,sfr:../inc,reg:/include/src//,reg:/src/include//,reg:/inc/src//,reg:/src/inc//'
" let g:alternateNoDefaultAlternate=1

" " **************** PLUGIN vim-session
" let g:session_autosave = 'no'
" let g:session_autoload = 'no'
" let g:session_directory = '~/.config/nvim/sessions/'

" " **************** PLUGIN Doxygen
" " let g:DoxygenToolkit_commentType = 'C++'
" let g:DoxygenToolkit_anthorName = 'peibozhao, peibozhao@163.com'

" " **************** PLUGIN nerdcommenter
" let g:NERDSpaceDelims = 1
" let g:NERDDefaultAlign = 'left' " 受formatoptions影响

" " **************** PLUGIN LeaderF
" " 与mark.vim冲突
" " nnoremap <leader>mru :LeaderfMru<CR>
" nnoremap <leader>lf :LeaderfFunction<CR>
" nnoremap <C-b> :LeaderfBuffer<CR>
" nnoremap <C-p> :LeaderfFile<CR>

" " **************** PLUGIN Ack
" let g:ack_mappings = {
"       \ "t": "<C-W><CR><C-W>T",
"       \ "T": "<C-W><CR><C-W>TgT<C-W>j",
"       \ "o": "<CR>:ccl<CR>",
"       \ "O": "<CR>",
"       \ "go": "<CR><C-W>j",
"       \ "h": "<C-W><CR><C-W>K",
"       \ "H": "<C-W><CR><C-W>K<C-W>b",
"       \ "v": "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t",
"       \ "gv": "<C-W><CR><C-W>H<C-W>b<C-W>J" }

" " **************** PLUGIN indentLine
" " IndentLinesToggle
" let g:indentLine_fileType = ['python']

" " **************** PLUGIN tagbar
" nnoremap <leader>tb :Tagbar<CR>
" nnoremap <leader>tt :TagbarCurrentTag f<CR>

" " **************** PLUGIN airline
" let g:airline_symbols = {}
" let g:airline_symbols['linenr'] = 'l:'
" let g:airline_symbols['colnr'] = 'v:'
" let g:airline_symbols['whitespace'] = ''
" let g:airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__# / %#__accent_bold#%{g:airline_symbols.colnr}%v%#__restore__#'
" let g:airline#extensions#tagbar#enabled = 1
" let g:airline#extensions#tagbar#flags = 'p'
" let g:airline#extensions#coc#enabled = 0
" " trailing whitespace
" let g:airline#extensions#whitespace#enabled = 1
" let g:airline#extensions#whitespace#trailing_format = '[%s] WS'


" " *************** PLUGIN Coc
" " if hidden is not set, TextEdit might fail.
" set hidden
" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup
" " Better display for messages
" set cmdheight=2
" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300
" " don't give |ins-completion-menu| messages.
" set shortmess+=c
" " always show signcolumns
" set signcolumn=yes
" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()
" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" " Or use `complete_info` if your vim support it, like:
" " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)
" " Remap keys for gotos
" nmap <silent> <leader>gd <Plug>(coc-definition)
" nmap <silent> <leader>gt <Plug>(coc-type-definition)
" nmap <silent> <leader>gi <Plug>(coc-implementation)
" nmap <silent> <leader>gr <Plug>(coc-references)
" nmap <silent> <leader>to :CocOutline<CR>
" " Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
" " Highlight symbol under cursor on CursorHold
" au CursorHold * silent call CocActionAsync('highlight')
" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end
" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)
" " Create mappings for function text object, requires document symbols feature of languageserver.
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
" " Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" " nmap <silent> <TAB> <Plug>(coc-range-select)
" " xmap <silent> <TAB> <Plug>(coc-range-select)
" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')
" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <leader>cld  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" nnoremap <silent> <leader>cle  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <leader>clc  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <leader>clo  :<C-u>CocList outline<cr>
" " Search workleader symbols
" nnoremap <silent> <leader>cly  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <leader>cn  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <leader>cp  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <leader>clr  :<C-u>CocListResume<CR>
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
"   nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
"   inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
"   vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
" endif

" let g:coc_snippet_next = '<C-f>'


" " *************** PLUGIN markdown-preview
" let vim_markdown_preview_browser='firefox'
" let g:mkdp_auto_close = 0

" " *************** PLUGIN gitgutter
" nmap [g <Plug>(GitGutterPrevHunk)
" nmap ]g <Plug>(GitGutterNextHunk)

" " *************** PLUGIN nvim-gdb
" " We're going to define single-letter keymaps, so don't try to define them
" " in the terminal window.  The debugger CLI should continue accepting text commands.
" function! NvimGdbNoTKeymaps()
"   tnoremap <silent> <buffer> <esc> <c-\><c-n>
" endfunction

" let g:nvimgdb_config_override = {
"   \ 'key_next': '1',
"   \ 'key_step': '2',
"   \ 'key_breakpoint': '3',
"   \ 'key_continue': '4',
"   \ 'key_finish': '5',
"   \ 'key_until': '6',
"   \ 'key_frameup': '8',
"   \ 'key_framedown': '9',
"   \ 'set_tkeymaps': "NvimGdbNoTKeymaps",
"   \ }

" command! Break GdbBreakpointToggle
" command! Continue GdbContinue
" command! Frame GdbFrame
" command! Run GdbRun
" command! Until GdbUntil
" " command! Next GdbNext lua NvimGdb.i():send('n')
" " command! Step GdbStep
" command! Finish GdbFinish
" command! FrameUp GdbFrameUp
" command! FrameDown GdbFrameDown
" command! Interrupt GdbInterrupt

" let g:DoxygenToolkit_commentType = "C++"

" " *************** PLUGIN Defx
" set runtimepath+=~/.config/nvim/pack/vim-package/start/defx.nvim
nnoremap <silent> <leader>tr :Defx<CR>
call defx#custom#option('_', {
      \ 'columns': 'indent:icon:filename',
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'botright',
      \ 'show_ignored_files': 1,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1
      \ })
au FileType defx call s:defx_mappings()
function! s:defx_mappings() abort
  " nnoremap <silent><buffer><expr> o     defx#do_action('open')
  nnoremap <silent><buffer><expr> o     <SID>defx_toggle_tree()
  nnoremap <silent><buffer><expr> s     defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> S     defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> m     defx#do_action('rename')
  nnoremap <silent><buffer><expr> d     defx#do_action('remove')
  nnoremap <silent><buffer><expr> c     defx#do_action('new_file')
  nnoremap <silent><buffer><expr> C     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> Y    defx#do_action('copy')
  nnoremap <silent><buffer><expr> p    defx#do_action('paste')
  nnoremap <silent><buffer><expr> r    defx#do_action('redraw')
endfunction
function! s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('multi', ['drop'])
endfunction

" " **************** Markdown
" highlight markdownH1 guifg=#ff5f5f ctermfg=red
" highlight markdownH2 guifg=#ff875f ctermfg=green
" highlight markdownH3 guifg=#ffaf5f ctermfg=yellow

" " for vim-markdown
" highlight htmlH1 guifg=#ff5f5f ctermfg=red
" highlight htmlH2 guifg=#ff875f ctermfg=green
" highlight htmlH3 guifg=#ffaf5f ctermfg=yellow

" let g:vim_markdown_folding_disabled = 1

