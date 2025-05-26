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
vim.opt.completeopt:append('menuone')
vim.opt.completeopt:append('noinsert')

vim.cmd.colorscheme('evening')

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
vim.api.nvim_set_hl(0, 'VertSplit', { fg = 'green', ctermfg = 'green' })
vim.api.nvim_set_hl(0, 'ColorColumn', { bg = 'darkgray', ctermbg = 'darkgray' })

-- 高亮行尾空白
vim.fn.matchadd('ExtraWhitespace', [[\s\+$\| \+\ze\t\|\t]])
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = 'red', ctermbg = 'red' })

-- vim.api.nvim_set_hl(0, 'DiffAdd', { fg = 10, bg = 17, ctermfg = 10, ctermbg = 17 })
-- vim.api.nvim_set_hl(0, 'DiffDelete', { fg = 10, bg = 17, ctermfg = 10, ctermbg = 17 })
-- vim.api.nvim_set_hl(0, 'DiffChange', { fg = 10, bg = 17, ctermfg = 10, ctermbg = 17 })
-- vim.api.nvim_set_hl(0, 'DiffText', { fg = 10, bg = 88, ctermfg = 10, ctermbg = 88 })


-- terimial
vim.api.nvim_set_keymap('c', '<C-A>', '<Home>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-F>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-B>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-P>', '<Up>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-N>', '<Down>', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-T>', 'sp term://bash<CR>', { noremap = true })
vim.keymap.set('t', '<Esc>', '<C-\\><C-N>', { noremap = true }) -- esc切换回normal模式

-- 为hcc文件设置filetype为cpp
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


-- PLUGIN copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-F>', function()
  return vim.fn['copilot#Accept']()
end, { expr = true, replace_keycodes = false, silent = false })


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
-- vim.keymap.set('n', '<leader>lf', ':LeaderfFunction<CR>', { noremap = true, silent = true })
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
-- trailing whitespace
vim.g['airline#extensions#whitespace#enabled'] = 1
vim.g['airline#extensions#whitespace#trailing_format'] = '[%s] WS'


-- PLUGIN markdown
vim.g.vim_markdown_preview_browser='firefox'
vim.g.mkdp_auto_close = 0

vim.g.vim_markdown_folding_disabled = 1
vim.api.nvim_set_hl(0, 'markdownH1', { cterm = { bold = true }, fg = 'lightred' , ctermfg = 'lightred' })
vim.api.nvim_set_hl(0, 'markdownH2', { cterm = { bold = true }, fg = 'yellow', ctermfg = 'yellow' })
vim.api.nvim_set_hl(0, 'markdownH3', { cterm = { bold = true }, fg = 'lightgreen', ctermfg = 'lightgreen' })

vim.api.nvim_set_hl(0, 'htmlH1', { cterm = { bold = true }, fg = 'lightred', ctermfg = 'lightred' })
vim.api.nvim_set_hl(0, 'htmlH2', { cterm = { bold = true }, fg = 'yellow', ctermfg = 'yellow' })
vim.api.nvim_set_hl(0, 'htmlH3', { cterm = { bold = true }, fg = 'lightgreen', ctermfg = 'lightgreen' })


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

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'defx',
  callback = function()
    local opts = { silent = true, expr = true, buffer = true }
    vim.keymap.set('n', 'o', function()
      if vim.fn['defx#is_directory']() then
        return vim.fn['defx#do_action']('open_or_close_tree')
      else
        return vim.fn['defx#do_action']('multi', { 'drop' })
      end
    end, opts)
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
})


-- PLUGIN nvim-lspconfig
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/completion') then
      local chars = {}; for i = 32, 126 do table.insert(chars, string.char(i)) end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- language server for c/c++
vim.lsp.enable('clangd')

-- language server for python
-- python -m pip install pyright
vim.lsp.enable('pyright')

--language server for bash
-- npm i -g bash-language-server
vim.lsp.enable('bashls')

-- language server for vue
-- npm install -g @vue/language-server
-- support typescript in vue
vim.lsp.config('vue_ls', {
  filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
  init_options = { vue = { hybridMode = false, }, },
})
-- vim.lsp.config['ts_ls'] = {}
vim.lsp.enable('vue_ls')

vim.keymap.set('i', '<TAB>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-N>'
  else
    return '<TAB>'
  end
end, { expr = true, silent = true })

vim.keymap.set('i', '<S-TAB>', function()
  if vim.fn.pumvisible() == 1 then
    return '<C-P>'
  else
    return '<S-TAB>'
  end
end, { expr = true, silent = true })


-------------------------------------------------------------------
vim.cmd('source ' .. vim.fn.stdpath('config') .. '/fixup.vim')

