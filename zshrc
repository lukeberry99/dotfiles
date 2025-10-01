eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"

bindkey -s ^f "tmux-sessionizer\n"

alias dev="cd $HOME/repos/github.com/lukeberry99/dev"
alias vault="cd $HOME/vault"
alias personal="cd $HOME/repos/github.com/lukeberry99"
alias repos="cd $HOME/repos"
alias github="cd $HOME/repos/github.com/lukeberry99"
alias lg="lazygit"
alias n="nvim"
alias vim="nvim"


export PATH=$(go env GOPATH)/bin:$PATH

# Source local config if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
