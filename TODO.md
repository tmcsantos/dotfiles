# TODO

`init` is always making `mkdir -p` to already configured directories.
move said initialization to a `setup` script that initializes all known config directories.
`setup` should/could also install other tools.

`setup` is a one time run.  Can be run at `init` but only once, add a flag file in user dir to keep track when was last run.

`init` should only update the `$PATH` environment variable and add other env variables needed.

move miscellaneous functions to a dedicated user folder, that is added to the `$PATH`.


look up `install .rcfile ~/.config/app/rcfile`

SEE: https://github.com/naggie/dotfiles/


[] - try nvim-dap: https://github.com/rcarriga/nvim-dap-ui
