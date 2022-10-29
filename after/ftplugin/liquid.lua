local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.termguicolors = true

vim.cmd [[highlight IndentBlanklineIndent1 guifg=#3C4140 guibg=#37372C gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#3C4140 guibg=#30372F gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#3C4140 guibg=#362E37 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#3C4140 guibg=#2E3536 gui=nocombine]]

require("indent_blankline").setup {
    char = "▎",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
    },
    space_char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
    },
    show_trailing_blankline_indent = false,
}
