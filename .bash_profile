# Initialize starship
eval "$(starship init bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Add `cargo install` binaries to PATH
export PATH="$PATH:/home/nukkel/.cargo/bin"

# Make helix the default editor
export EDITOR="/bin/hx"

# Add some aliases
alias sudo="doas"
alias please="doas"

alias ls="eza"
alias ll="eza -l"
alias lt="eza -T"
alias la="ll -a"
alias  l="ll"
alias ..="cd .."
alias ...="cd ../.."

# Start in a zellij shell by default
eval "$(zellij setup --generate-auto-start bash)"

# Inhibit lid behavior if in ssh
if ! ( elogind-inhibit --list | grep -q "ssh-lid" ) && [[ -n "$SSH_TTY" ]]; then
    echo "starting lid inhibitor for ssh session"
    
    doas /usr/bin/elogind-inhibit --what=handle-lid-switch --who=ssh --why=ssh-lid tail -f /dev/null &
    INHIBIT_PID=$!
    trap 'kill $INHIBIT_PID 2>/dev/null' EXIT HUP INT TERM
fi

# ZOXIDE
eval "$(zoxide init bash --cmd cd)"
