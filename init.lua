vim.opt.syntax = "on"  -- 开启语法高亮
vim.opt.number = true  -- 显示绝对行号
vim.opt.relativenumber = true  -- 显示相对行号（方便跳转）

vim.opt.smartindent = true  -- 智能缩进（简单规则）
vim.opt.cindent = true  -- 启用C语言风格缩进（更严格）
vim.opt.cinoptions = "g0h2"  -- C缩进细节配置（这里自定义，不用Google风格）

vim.opt.formatoptions = "ql"  -- 自动格式化选项（q:允许gq格式化，l:不自动换行）

vim.opt.tabstop = 2  -- 一个Tab显示为2个空格
vim.opt.shiftwidth = 2  -- 自动缩进宽度为2
vim.opt.softtabstop = 2  -- 按Tab键时插入2个空格
vim.opt.expandtab = true  -- 将Tab转换为空格

vim.opt.backspace = { "indent", "eol", "start" }  -- 允许退格删除缩进、换行符和插入前内容

vim.opt.encoding = "utf-8"  -- 内部编码为UTF-8
-- 打开文件时尝试的编码列表（按顺序）
vim.opt.fileencodings = { "utf-8", "ucs-bom", "shift-jis", "gb18030", "gbk", "gb2312", "cp936" }

vim.opt.compatible = false  -- 关闭vi兼容模式, 使用vim/neovim增强功能

vim.opt.autowrite = true  -- 切换buffer时自动保存

vim.opt.cursorline = true  -- 高亮当前行

vim.opt.fillchars = { vert = "│" }  -- 垂直分割线使用美化字符

vim.opt.diffopt:append("vertical")  -- diff模式下使用垂直分屏

vim.opt.completeopt:append("menuone")  -- 补全时即使只有一个也显示菜单
vim.opt.completeopt:append("noinsert")  -- 补全不自动插入，需手动选择


vim.cmd.colorscheme("evening")

-- Makefile保留tab
vim.api.nvim_create_autocmd("FileType", {
  pattern = "make",
  callback = function()
    vim.opt_local.expandtab = false
  end,
})

-- 保存时自动删除行最后的空格
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"cpp", "c"},
  callback = function()
    vim.opt.colorcolumn = "80"
  end,
})

vim.api.nvim_set_hl(0, "MatchParen", {})

-- 分割线样式
vim.api.nvim_set_hl(0, "VertSplit", { fg = "green", ctermfg = "green" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "darkgray", ctermbg = "darkgray" })

-- 高亮行尾空白
vim.fn.matchadd("ExtraWhitespace", [[\s\+$\| \+\ze\t\|\t]])
vim.api.nvim_set_hl(0, "ExtraWhitespace", { bg = "red", ctermbg = "red" })

-- 修改文件对比时的配色
-- vim.api.nvim_set_hl(0, "DiffAdd", { fg = 10, bg = 17, ctermfg = 10, ctermbg = 17 })
-- vim.api.nvim_set_hl(0, "DiffDelete", { fg = 10, bg = 17, ctermfg = 10, ctermbg = 17 })
-- vim.api.nvim_set_hl(0, "DiffChange", { fg = 10, bg = 17, ctermfg = 10, ctermbg = 17 })
-- vim.api.nvim_set_hl(0, "DiffText", { fg = 10, bg = 88, ctermfg = 10, ctermbg = 88 })

-- terimial
vim.api.nvim_set_keymap("c", "<C-A>", "<Home>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-F>", "<Right>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-B>", "<Left>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-P>", "<Up>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-N>", "<Down>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-T>", "sp term://bash<CR>", { noremap = true })
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { noremap = true }) -- esc切换回normal模式

-- 为hcc文件设置filetype为cpp
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.hcc",
  callback = function()
    vim.bo.filetype = "cpp"
  end,
})

-- 自动跳转到上次编辑位置
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, "\"")
    local line = mark[1]
    if line > 0 and line <= vim.api.nvim_buf_line_count(0) then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- PLUGIN copilot
vim.g.copilot_no_tab_map = true
vim.keymap.set("i", "<C-F>", function()
  return vim.fn["copilot#Accept"]()
end, { expr = true, replace_keycodes = false, silent = false })

-- PLUGIN vim-snippet
-- 自动生成代码片段
vim.g.UltiSnipsExpandTrigger = "<C-G>"
-- vim.g.UltiSnipsJumpForwardTrigger = "<C-N>"
-- vim.g.UltiSnipsJumpBackwardTrigger = "<C-B>"

-- PLUGIN a.vim
vim.g.alternateExtensions_h="c,cpp,cxx,cc,CC,hcc"
vim.g.alternateExtensions_hcc="h,hpp"
-- 即使在buffer里也会特别卡
-- vim.g.alternateSearchPath="sfr:../source,sfr:../src,sfr:../include,sfr:../inc,reg:/include/src//,reg:/src/include//,reg:/inc/src//,reg:/src/inc//"
vim.g.alternateNoDefaultAlternate=1

-- PLUGIN vim-session
vim.g.session_autosave = "no"
vim.g.session_autoload = "no"
vim.g.session_directory = "~/.config/nvim/sessions/"

-- PLUGIN nerdcommenter
vim.g.NERDSpaceDelims = 1
vim.g.NERDDefaultAlign = "left" -- 受formatoptions影响

-- PLUGIN LeaderF
-- 与mark.vim冲突
-- nnoremap <leader>mru :LeaderfMru<CR>
-- vim.keymap.set("n", "<leader>lf", ":LeaderfFunction<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-B>", ":LeaderfBuffer<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-P>", ":LeaderfFile<CR>", { noremap = true, silent = true })
vim.g.Lf_UseCache = 0

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
vim.g.indentLine_fileType = {"python"}

-- PLUGIN tagbar
vim.keymap.set("n", "<leader>tb", ":Tagbar<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tt", ":TagbarCurrentTag f<CR>", { noremap = true, silent = true })

-- PLUGIN airline
vim.cmd([[ let g:airline_symbols = {} ]])
vim.g.airline_symbols["linenr"] = "l:"
vim.g.airline_symbols["colnr"] = "v:"
vim.g.airline_symbols["whitespace"] = ""
vim.g.airline_section_z = "%#__accent_bold#%{g:airline_symbols.linenr}%l%#__restore__# / %#__accent_bold#%{g:airline_symbols.colnr}%v%#__restore__#"
vim.g["airline#extensions#tagbar#enabled"] = 1
vim.g["airline#extensions#tagbar#flags"] = "p"
-- trailing whitespace
vim.g["airline#extensions#whitespace#enabled"] = 1
vim.g["airline#extensions#whitespace#trailing_format"] = "[%s] WS"

-- PLUGIN markdown
vim.g.vim_markdown_preview_browser="firefox"
vim.g.mkdp_auto_close = 0

vim.g.vim_markdown_folding_disabled = 1
vim.api.nvim_set_hl(0, "markdownH1", { cterm = { bold = true }, fg = "lightred" , ctermfg = "lightred" })
vim.api.nvim_set_hl(0, "markdownH2", { cterm = { bold = true }, fg = "yellow", ctermfg = "yellow" })
vim.api.nvim_set_hl(0, "markdownH3", { cterm = { bold = true }, fg = "lightgreen", ctermfg = "lightgreen" })

vim.api.nvim_set_hl(0, "htmlH1", { cterm = { bold = true }, fg = "lightred", ctermfg = "lightred" })
vim.api.nvim_set_hl(0, "htmlH2", { cterm = { bold = true }, fg = "yellow", ctermfg = "yellow" })
vim.api.nvim_set_hl(0, "htmlH3", { cterm = { bold = true }, fg = "lightgreen", ctermfg = "lightgreen" })

-- PLUGIN gitgutter
vim.keymap.set("n", "[g", "<Plug>(GitGutterPrevHunk)", { silent = true })
vim.keymap.set("n", "]g", "<Plug>(GitGutterNextHunk)", { silent = true })

-- PLUGIN dockergen
vim.g.DoxygenToolkit_commentType = "C++"

-- PLUGIN defx
vim.api.nvim_create_autocmd("FileType", {
  pattern = "defx",
  callback = function()
    vim.wo.number = false
    vim.wo.relativenumber = false
  end,
})

vim.keymap.set("n", "<leader>tr", ":Defx<CR>", { silent = true })
vim.keymap.set("n", "<leader>tR", ":Defx `escape(getcwd(), ' :')` -search-recursive=`expand('%:p')`<CR>", { silent = true })

vim.fn["defx#custom#option"]("_", {
  columns = "indent:icon:filename",
  winwidth = 30,
  split = "vertical",
  direction = "botright",
  show_ignored_files = 1,
  buffer_name = "",
  toggle = 1,
  resume = 1,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "defx",
  callback = function()
    local opts = { silent = true, expr = true, buffer = true }
    vim.keymap.set("n", "o", function()
      if vim.fn["defx#is_directory"]() then
        return vim.fn["defx#do_action"]("open_or_close_tree")
      else
        return vim.fn["defx#do_action"]("multi", { "drop" })
      end
    end, opts)
    vim.keymap.set("n", "s", "defx#do_action('drop', 'vsplit')", opts)
    vim.keymap.set("n", "S", "defx#do_action('drop', 'split')", opts)
    vim.keymap.set("n", "m", "defx#do_action('rename')", opts)
    vim.keymap.set("n", "d", "defx#do_action('remove')", opts)
    vim.keymap.set("n", "c", "defx#do_action('new_file')", opts)
    vim.keymap.set("n", "C", "defx#do_action('new_directory')", opts)
    vim.keymap.set("n", "yy", "defx#do_action('yank_path')", opts)
    vim.keymap.set("n", "Y", "defx#do_action('copy')", opts)
    vim.keymap.set("n", "p", "defx#do_action('paste')", opts)
    vim.keymap.set("n", "r", "defx#do_action('redraw')", opts)
  end
})

-- PLUGIN Neogen
require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
-- Requirements: cargo install --locked tree-sitter-cli
require('nvim-treesitter').install { 'python', 'cpp' }
require('neogen').setup({})

-- PLUGIN nvim-lspconfig
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method("textDocument/completion") then
      local chars = {};
      local remove_chars = {'{', '}', ')'};
      for i = 32, 126 do table.insert(chars, string.char(i)) end
      for i = #chars, 1, -1 do
        for _, value in ipairs(remove_chars) do
          if chars[i] == value then table.remove(chars, i) break end
        end
      end
      client.server_capabilities.completionProvider.triggerCharacters = chars
      vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    end
  end,
})

-- Break snippet keymap
-- vim.keymap.set("i", "<TAB>", function()
--   if vim.fn.pumvisible() == 1 then
--     return "<C-N>"
--   else
--     return "<TAB>"
--   end
-- end, { expr = true, silent = true })

-- vim.keymap.set("i", "<S-TAB>", function()
--   if vim.fn.pumvisible() == 1 then
--     return "<C-P>"
--   else
--     return "<S-TAB>"
--   end
-- end, { expr = true, silent = true })


-- For vim script, copy from nvim-lspconfig suggestion
vim.lsp.config('lua_ls', {
  cmd = {'lua-language-server', '--logpath=/tmp/'},
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library'
          -- '${3rd}/busted/library'
        }
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = {
        --   vim.api.nvim_get_runtime_file('', true),
        -- }
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

-- Both accepting the current string and accepting auto-completion (including snippets) are used
-- vim.keymap.set("i", "<CR>", function()
--   if vim.fn.pumvisible() == 1 then
--     return "<C-Y>"
--   else
--     return "<CR>"
--   end
-- end, { expr = true, silent = true })

vim.lsp.log.set_level(vim.log.levels.INFO)

-- Requirements:
--   pyright: python -m pip install pyright
--   bashls: npm i -g bash-language-server
--   lua_ls: https://github.com/LuaLS/lua-language-server/releases
--   ts_ls: npm install -g typescript typescript-language-server
--   cssls: npm i -g vscode-langservers-extracted
--   cssmodules_ls: npm install -g cssmodules-language-server
--   dockerls: npm install -g dockerfile-language-server-nodejs
--   neocmake: cargo install neocmakelsp
--   buf_ls(protobuf): npm install @bufbuild/buf
vim.lsp.enable({"clangd", "pyright", "bashls", "lua_ls", "dockerls", "neocmake", "ts_ls", "cssls", "cssmodules_ls", "buf_ls"})

-------------------------------------------------------------------
vim.cmd("source " .. vim.fn.stdpath("config") .. "/fixup.vim")

