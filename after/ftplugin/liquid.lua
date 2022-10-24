local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  return
end

vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#313126 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#2A3129 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guibg=#302831 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guibg=#282F30 gui=nocombine]]

vim.g.indentLine_enabled = 1
-- vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_char = "▏"
-- vim.g.indent_blankline_char = "▎"

indent_blankline.setup {
    char = "",
    show_current_context = true,
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
