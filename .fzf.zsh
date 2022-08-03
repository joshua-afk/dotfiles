# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jr/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/jr/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/jr/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/jr/.fzf/shell/key-bindings.zsh"
