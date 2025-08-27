# Initialize starship
eval "$(starship init bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

# Add `cargo install` binaries to PATH
export PATH="$PATH:/home/nukkel/.cargo/bin"

# Add some aliases
alias sudo="doas"

alias ls="eza"
alias ll="eza -l"
alias lt="eza -T"
alias la="ll -a"
alias  l="ll"

# Start in a zellij shell by default
eval "$(zellij setup --generate-auto-start bash)"
