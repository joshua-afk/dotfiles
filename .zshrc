# Created by newuser for 5.8
# PATH
path+=('/bin')
path+=('/usr/bin')
path+=('/usr/local/bin')
path+=('/usr/games')
path+=('/usr/sbin')
path+=('/usr/local/sbin')
path+=('/usr/local/games')
path+=('/home/kazuyuki')
path+=('/home/kazuyuki/.local')
path+=('/home/kazuyuki/.local/bin')
path+=('/home/kazuyuki/.autojump/bin')
path+=('/home/kazuyuki/clones/fzf/bin')
path+=('/sbin')

export PATH

# ALIASES
alias reload="source ~/.zshrc"
alias ll="ls -l"
alias la="ls -a"
alias lla="ll -a"
alias :q="exit"
alias grep="grep -n --color"
alias update="sudo apt update"
alias install="sudo apt install"
alias zshrc="vim ~/.zshrc"
alias home="cd ~"
alias win="cd /mnt/c"
alias sbruby="cd /mnt/c/sandbox-ruby"
alias user="cd /mnt/c/users/kazuyuki"
alias cdc="cd /mnt/c/"
alias nvim-test="python $HOME/clones/vim-plugins-profile/vim-plugins-profile.py nvim"

# PLUGINS
plugins=( 
	# other plugins...
	zsh-autosuggestions
)

# SOURCE
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fpath+=($HOME/.zsh-completions/src $fpath)

## PLUGINS-CONFIG
[[ -s /home/kazuyuki/.autojump/etc/profile.d/autojump.sh ]] && source /home/kazuyuki/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

fpath+=('/usr/local/lib/node_modules/pure-prompt/functions')

# THEME
ZSH_THEME="pure"

# Set PURE ZSH as a prompt
autoload -U promptinit; promptinit
prompt pure

zstyle :compinstall filename '/home/kazuyuki/.zshrc'

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
