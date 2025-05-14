vim.opt.syntax = 'on'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.cinoptions = 'g0h2'  -- no use google style
vim.opt.formatoptions = 'ql'
vim.opt.tabstop = 2  -- tab宽度
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true  -- tab转空格
vim.opt.backspace = { 'indent', 'eol', 'start' }
vim.opt.encoding = 'utf-8'
vim.opt.fileencodings = { 'utf-8', 'ucs-bom', 'shift-jis', 'gb18030', 'gbk', 'gb2312', 'cp936' }
vim.opt.compatible = false  -- 关闭兼容模式
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.fillchars = { vert = '│' }
vim.opt.diffopt:append('vertical')

vim.cmd('colorscheme evening')

-- makefile保留tab
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'make',
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'cpp', 'c'},
  callback = function()
    vim.opt.colorcolumn = '80'
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'defx',
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

vim.api.nvim_set_hl(0, 'MatchParen', {})

-- 分割线样式
vim.api.nvim_set_hl(0, 'VertSplit', { ctermfg = 'green' })
vim.api.nvim_set_hl(0, 'ColorColumn', { ctermbg = 'darkgray' })

-- 高亮行尾空白等
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { ctermbg='red' })
vim.api.nvim_set_hl(0, 'DiffAdd', { cterm={ bold=true }, ctermfg=10, ctermbg=17 })
vim.api.nvim_set_hl(0, 'DiffDelete', { cterm={ bold=true }, ctermfg=10, ctermbg=17 })
vim.api.nvim_set_hl(0, 'DiffChange', { cterm={ bold=true }, ctermfg=10, ctermbg=17 })
vim.api.nvim_set_hl(0, 'DiffText', { cterm={ bold=true }, ctermfg=10, ctermbg=88 })
vim.api.nvim_set_hl(0, 'RedundantSpaces', { ctermbg='red' })

-- 匹配多余空格
vim.cmd([[match RedundantSpaces /\s\+$\| \+\ze\t\|\t/]])

-- terimial
vim.api.nvim_set_keymap('c', '<C-A>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-F>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-B>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-P>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-N>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-T>', 'sp term://bash<CR>', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { noremap = true }) -- esc切换回normal模式

-- 为 .hcc 文件设置 filetype 为 cpp
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*.hcc',
  callback = function()
    vim.bo.filetype = 'cpp'
  end,
})

-- 自动跳转到上次编辑位置
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line = mark[1]
    if line > 0 and line <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})


-- PLUGIN vim-snippet
vim.g.UltiSnipsExpandTrigger = '<C-G>'
-- vim.g.UltiSnipsJumpForwardTrigger = '<C-N>'
-- vim.g.UltiSnipsJumpBackwardTrigger = '<C-B>'


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
vim.keymap.set('n', '<C-B>', ':LeaderfBuffer<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-P>', ':LeaderfFile<CR>', { noremap = true, silent = true })


-- PLUGIN Ack
vim.g.ack_mappings = {
  t  = '<C-W><CR><C-W>T',
  T  = '<C-W><CR><C-W>TgT<C-W>j',
  o  = '<CR>:ccl<CR>',
  O  = '<CR>',
  go = '<CR><C-W>j',
  h  = '<C-W><CR><C-W>K',
  H  = '<C-W><CR><C-W>K<C-W>b',
  v  = '<C-W><CR><C-W>H<C-W>b<C-W>J<C-W>t',
  gv = '<C-W><CR><C-W>H<C-W>b<C-W>J'
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
vim.opt.shortmess:append('c')
vim.opt.signcolumn = 'yes'

vim.keymap.set('i', '<CR>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#confirm']()
  else
    return '<C-G>u<CR><C-R>=coc#on_enter()<CR>'
  end
end, { expr = true, silent = true, buffer = true })

vim.keymap.set('n', '[c', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.keymap.set('n', ']c', '<Plug>(coc-diagnostic-next)', { silent = true })

vim.keymap.set('n', '<leader>gd', '<Plug>(coc-definition)', { silent = true })
vim.keymap.set('n', '<leader>gt', '<Plug>(coc-type-definition)', { silent = true })
vim.keymap.set('n', '<leader>gi', '<Plug>(coc-implementation)', { silent = true })
vim.keymap.set('n', '<leader>gr', '<Plug>(coc-references)', { silent = true })
vim.keymap.set('n', '<leader>to', ':CocOutline<CR>', { silent = true })

vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })
vim.keymap.set('n', 'K', function()
  local filetype = vim.bo.filetype
  if filetype == 'vim' or filetype == 'help' then
    vim.cmd('help ' .. vim.fn.expand('<cword>'))
  else
    vim.fn.CocAction('doHover')
  end
end, { silent = true })

-- autocmd CursorHold * silent call CocActionAsync('highlight')

-- coc#float#has_scroll好像一直返回0, 看着是自己过滤了自动补全的float窗口
vim.keymap.set('n', '<C-D>', function()
  if vim.fn['coc#float#has_scroll']() == 0 then
    return '<C-D>'
  else
    vim.fn['coc#float#scroll'](1)
  end
end, { expr = true, silent = true, nowait = true })
vim.keymap.set('n', '<C-U>', function()
  if vim.fn['coc#float#has_scroll']() == 0 then
    return '<C-U>'
  else
    vim.fn['coc#float#scroll'](0)
  end
end, { expr = true, silent = true, nowait = true })
vim.keymap.set('i', '<C-D>', function()
  if vim.fn['coc#float#has_scroll']() == 1 then
    vim.fn['coc#float#scroll'](1)
  else
    return '<Right>'
  end
end, { expr = true, silent = true, nowait = true })
vim.keymap.set('i', '<C-U>', function()
  if vim.fn['coc#float#has_scroll']() == 1 then
    vim.fn['coc#float#scroll'](0)
  else
    return '<Left>'
  end
end, { expr = true, silent = true, nowait = true })
vim.keymap.set('v', '<C-D>', function()
  if vim.fn['coc#float#has_scroll']() == 0 then
    return '<C-D>'
  else
    vim.fn['coc#float#scroll'](1)
  end
end, { expr = true, silent = true, nowait = true })
vim.keymap.set('v', '<C-U>', function()
  if vim.fn['coc#float#has_scroll']() == 0 then
    return '<C-U>'
  else
    vim.fn['coc#float#scroll'](0)
  end
end, { expr = true, silent = true, nowait = true })

vim.keymap.set('n', '<leader>cn', ':<C-U>CocNext<CR>', { silent = true })
vim.keymap.set('n', '<leader>cp', ':<C-U>CocPrev<CR>', { silent = true })

vim.opt.statusline:append('%{coc#status()}%{get(b:,"coc_current_function","")}')

vim.g.coc_snippet_next = '<C-F>'


-- PLUGIN markdown
vim.g.vim_markdown_preview_browser='firefox'
vim.g.mkdp_auto_close = 0

vim.g.vim_markdown_folding_disabled = 1
vim.api.nvim_set_hl(0, 'markdownH1', { cterm = { bold = true }, ctermfg = 'red' })
vim.api.nvim_set_hl(0, 'markdownH2', { cterm = { bold = true }, ctermfg = 'green' })
vim.api.nvim_set_hl(0, 'markdownH3', { cterm = { bold = true }, ctermfg = 'yellow' })

vim.api.nvim_set_hl(0, 'htmlH1', { cterm = { bold = true }, ctermfg = 'red' })
vim.api.nvim_set_hl(0, 'htmlH2', { cterm = { bold = true }, ctermfg = 'green' })
vim.api.nvim_set_hl(0, 'htmlH3', { cterm = { bold = true }, ctermfg = 'yellow' })


-- PLUGIN gitgutter
vim.keymap.set('n', '[g', '<Plug>(GitGutterPrevHunk)', { silent = true })
vim.keymap.set('n', ']g', '<Plug>(GitGutterNextHunk)', { silent = true })


-- PLUGIN dockergen
vim.g.DoxygenToolkit_commentType = 'C++'


-- PLUGIN defx
vim.keymap.set('n', '<leader>tr', ':Defx<CR>', { silent = true })

vim.fn['defx#custom#option']('_', {
  columns = 'indent:icon:filename',
  winwidth = 30,
  split = 'vertical',
  direction = 'botright',
  show_ignored_files = 1,
  buffer_name = '',
  toggle = 1,
  resume = 1,
})

local function defx_toggle_tree()
  if vim.fn['defx#is_directory']() then
    return vim.fn['defx#do_action']('open_or_close_tree')
  else
    return vim.fn['defx#do_action']('multi', { 'drop' })
  end
end

local function defx_mappings()
  local opts = { silent = true, expr = true, buffer = true }

  vim.keymap.set('n', 'o', defx_toggle_tree, opts)
  vim.keymap.set('n', 's', 'defx#do_action("drop", "vsplit")', opts)
  vim.keymap.set('n', 'S', 'defx#do_action("drop", "split")', opts)
  vim.keymap.set('n', 'm', 'defx#do_action("rename")', opts)
  vim.keymap.set('n', 'd', 'defx#do_action("remove")', opts)
  vim.keymap.set('n', 'c', 'defx#do_action("new_file")', opts)
  vim.keymap.set('n', 'C', 'defx#do_action("new_directory")', opts)
  vim.keymap.set('n', 'yy', 'defx#do_action("yank_path")', opts)
  vim.keymap.set('n', 'Y', 'defx#do_action("copy")', opts)
  vim.keymap.set('n', 'p', 'defx#do_action("paste")', opts)
  vim.keymap.set('n', 'r', 'defx#do_action("redraw")', opts)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'defx',
  callback = defx_mappings,
})

local function check_back_space()
  local col = vim.fn.col('.') - 1
  if col == 0 then
    return true
  end
  local line = vim.fn.getline('.')
  return line:sub(col, col):match('%s') ~= nil
end

vim.keymap.set('i', '<Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#next'](1)
  elseif check_back_space() then
    return '<Tab>'
  else
    return vim.fn['coc#refresh']()
  end
end, { expr = true, silent = true, buffer = true })

vim.keymap.set('i', '<S-Tab>', function()
  if vim.fn['coc#pum#visible']() == 1 then
    return vim.fn['coc#pum#prev'](1)
  else
    return '<C-H>'
  end
end, { expr = true, silent = true, buffer = true })

vim.keymap.set('i', '<C-F>', 'copilot#Accept("\\<CR>")', {
  expr = true, replace_keycodes = false
})
vim.g.copilot_no_tab_map = true


-------------------------------------------------------------------
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/fixup.vim')

