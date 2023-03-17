function ColorMyPencils(color)
    color = color or "rose-pine"

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

    vim.g.gruvbox_material_better_performance = 1
    vim.g.gruvbox_material_background = 'soft'
    vim.g.gruvbox_material_transparent_background = 2

    require("tokyonight").setup({
        style = "moon",
        transparent = true,
        lualine_bold = true,
    })

    require("rose-pine").setup({
        --- @usage 'auto'|'main'|'moon'|'dawn'
        variant = 'moon',
        --- @usage 'main'|'moon'|'dawn'
        dark_variant = 'moon',
        dim_nc_background = true,
        disable_background = true,
        disable_float_background = true,
    })

    vim.cmd.colorscheme(color)
end

-- ColorMyPencils()
ColorMyPencils("gruvbox-material")
-- ColorMyPencils("tokyonight")
