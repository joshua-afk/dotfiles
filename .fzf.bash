# Setup fzf
# ---------
if [[ ! "$PATH" == */home/joshua-afk/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/joshua-afk/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/joshua-afk/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/joshua-afk/.fzf/shell/key-bindings.bash"
