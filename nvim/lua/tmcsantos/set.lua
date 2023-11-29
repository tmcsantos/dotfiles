local opt = vim.opt

opt.autoindent = true
opt.backup = false
opt.belloff = "all"
opt.breakindent = true
opt.cmdheight = 1
opt.colorcolumn = "80"
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Set completeopt to have a better completion experience
opt.confirm = true
opt.equalalways = false
opt.expandtab = true
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25-blinkwait700-blinkon200-blinkoff150,r-cr-o:hor20"
opt.hidden = true
opt.hlsearch = true
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

-- Case insensitive searching UNLESS /C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Cursor highlight control
-- Only have it on in the active buffer
opt.cursorline = true
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
    vim.api.nvim_create_autocmd(event, {
        group = group,
        pattern = pattern,
        callback = function()
            vim.opt_local.cursorline = value
        end,
    })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

opt.clipboard:append { 'unnamedplus' }
