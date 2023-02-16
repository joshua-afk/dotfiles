# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
path+=("$HOME/.deta/bin")
path+=("$HOME/clones/fzf/bin")
path+=("$HOME/clones/pure")
path+=("$HOME/clones/powerlevel10k")
path+=("/sbin")
export PATH

function path_remove {
  # Delete path by parts so we can never accidentally remove sub paths
  PATH=${PATH//":$1:"/":"} # delete any instances in the middle
  PATH=${PATH/#"$1:"/} # delete any instance at the beginning
  PATH=${PATH/%":$1"/} # delete any instance in the at the end
}

path_remove '/mnt/c/Users/me/AppData/Roaming/npm'
path_remove '/mnt/c/Program Files/Git'
path_remove '/mnt/c/Program Files/Git/cmd'
path_remove '/mnt/c/Program Files/nodejs'

# ALIAS: MISC
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
alias zshrc="nvim ~/.zshrc"
alias kill="tmux kill-server"
alias exp="explorer.exe ."
alias py="python3"

# ALIAS: FILES
alias wezterm="nvim $WINHOME/.config/wezterm/wezterm.lua"
alias alacritty="nvim $WINHOME/.config/alacritty/alacritty.yml"
alias gitconfig="nvim ~/.gitconfig"
alias autojumpdb="nvim /home/joshua-afk/.local/share/autojump/autojump.txt"
alias ems="vim config/database.yml"

# ALIAS: GIT
alias rmgitlock="rm -f .git/index.lock"

# ALIAS: VIM, NVIM, NEOVIDE
alias vim=nvim
alias update-nvim='sudo rm /usr/local/bin/nvim ; sudo rm -r /usr/local/share/nvim/ ; sudo apt update -y && cd ~/clones/neovim && git checkout master && git pull https://github.com/neovim/neovim.git/ master && git branch -D nightly ; git checkout -b nightly && sudo rm -rf build && make CMAKE_BUILD_TYPE=RelWithDebInfo && make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim" && sudo make install && export PATH="$HOME/neovim/bin:$PATH" && git checkout master && git branch -D nightly && cd -'
alias test-nvim="python $HOME/clones/vim-plugins-profile/vim-plugins-profile.py nvim"
alias nvimv="nvim ~/.config/nvim/init.vim"
alias diff='vim -c ":Gdiffsplit"'
alias nv='neovide.exe'

# ALIAS: NGINX
alias start-nginx="sudo service nginx start"
alias stop-nginx="sudo service nginx stop"
alias restart-nginx="sudo service nginx restart"
alias nginxconf='sudo vim /etc/nginx/sites-enabled/default'

# ALIAS: TOR
alias restart-tor='sudo /etc/init.d/tor restart'
alias torrc='sudo vim /etc/tor/torrc'
alias get-onion='sudo cat /var/lib/tor/hidden_service/hostname'
alias nginx-project='cd /var/www/html'

# ALIAS: DIRECTORY
alias home="cd ~"
alias cdc="cd $CDRIVE"
alias cdd="cd /mnt/d"
alias sbruby="cd $CDRIVE/sandbox-ruby"
alias user="cd $WINHOME"
alias laragon="cd $CDRIVE/laragon"
alias www="cd $CDRIVE/laragon/www"
alias appdata="cd $WINHOME/AppData/Local"

# ALIAS: LARAVEL
alias pa="php artisan"
alias tinker="php artisan tinker"

# ALIAS: REACT
alias react-create="npx create-react-app"

# PLUGINS
plugins=( 
	zsh-autosuggestions,
	history
)

# EXPORTS
export FZF_DEFAULT_COMMAND='fd --type f --color never --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
# export FZF_DEFAULT_COMMAND='ag --nocolor --ignore node_modules -g ""'

# SOURCE
source ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/clones/powerlevel10k/powerlevel10k.zsh-theme

# AUTOLOAD
fpath+=($HOME/.zsh-completions/src $fpath)
fpath+=($HOME/clones/pure)
fpath+=($HOME/clones/powerlevel10k/powerlevel10k.zsh-theme)
# eval "$(rbenv init -)"

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

# TAB Autocompletion case sensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# Remap CTRL + W to CTRL + BACKSPACE
bindkey '^H' backward-kill-word

# Source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
