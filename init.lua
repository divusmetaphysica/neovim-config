-- vim: ts=2 sts=2 sw=2 et
-- External tools required
-- Windows Terminal + pwsh
-- mingw64 toolchain: https://www.msys2.org/
-- ripgrep: https://github.com/BurntSushi/ripgrep
-- win32yank for clipboard integration
-- sharkdp/fd
-- bootstrap lazy.nvim, LazyVim and your plugins
-- set leader key to space
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- terminal settings
local powershell_options = {
  shell = vim.fn.executable("pwsh") == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}

for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.clipboard = "unnamedplus"
opt.completeopt = "menu,menuone,noselect"
opt.mouse = "a"

opt.hlsearch = false
opt.ignorecase = true
opt.smartcase = true

opt.cursorline = true
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.scrolloff = 4
opt.sidescrolloff = 8
opt.winminwidth = 5

opt.expandtab = true
opt.shiftwidth = 4
opt.shiftround = true
opt.tabstop = 4

opt.termguicolors = true
--opt.hidden = true

opt.undofile = true
opt.undolevels = 10000

opt.secure = true
opt.exrc = true

-- Key mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-w>", "<C-\\><C-n><C-w>")

-- minimize terminal split
vim.keymap.set("n", "<C-g>", "3<C-w>_")

local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

vim.keymap.set("n", "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<leader>ff", vim.lsp.buf.format, { desc = "Format Code" })

require("config.lazy")
