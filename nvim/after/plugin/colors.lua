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

    vim.cmd.colorscheme(color)
end

-- ColorMyPencils()
ColorMyPencils("gruvbox-material")
-- ColorMyPencils("tokyonight")
