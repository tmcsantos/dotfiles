# scripts
Miscellaneous scripting functions for bash.

Add the following snippet to your `.bash_profile` file to enable the builtin functions.

```bash
# load custom scripts
if [ -f "$HOME/dotfiles/init" ]; then
  source $HOME/dotfiles/init
fi
```
