c = get_config()

c.TerminalInteractiveShell.true_color = True

# Getting a list of available styles
# from pygments.styles import get_all_styles
# list(get_all_styles())
c.TerminalInteractiveShell.highlighting_style = 'gruvbox-dark'
c.TerminalInteractiveShell.editing_mode = 'vi'
c.TerminalInteractiveShell.editor = 'vi'
c.TerminalInteractiveShell.timeoutlen = 0
c.TerminalInteractiveShell.true_color = True

c.InteractiveShellApp.exec_lines = []
c.InteractiveShellApp.exec_lines.append('%load_ext autoreload')
c.InteractiveShellApp.exec_lines.append('%autoreload 2')
# c.InteractiveShellApp.exec_lines.append('%matplotlib osx')
c.InteractiveShellApp.exec_lines.append('print("Warning: disable autoreload in ipython_config.py to improve performance.")')

c.InteractiveShell.editor = 'vim'
