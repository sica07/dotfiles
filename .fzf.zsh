# Setup fzf
# ---------
if [[ ! "$PATH" == */home/marius/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/marius/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/marius/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/marius/.fzf/shell/key-bindings.zsh"
