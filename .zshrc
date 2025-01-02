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
export INTERCOM_USER=alexandre.gravem

# token with access to private intercom repositories
export INTERCOM_GITHUB_API_TOKEN=$(cat /Users/alexandregravem/.intercom_github_api_token | tr -d '\n')
# rbenv init added by intercom-dev-env-setup
eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# used by homebrew formulas to access private intercom repos
export HOMEBREW_GITHUB_API_TOKEN=$INTERCOM_GITHUB_API_TOKEN
export HONEYCOMB_DEVELOPMENT_KEY=bd2a9bc85816983d3d9bd7c8cc085214

# Use Hammer for assume-role
alias assume-role='function(){eval $(hammer assume-role $@);}'

# Use Interstack v2 for Pilot
export PILOT_USE_INTERSTACK_V2=true

# initialize pilot environment variables
eval $(pilot env)
if [ -e ~/.pilot/stack/.pilot-env ]; then
  source ~/.pilot/stack/.pilot-env
fi
