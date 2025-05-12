
-- 语法高亮
vim.cmd('syntax on')

-- 行号 & 相对行号
vim.opt.number = true
vim.opt.relativenumber = true

-- 缩进相关
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.cinoptions = "g0h2"  -- no use google style
vim.opt.formatoptions = "ql"
vim.opt.tabstop = 2          -- tab宽度
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true     -- tab转空格

-- 特定文件类型设定 (makefile保留tab)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- backspace 设定
vim.opt.backspace = { "indent", "eol", "start" }

-- 编码设定
vim.opt.encoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "ucs-bom", "shift-jis", "gb18030", "gbk", "gb2312", "cp936" }

-- 关闭兼容模式
vim.opt.compatible = false

-- 自动保存
vim.opt.autowrite = true

-- 当前行高亮
vim.opt.cursorline = true

-- 设置填充字符
vim.opt.fillchars = { vert = "│" }

-- diff 窗口垂直排列
vim.opt.diffopt:append("vertical")

-- 自动设置 colorcolumn 仅用于 cpp 和 c
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    local ft = vim.bo.filetype
    if ft == "cpp" or ft == "c" then
      vim.opt.colorcolumn = "80"
    else
      vim.opt.colorcolumn = ""
    end
  end,
})

-- defx 不显示行号
vim.api.nvim_create_autocmd("FileType", {
  pattern = "defx",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

-- 禁用 MatchParen 高亮（等价于“comment MatchParen”）
vim.cmd("hi clear MatchParen")

-- 配色方案
vim.cmd("colorscheme darkblue")

-- 分割线样式
vim.cmd("hi VertSplit cterm=NONE ctermfg=Green ctermbg=NONE")
vim.cmd("hi ColorColumn cterm=NONE ctermfg=NONE ctermbg=DarkGray")

-- 高亮行尾空白等
vim.cmd("hi ExtraWhitespace ctermbg=red guibg=red")
vim.cmd("hi DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red")
vim.cmd("hi DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red")
vim.cmd("hi DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red")
vim.cmd("hi DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red")
vim.cmd("hi RedundantSpaces ctermbg=red guibg=red")

-- 匹配多余空格
vim.cmd([[match RedundantSpaces /\s\+$\| \+\ze\t\|\t/]])

-- 命令行模式映射
vim.cmd([[
cmap <C-A> <Home>
cmap <C-F> <Right>
cmap <C-B> <Left>
cmap <C-P> <Up>
cmap <C-N> <Down>
cmap <C-T> sp term://bash<CR>
]])

-- Terminal 模式下 Esc 切换回普通模式
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true })

-- 为 .hcc 文件设置 filetype 为 cpp
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hcc",
  callback = function()
    vim.bo.filetype = "cpp"
  end,
})

-- 自动跳转到上次编辑位置
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local line = vim.fn.line
    if line([['"]]) > 1 and line([['"]]) <= line("$") then
      vim.cmd('normal! g\'"')
    end
  end,
})

-- PLUGIN vim-snippet
vim.g.UltiSnipsExpandTrigger = "<C-f>"
vim.g.UltiSnipsListSnippets = "<C-x>"
vim.g.UltiSnipsJumpForwardTrigger = "<C-f>"
vim.g.UltiSnipsJumpBackwardTrigger = "<C-b>"

-- PLUGIN a.vim
vim.g.alternateExtensions_h='c,cpp,cxx,cc,CC,hcc'
vim.g.alternateExtensions_hcc='h,hpp'
-- 即使在buffer里也会特别卡
-- vim.g.alternateSearchPath='sfr:../source,sfr:../src,sfr:../include,sfr:../inc,reg:/include/src//,reg:/src/include//,reg:/inc/src//,reg:/src/inc//'
vim.g.alternateNoDefaultAlternate=1

-- PLUGIN vim-session
vim.g.session_autosave = 'no'
vim.g.session_autoload = 'no'
vim.g.session_directory = '~/.config/nvim/sessions/'

-- PLUGIN Doxygen
-- let g:DoxygenToolkit_commentType = 'C++'
vim.g.DoxygenToolkit_anthorName = 'peibozhao, peibozhao@163.com'

-- PLUGIN nerdcommenter
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = 'left' -- 受formatoptions影响

-- PLUGIN LeaderF
-- 与mark.vim冲突
-- nnoremap <leader>mru :LeaderfMru<CR>
vim.keymap.set('n', '<leader>lf', ':LeaderfFunction<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', ':LeaderfBuffer<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-p>', ':LeaderfFile<CR>', { noremap = true, silent = true })

-- PLUGIN Ack
vim.g.ack_mappings = {
  t  = "<C-W><CR><C-W>T",
  T  = "<C-W><CR><C-W>TgT<C-W>j",
  o  = "<CR>:ccl<CR>",
  O  = "<CR>",
  go = "<CR><C-W>j",
  h  = "<C-W><CR><C-W>K",
  H  = "<C-W><CR><C-W>K<C-W>b",
  v  = "<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t",
  gv = "<C-W><CR><C-W>H<C-W>b<C-W>J"
}

-- PLUGIN indentLine
-- IndentLinesToggle
vim.g.indentLine_fileType = {'python'}

-- PLUGIN tagbar
vim.keymap.set('n', '<leader>tb', ':Tagbar<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tt', ':TagbarCurrentTag f<CR>', { noremap = true, silent = true })

-- PLUGIN airline
vim.cmd([[ let g:airline_symbols = {} ]])
vim.g.airline_symbols['linenr'] = 'l:'
vim.g.airline_symbols['colnr'] = 'v:'
vim.g.airline_symbols['whitespace'] = ''
vim.g.airline_section_z = '%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__# / %#__accent_bold#%{g:airline_symbols.colnr}%v%#__restore__#'
vim.g['airline#extensions#tagbar#enabled'] = 1
vim.g['airline#extensions#tagbar#flags'] = 'p'
vim.g['airline#extensions#coc#enabled'] = 0
-- trailing whitespace
vim.g['airline#extensions#whitespace#enabled'] = 1
vim.g['airline#extensions#whitespace#trailing_format'] = '[%s] WS'

-- PLUGIN coc
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "yes"

vim.cmd([[
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if index(['vim','help'], &filetype) >= 0
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
]])

-- TODO SID can only in vim script
-- inoremap <silent><expr> <TAB>
--       \ pumvisible() ? "\<C-n>" :
--       \ <SID>check_back_space() ? "\<TAB>" :
--       \ coc#refresh()
vim.keymap.set("i", "<S-TAB>", [[pumvisible() ? "\<C-p>" : "\<C-h>"]], { expr = true })
vim.keymap.set("i", "<C-Space>", "coc#refresh()", { expr = true, silent = true })
vim.keymap.set("i", "<CR>", [[pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"]], { expr = true })

vim.keymap.set("n", "[c", "<Plug>(coc-diagnostic-prev)", { silent = true })
vim.keymap.set("n", "]c", "<Plug>(coc-diagnostic-next)", { silent = true })

vim.keymap.set("n", "<leader>gd", "<Plug>(coc-definition)", { silent = true })
vim.keymap.set("n", "<leader>gt", "<Plug>(coc-type-definition)", { silent = true })
vim.keymap.set("n", "<leader>gi", "<Plug>(coc-implementation)", { silent = true })
vim.keymap.set("n", "<leader>gr", "<Plug>(coc-references)", { silent = true })
vim.keymap.set("n", "<leader>to", ":CocOutline<CR>", { silent = true })

vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
-- TODO SID can only in vim script
-- nnoremap <silent> K :call <SID>show_documentation()<CR>

vim.keymap.set("x", "<leader>f", "<Plug>(coc-format-selected)")
vim.keymap.set("n", "<leader>f", "<Plug>(coc-format-selected)")

vim.keymap.set("x", "<leader>a", "<Plug>(coc-codeaction-selected)")
vim.keymap.set("n", "<leader>a", "<Plug>(coc-codeaction-selected)")

vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction)")
vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)")

vim.keymap.set("x", "if", "<Plug>(coc-funcobj-i)")
vim.keymap.set("x", "af", "<Plug>(coc-funcobj-a)")
vim.keymap.set("o", "if", "<Plug>(coc-funcobj-i)")
vim.keymap.set("o", "af", "<Plug>(coc-funcobj-a)")

vim.cmd([[
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
]])

vim.cmd([[
augroup mygroup
  autocmd!
  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd FileType typescript,json setlocal formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup END
]])


if vim.fn.has('nvim-0.4.0') == 1 or vim.fn.has('patch-8.2.0750') == 1 then
  vim.keymap.set("n", "<C-d>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"]], { expr = true, silent = true, nowait = true })
  vim.keymap.set("n", "<C-u>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"]], { expr = true, silent = true, nowait = true })
  vim.keymap.set("i", "<C-d>", [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<CR>" : "\<Right>"]], { expr = true, silent = true, nowait = true })
  vim.keymap.set("i", "<C-u>", [[coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<CR>" : "\<Left>"]], { expr = true, silent = true, nowait = true })
  vim.keymap.set("v", "<C-d>", [[coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"]], { expr = true, silent = true, nowait = true })
  vim.keymap.set("v", "<C-u>", [[coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"]], { expr = true, silent = true, nowait = true })
end

vim.keymap.set("n", "<leader>cld", ":<C-u>CocList diagnostics<CR>", { silent = true })
vim.keymap.set("n", "<leader>cle", ":<C-u>CocList extensions<CR>", { silent = true })
vim.keymap.set("n", "<leader>clc", ":<C-u>CocList commands<CR>", { silent = true })
vim.keymap.set("n", "<leader>clo", ":<C-u>CocList outline<CR>", { silent = true })
vim.keymap.set("n", "<leader>cly", ":<C-u>CocList -I symbols<CR>", { silent = true })
vim.keymap.set("n", "<leader>cn", ":<C-u>CocNext<CR>", { silent = true })
vim.keymap.set("n", "<leader>cp", ":<C-u>CocPrev<CR>", { silent = true })
vim.keymap.set("n", "<leader>clr", ":<C-u>CocListResume<CR>", { silent = true })


vim.opt.statusline:append('%{coc#status()}%{get(b:,"coc_current_function","")}')

vim.g.coc_snippet_next = '<C-f>'


-- PLUGIN markdown-preview
vim.g.vim_markdown_preview_browser='firefox'
vim.g.mkdp_auto_close = 0


-- PLUGIN gitgutter
vim.keymap.set('n', '[g', '<Plug>(GitGutterPrevHunk)', { silent = true })
vim.keymap.set('n', ']g', '<Plug>(GitGutterNextHunk)', { silent = true })


-- PLUGIN dockergen
vim.g.DoxygenToolkit_commentType = "C++"


-- PLUGIN defx
-- vim.opt.runtimepath:append("~/.config/nvim/pack/vim-package/start/defx.nvim")

-- vim.keymap.set('n', '<leader>tr', ':Defx<CR>', { silent = true })

-- vim.g.defx_custom_option = {
--   columns = 'indent:icon:filename',
--   winwidth = 30,
--   split = 'vertical',
--   direction = 'botright',
--   show_ignored_files = 1,
--   buffer_name = '',
--   toggle = 1,
--   resume = 1,
-- }

-- vim.api.nvim_create_autocmd('FileType', {
--   pattern = 'defx',
--   callback = function()
--     local function defx_toggle_tree()
--       if vim.fn['defx#is_directory']() then
--         return vim.fn['defx#do_action']('open_or_close_tree')
--       end
--       return vim.fn['defx#do_action']('multi', { 'drop' })
--     end

--     -- 创建 Defx 的键映射
--     vim.keymap.set('n', 'o', defx_toggle_tree, { buffer = true, silent = true })
--     vim.keymap.set('n', 's', function() vim.fn['defx#do_action']('drop', 'vsplit') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'S', function() vim.fn['defx#do_action']('drop', 'split') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'm', function() vim.fn['defx#do_action']('rename') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'd', function() vim.fn['defx#do_action']('remove') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'c', function() vim.fn['defx#do_action']('new_file') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'C', function() vim.fn['defx#do_action']('new_directory') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'yy', function() vim.fn['defx#do_action']('yank_path') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'Y', function() vim.fn['defx#do_action']('copy') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'p', function() vim.fn['defx#do_action']('paste') end, { buffer = true, silent = true })
--     vim.keymap.set('n', 'r', function() vim.fn['defx#do_action']('redraw') end, { buffer = true, silent = true })
--   end,
-- })


-- markdown vim-markdown
vim.cmd([[
  highlight markdownH1 guifg=#ff5f5f ctermfg=red
  highlight markdownH2 guifg=#ff875f ctermfg=green
  highlight markdownH3 guifg=#ffaf5f ctermfg=yellow

  highlight htmlH1 guifg=#ff5f5f ctermfg=red
  highlight htmlH2 guifg=#ff875f ctermfg=green
  highlight htmlH3 guifg=#ffaf5f ctermfg=yellow
]])


vim.g.vim_markdown_folding_disabled = 1


vim.cmd('source ' .. vim.fn.stdpath('config') .. '/init.vim')
