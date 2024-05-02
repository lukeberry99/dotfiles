set -Ux EDITOR nvim

set -Ux DOTFILES "$HOME/dotfiles"
set -Ux CODE "$HOME/code"

# Define XDG dirs https://specifications.freedesktop.org/basedir-spec/basedir-spec-0.6.html)
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_CACHE_HOME "$HOME/.cache"
# commented out due to podman
# set -Ux XDG_RUNTIME_DIR "/tmp"
set -Ux XDG_STATE_HOME "$HOME/.local/state"
set -Ux GOPATH "$CODE/go"

set -Ux GNUPGHOME "$HOME/.gnupg"
set -Ux GEM_HOME "$XDG_CONFIG_HOME/.gem"
set -Ux ELECTRON_CONFIG_CACHE "$XDG_CONFIG_HOME/.electron"
set -Ux DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -Ux LESSHISTFILE -
set -Ux CARGO_HOME "$XDG_DATA_HOME/cargo"
set -Ux FNM_DIR "$XDG_DATA_HOME/fnm"
set -Ux RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -Ux NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -Ux NPM_CONFIG_DEVDIR "$XDG_CACHE_HOME/node-gyp"
set -Ux CORE_D_DOTFILE "$XDG_RUNTIME_DIR/.eslint_d"
set -Ux HISTFILE "$XDG_STATE_HOME/bash/history"
set -Ux NODE_REPL_HISTORY "$XDG_DATA_HOME/node_repl_history"
set -Ux DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"
set -Ux RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -Ux DOCKER_CONFIG "$XDG_CONFIG_HOME/docker"

# gum
set -Ux GUM_FILTER_INDICATOR "→"
set -Ux GUM_FILTER_PROMPT " "

# fzf
set -Ux FZF_DEFAULT_OPTS "\
--reverse \
--border rounded \
--no-info \
--pointer='' \
--marker=' ' \
--ansi \
--color='16,bg+:-1,gutter:-1,prompt:5,pointer:5,marker:6,border:4,label:4,header:italic'"

set -Ux FZF_CTRL_R_OPTS "--border-label=' history ' \
--prompt='  '"

set -U fish_greeting

eval (/opt/homebrew/bin/brew shellenv)

fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.local/share/cargo/bin
fish_add_path

if status is-interactive

end

# Abbreviations
abbr --add vim nvim
abbr --add vi nvim
abbr --add v nvim
abbr --add n nvim
abbr --add nw NVIM_APPNAME=nvim-oviwrite nvim

abbr --add mkdir "mkdir -vp"

abbr --add ez "nvim ~/.config/fish/config.fish"
abbr --add sz "source ~/.config/fish/config.fish"
abbr --add conf "nvim ~/.config"

abbr --add lcat "bat --paging always"
abbr --add cat bat
abbr --add f ranger
abbr --add less 'less -r'
abbr --add c clear
abbr --add fh 'open -a Finder .'

abbr --add bi "brew install"
abbr --add bic "brew install --cask"
abbr --add bin "brew info"
abbr --add binc "brew info --cask"
abbr --add bl "brew leaves"
abbr --add blr "brew leaves --installed-on-request"
abbr --add blp "brew leaves --installed-as-dependency"
abbr --add bs "brew search"

abbr --add g git
abbr --add sl "git ls"
abbr --add mkpr 'git push && gh pr create -d -f && pr'
abbr --add gst "git status"
abbr --add gca "git commit --amend"
abbr --add gaa "git add -A"
abbr --add gra "git rebase --abort"
abbr --add grc "git rebase --continue"
abbr --add gpf "git push --force"
abbr --add gcm 'git commit -m "$(gum input)"'
abbr --add gclean 'git branch | cut -c 3- | gum choose --no-limit | xargs git branch -D'
abbr --add pr "gh vpr"
abbr --add vr "gh vr"
abbr --add ga "git ls-files -m -o --exclude-standard | fzf --height 50% --preview 'bat {-1} --color always --style changes,numbers' --print0 -m | xargs -0 -t -o git add"
abbr --add gr "git ls-files -m -o --exclude-standard | fzf --print0 -m | xargs -0 -t -o git  -q HEAD --"
abbr --add lg lazygit
# abbr --add gco "git_checkout"
abbr --add gco "gt co"
abbr --add gsl "gt ls"

abbr --add tn "tmux new -s (pwd | sed 's/.*\///g')"

abbr --add scn "bunx shadcn-ui@latest"

abbr --add dbp "bun prisma db push"

abbr --add cna "bun create next-app@latest"
abbr --add kirimase "bunx kirimase@latest"

abbr --add nuke-desktop "rm -rf ~/Desktop"

export EDITOR='nvim'
export TMUX_CONFIG_HOME="~/.config/tmux"
export AOC_SESSION="53616c7465645f5f018537e23d4b7dacb4848d3d5e387795183b4b4bd7c171c06518a5ec30d9ea2dee23197de67ad16d506c5630f62f6ecb2a0b172020791dce"

zoxide init fish | source
starship init fish | source
fish_add_path /Users/luke/.spicetify

set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/.bin



# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
