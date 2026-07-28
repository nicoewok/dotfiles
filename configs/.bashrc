if [ -f ~/.github_token ]; then
    . ~/.github_token
fi

if [[ $- == *i* ]] && [ "$TERM" = "xterm-kitty" ]; then
    clear
    fastfetch
fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.local/bin:$PATH"


# Force Bash to initialize your working user-profile Starship engine
eval "$(/home/nicolang/.nix-profile/bin/starship init bash)"

source <(dotdo completion bash) # dotdo-completion
