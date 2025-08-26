# Register starship prompt
eval "$(starship init bash)"

# Configure eza to replace ls
alias ls=eza
alias ll="eza -l"
alias lt="eza -T"

# Add cargo install binaries to PATH
export PATH="$PATH:~/.cargo/bin"
