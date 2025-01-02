# Ignore history duplicates
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Powerline10k
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.config/zsh/p10k.zsh

# PATH extensions
PATH="$HOME/.local/bin:$PATH"

[ -f ~/.config/zsh/extras.zsh ] && source ~/.config/zsh/extras.zsh
