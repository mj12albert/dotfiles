eval "$(/opt/homebrew/bin/brew shellenv)"

[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

#ssh-add --apple-load-keychain

for file in ~/.{bash_prompt,bash_aliases}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# recursive globbing
shopt -s globstar

# set PATH
export PATH=~/.npm-global/bin:$PATH

# Colors
export TERM='xterm-256color'
export CLICOLOR=1;
export GREP_OPTIONS='--color=auto'

# Color output for man pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

# Load any supplementary scripts
if [[ -d $HOME/.bashrc.d ]]; then
    for config in "$HOME"/.bashrc.d/*; do
        [[ -f $config ]] && source "$config"
    done
fi
unset -v config

# nvm
export NVM_SYMLINK_CURRENT=true
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# PATH
export PATH="$HOME/.nvm/current/bin/:$PATH"
