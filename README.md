# How to install ?

Put the current repository into your ~/.config/nvim/ folder and then start neovim (neovim .)

```
sudo apt install fzf
sudo apt-get install ripgrep
sudo apt install fd-find
# Need to install rust for mason languages
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
sudo apt install python3 python3-venv

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# for copy paste
sudo apt-get install xsel

# git (note: need to test)
curl -s https://packagecloud.io/install/repositories/dirk-thomas/vcstool/script.deb.sh | sudo bash
sudo apt-get update
sudo apt-get install python3-vcstool

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
:noa w = save without formatting
```

Font: <https://github.com/tonsky/FiraCode>
