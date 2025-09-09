# TODO

`init` is always making `mkdir -p` to already configured directories.
move said initialization to a `setup` script that initializes all known config directories.
`setup` should/could also install other tools.

`setup` is a one time run.  Can be run at `init` but only once, add a flag file in user dir to keep track when was last run.

`init` should only update the `$PATH` environment variable and add other env variables needed.

move miscellaneous functions to a dedicated user folder, that is added to the `$PATH`.


look up `install .rcfile ~/.config/app/rcfile`

add "shopt -s autocd cdspell" to .bashrc

SEE: https://github.com/naggie/dotfiles/


[] - try lazydev.nvim: https://github.com/folke/lazydev.nvim
[] - try nvim-dap: https://github.com/rcarriga/nvim-dap-ui
[] - try Quarto for notebook integration in neovim: https://quarto.org/docs/get-started/hello/neovim.html
[] - https://github.com/benlubas/molten-nvim/blob/main/docs/Notebook-Setup.md
[] - give a shot at https://starship.rs
[] - try pandoc: for markdown
[] - markdownpreview nvim plugin
