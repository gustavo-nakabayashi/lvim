lvim.builtin.terminal.active = true

-- general
lvim.log.level = "warn"
lvim.format_on_save = false
vim.g.gitgutter_override_sign_column_highlight = 1
-- vim.g.gruvbox_transparent_bg = 1
vim.cmd(":set wrap")
vim.cmd(":set linebreak")
vim.cmd(":set breakindent")
vim.cmd(":set breakindentopt=shift:2,min:40,sbr")
vim.cmd(":set showbreak=>>")
vim.cmd("nnoremap <expr> j v:count ? 'j' : 'gj'")
vim.cmd("nnoremap <expr> k v:count ? 'k' : 'gk'")
lvim.colorscheme = "gruvbox"
-- lvim.transparent_window = true
vim.opt.relativenumber = true
-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<C-h>"] = ":lua require('harpoon.ui').nav_file(1)<CR>"
lvim.keys.normal_mode["<C-j>"] = ":lua require('harpoon.ui').nav_file(2)<CR>"
lvim.keys.normal_mode["<C-k>"] = ":lua require('harpoon.ui').nav_file(3)<CR>"
lvim.keys.normal_mode["<C-l>"] = ":lua require('harpoon.ui').nav_file(4)<CR>"

lvim.keys.normal_mode["<C-e>"] = ":lua require('harpoon.ui').toggle_quick_menu()<CR>"

lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.hide_dotfiles = 0
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true


local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } },
  {
    exe = "prettier",
    filetypes = { "typescript", "typescriptreact", "liquid" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", filetypes = { "python" } },
}

require 'lspconfig'.tailwindcss.setup {
  filetypes = {  "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte", "liquid" }
}

require 'lspconfig'.theme_check.setup {}

lvim.plugins = {
  { 'kana/vim-textobj-user' },
  { 'kana/vim-textobj-entire' },
  { 'f-person/git-blame.nvim' },
  { 'mattn/emmet-vim' },
  { 'michaeljsmith/vim-indent-object' },
  { 'wellle/targets.vim' }, -- adds various text objects to give you more targets to operate on.
  { "folke/trouble.nvim", cmd = "TroubleToggle", },
  { "p00f/nvim-ts-rainbow" },
  { 'tpope/vim-surround' },
  { 'mhinz/vim-grepper' },
  { 'tpope/vim-repeat' },
  {'lukas-reineke/indent-blankline.nvim'},
  { 'gustavobcampos/gruvbox' },
  {
    "andymass/vim-matchup", -- It extends vim's % key to language-specific words instead of just single characters.
    event = "CursorMoved",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  { 'bronson/vim-visual-star-search' },
  { 'ThePrimeagen/harpoon' },
  { 'junegunn/fzf' },
  { 'Pocco81/auto-save.nvim' },
  { 'djoshea/vim-autoread' },
  { 'nvim-treesitter/nvim-treesitter-context' },
  { "sindrets/diffview.nvim", event = "BufRead", },
}

require("indent_blankline").setup {
  filetype_exclude = { "dashboard" }
}

require 'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
  }
}

vim.opt.clipboard = ""
-- KEYBINDINGS

lvim.builtin.which_key.vmappings["y"] = { '"+y', "Yank to clipboard" }
lvim.builtin.which_key.mappings["y"] = { '"+y', "Yank to clipboard" }
lvim.builtin.which_key.mappings["Y"] = { '"+yg_', "Yank line to clipboard" }
lvim.builtin.which_key.mappings["sw"] = { ':GrepperGit <C-R><C-W><CR>', "Word" }
lvim.builtin.which_key.mappings["sW"] = { ':GrepperGit <C-R><C-A><CR>', "Word" }

lvim.builtin.which_key.vmappings["pp"] = { '"+p', "Paste from clipboard" }
lvim.builtin.which_key.mappings["pp"] = { '"+p', "Paste from clipboard" }
lvim.builtin.which_key.vmappings["pP"] = { '"+P', "Paste from clipboard" }
lvim.builtin.which_key.mappings["pP"] = { '"+P', "Paste from clipboard" }
lvim.builtin.which_key.mappings["a"] = { ':lua require("harpoon.mark").add_file()<CR>', "Add harpoon" }

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands = {
--   {
--     "FocusGained,BufEnter,CursorHold,CursorHoldI",
--     {
--       pattern = { "*" },
--       command = "if mode() != 'c' | checktime | endif",
--     }
--   },
--   {
--     "FileChangedShellPost",
--     {
--       pattern = { "*" },
--       command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
--     },
--   }
-- }
vim.g.autoread = true
