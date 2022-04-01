# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH
path+=('/bin')
path+=('/usr/bin')
path+=('/usr/local/bin')
path+=('/usr/games')
path+=('/usr/sbin')
path+=('/usr/local/sbin')
path+=('/usr/local/games')
path+=('/home/jr')
path+=('/home/jr/.local')
path+=('/home/jr/.local/bin')
path+=('/home/jr/.autojump/bin')
path+=('/home/jr/.npm-global/bin')
path+=('/home/jr/.fzf/bin')
path+=('/home/jr/clones/powerlevel10k')
path+=('/sbin')
path+=('/home/jr/.rbenv/bin')
path+=('/home/js/.rbenv/plugins/ruby-build/bin')
eval "$(rbenv init -)"

# ALIASES
alias reload="source ~/.zshrc"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -a --color=auto"
alias lla="ll -a --color=auto"
alias :q="exit"
alias grep="grep -n --color"
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias install="sudo apt install"
alias nvimv="nvim ~/.config/nvim/init.vim"
alias zshrc="nvim ~/.zshrc"
alias gitconfig="nvim ~/.gitconfig"
alias wezterm="nvim /mnt/c/users/jr.velasquez/.config/wezterm/wezterm.lua"
alias nvim-test="python $HOME/clones/vim-plugins-profile/vim-plugins-profile.py nvim"

alias rmgitlock="rm -f .git/index.lock"

# Directory Alias
alias home="cd ~"
alias cdc="cd /mnt/c/"
alias cdd="cd /mnt/d/"
alias user="cd /mnt/c/users/jr.velasquez"

# Laravel Alias
alias pa="php artisan"
alias tinker="php artisan tinker"

# PLUGINS
plugins=( 
	zsh-autosuggestions
)

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# SOURCE
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/clones/powerlevel10k/powerlevel10k.zsh-theme

# PLUGINS-CONFIG
[[ -s /home/jr/.autojump/etc/profile.d/autojump.sh ]] && source /home/jr/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

zstyle :compinstall filename '/home/jr/.zshrc'

# Share yank or vim and tmux to system clipboard
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
