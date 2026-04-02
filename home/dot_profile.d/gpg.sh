# https://www.gnupg.org/documentation/manuals/gnupg/Invoking-GPG_002dAGENT.html

export GPG_TTY=$(tty)

# launch gpg-agent if not up
if ! pgrep --list-full --uid "$USER" --exact gpg-agent >/dev/null; then
  eval "$(gpg-agent --daemon)"
fi
