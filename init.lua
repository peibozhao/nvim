
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


vim.cmd('source ' .. vim.fn.stdpath('config') .. '/init.vim')
