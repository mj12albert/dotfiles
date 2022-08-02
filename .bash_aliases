# ls
alias ls='ls -1FskGh'
alias la='ls -alh'
alias ll='ls -lh'

# cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Allow aliases to be sudo-ed
alias sudo='sudo '

# Recursively create subdirectories with mkdir
alias mkdir="mkdir -p"

#
alias dequarantine="sudo xattr -rd com.apple.quarantine "

# Recursively delete .DS_Store files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# List OSX non-system users
alias lsusers="dscacheutil -q user | grep -A 3 -B 2 -e uid:\ 5'[0-9][0-9]'"

# Speedtest with wget
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'

# Flush DNS cache
alias flush='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder; say DNS cache flushed'

# Use htop instead of top
alias top='htop'

# Tree
alias tree='tree -CF'

# Restart Quicksilver
alias qsr='killall Quicksilver && open /Applications/Quicksilver.app'

# Sublime Text
alias subl='subl -n'

# Search Calibre Library
alias booksearch='calibredb list --search'

# Copy working directory path to clipboard
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Get week
alias week='echo It is week number `date +%V`'

function aws_mfa() {
    unset AWS_ACCESS_KEY_ID
    unset AWS_SECRET_ACCESS_KEY
    unset AWS_SESSION_TOKEN

    session_token_response=`aws sts get-session-token --serial-number arn:aws:iam::870503372671:mfa/albert@neat.hk --token-code $1 --duration-seconds 129600`
    export AWS_ACCESS_KEY_ID=`echo $session_token_response | jq -r .Credentials.AccessKeyId`
    export AWS_SECRET_ACCESS_KEY=`echo $session_token_response | jq -r .Credentials.SecretAccessKey`
    export AWS_SESSION_TOKEN=`echo $session_token_response | jq -r .Credentials.SessionToken`

    return 0
}
