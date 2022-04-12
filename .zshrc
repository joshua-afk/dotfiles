# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# DECLARE NEW PATHS
WINHOME=$(wslpath "$(wslvar USERPROFILE)")
CDRIVE="/mnt/c"

# PATH
path+=("/bin")
path+=("/usr/bin")
path+=("/usr/local/bin")
path+=("/usr/games")
path+=("/usr/sbin")
path+=("/usr/local/sbin")
path+=("/usr/local/games")
path+=("$HOME")
path+=("$HOME/.local")
path+=("$HOME/.autojump/bin")
path+=("$HOME/.local/bin")
path+=("$HOME/.npm-global/bin")
path+=("$HOME/clones/fzf/bin")
path+=("$HOME/clones/pure")
path+=("$HOME/clones/powerlevel10k")
path+=("/sbin")
export PATH

# ALIASES
alias reload="source ~/.zshrc"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -a --color=auto"
alias lla="ll -a --color=auto"
alias :q="exit"
alias grep="grep -n --color"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade -y"
alias install="sudo apt install -y"
alias nvimv="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias wezterm="nvim $WINHOME/.config/wezterm/wezterm.lua"
alias gitconfig="nvim ~/.gitconfig"
alias nvim-test="python $HOME/clones/vim-plugins-profile/vim-plugins-profile.py nvim"
alias rmgitlock="rm -f .git/index.lock"

# DIRECTORY ALIAS
alias home="cd ~"
alias cdc="cd $CDRIVE"
alias sbruby="cd $CDRIVE/sandbox-ruby"
alias user="cd $WINHOME"
alias laragon="cd $CDRIVE/laragon"
alias www="cd $CDRIVE/laragon/www"

# LARAVEL ALIAS
alias pa="php artisan"
alias tinker="php artisan tinker"

# REACT ALIAS
alias react-create="npx create-react-app"

# PLUGINS
plugins=( 
	zsh-autosuggestions
)

# EXPORTS
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
# export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# SOURCE
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/clones/powerlevel10k/powerlevel10k.zsh-theme

# AUTOLOAD
fpath+=($HOME/.zsh-completions/src $fpath)
fpath+=($HOME/clones/pure)
fpath+=($HOME/clones/powerlevel10k/powerlevel10k.zsh-theme)
eval "$(rbenv init -)"

# PLUGINS-CONFIG
[[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && source $HOME/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

# THEME
ZSH_THEME="powerlevel10k/powerlevel10k"
zstyle :compinstall filename "$HOME/.zshrc"

# SHARE YANK FOR VIM AND TMUX TO SYSTEM (WINDOWS) CLIPBOARD
yanktoclipboard(){
  echo $BUFFER | xsel -i -b
}
pastefromclipboard(){
  RBUFFER=$(xsel -o -b </dev/null)$RBUFFER
}
zle -N yanktoclipboard
zle -N pastefromclipboard
bindkey -a 'yy' yanktoclipboard
bindkey -a 'p' pastefromclipboard

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
