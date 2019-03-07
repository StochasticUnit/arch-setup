source ./setup_env.sh

sudo pacman -Syu git

# The basics without which you can't run git
git config --global user.email "$EMAIL"
git config --global user.name "$USERNAME"

# Useful aliases
git config --global alias.st status
git config --global alias.lgo 'log --oneline --graph'
git config --global alias.wip 'commit -a -m "wip"'
git config --global alias.unstage 'reset HEAD --'