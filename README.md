# 🏠 Dotfiles

This repository contains my personal dotfiles, managed by [chezmoi](https://www.chezmoi.io/). 
Compatible with Linux and macOS.

Note: My previous version (bash only + symlinking), is still available in [v1](https://github.com/tmcsantos/dotfiles/tree/v1).


## Requirements

* bash
* git
* curl

# Usage

1. Bootstrapping

Clone the repo and run the setup script:

```bash
./setup
```

This will:
- Install [chezmoi](https://www.chezmoi.io/) (if not present)
- Install required system packages
- Apply all dotfiles to your home directory
