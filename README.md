# How to install ?

Put the current repository into your ~/.config/nvim/ folder and then start neovim (neovim .)

```
sudo apt install fzf
sudo apt-get install ripgrep

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

Into ~/.bashrc
export PATH="$PATH:/opt/nvim-linux64/bin"
source ~/.bashrc
```

## Uninstall

```
rm -rf ~/.cache/nvim/
rm -rf ~/.local/share/nvim/
rm -rf ~/.local/state/nvim/
sudo apt-get remove neovim
```

## Utils

launch_nvim.sh

```
#!/bin/bash

# Name of the tmux session
SESSION_NAME="dev"

# Launch gnome-terminal
gnome-terminal -- bash -c "
  # Create or attach to the tmux session
  tmux new-session -As $SESSION_NAME -d

  # Open nvim in a new tmux window
  tmux send-keys -t $SESSION_NAME 'nvim .' C-m

  # Attach to the session
  tmux attach-session -t $SESSION_NAME

  # Keep the shell open after tmux exits
  exec bash
"
```


## Glossary

```
:checkhealth = check the health of the nvim install
```

Font: https://github.com/tonsky/FiraCode
