require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "bash",
        "c",
        "dockerfile",
        "go",
        "gomod",
        "graphql",
        "vimdoc",
        "java",
        "javascript",
        "json",
        "lua",
        "python",
        "rust",
        "tsx",
        "typescript",
        "yaml",
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    --ignore_install = { "javascript" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },

    refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
    },

    -- incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --         init_selection = "<TAB>", -- maps in normal mode to init the node/scope selection
    --         node_incremental = "<TAB>", -- increment to the upper named parent
    --         node_decremental = "<S-TAB>", -- decrement to the previous node
    --         scope_incremental = "<C-TAB>", -- increment to the upper scope (as defined in locals.scm)
    --     },
    -- },
}
