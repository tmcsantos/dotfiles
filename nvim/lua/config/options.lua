local opt = vim.opt

opt.autoindent = true
opt.backup = false
opt.belloff = "all"
opt.breakindent = true
opt.cmdheight = 1
opt.colorcolumn = "80"
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Set completeopt to have a better completion experience
opt.confirm = true
opt.cursorline = true
opt.equalalways = false
opt.expandtab = true
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-blinkwait700-blinkon200-blinkoff150,r-cr-o:hor20"
opt.hidden = true
opt.hlsearch = true
opt.ignorecase = true -- Ignore case
opt.incsearch = true
opt.isfname:append("@-@")
opt.laststatus = 3
opt.lazyredraw = false
opt.mouse = "a"
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 2
opt.shortmess:append("c")
opt.showmatch = false
opt.showmode = false
opt.signcolumn = "yes"
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true
opt.softtabstop = 2
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.undodir = os.getenv("HOME") .. "/.vim/.undodir"
opt.undofile = true
opt.updatetime = 50
opt.wrap = false

opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

opt.clipboard:append { 'unnamedplus' }

if vim.fn.executable("rg") then
  vim.o.grepprg = "rg --vimgrep --no-heading"
  vim.o.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end
