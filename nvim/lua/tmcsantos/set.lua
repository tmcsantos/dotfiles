local opt = vim.opt

opt.autoindent = true
opt.backup = false
opt.belloff = "all"
opt.cmdheight = 1
opt.colorcolumn = "80"
opt.completeopt = { 'menu', 'menuone', 'noselect' } -- Set completeopt to have a better completion experience
opt.equalalways = false
opt.expandtab = true
opt.guicursor = ""
opt.hidden = true
opt.hlsearch = true
opt.incsearch = true
opt.isfname:append("@-@")
opt.lazyredraw = true
opt.mouse = "a"
opt.nu = true
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 4
opt.shortmess:append("c")
opt.showmatch = false
opt.showmode = false
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undodir = os.getenv("HOME") .. "/./undodir"
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
