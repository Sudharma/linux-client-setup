#!/bin/bash

sudo apt update && sudo apt install -y tmux zsh powerline fonts-powerline 

cat <<EOF >> ~/.tmux.conf
# Improve colors
set -g default-terminal 'screen-256color'

setw -g mouse on

# Set scrollback buffer to 10000
set -g history-limit 10000

# Customize the status line
set -g status-fg  green
set -g status-bg  black
EOF

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "source the zshrc file ; you will be prompted for the powerlevel configurations via user selection"

git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> ~/.zshrc

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

echo "Append zsh-autosuggestions & zsh-syntax-highlighting to plugins()"

wget https://raw.githubusercontent.com/ahmetb/kubectl-alias/master/.kubectl_aliases -O $HOME/.kubectl_aliases

echo "[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases" >> ~/.zshrc

#Install kubectx and kubens plugins
git clone https://github.com/ptavares/zsh-kubectx.git ~/.oh-my-zsh/custom/plugins/zsh-kubectx

echo "add zsh-kubectx in the zsh plugin section of ~/.zshrc"

#Install SCM Breeze
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

echo "add this line in zshrc [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh""

#install fzf for kubectx smart drop down
git clone --depth 1 https://github.com/junegunn/fzf.git 
~/.fzf~/.fzf/install
