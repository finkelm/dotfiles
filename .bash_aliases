# Import colors
eval `dircolors ~/.dircolors`

# which `ls` options to use
colorflag="--color"

# List all files colorized in long format
alias l="ls ${colorflag}"

# List all files colorized in long format, including dot files
alias la="ls -lah ${colorflag}"

# List all files colorized in long format, excluding dot files
alias ll="ls -lh ${colorflag}"

# List only directories
alias lsd='ls -lh ${colorflag} | grep "^d"'

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

alias less='less -R'
alias grep='grep --color=auto'

# See if a process is running (ie "p nginx")
alias p='ps -ef | grep -v grep | grep'

# Ruby / Bundler
alias rbe='rbenv bundle exec'
alias rber='rbenv bundle exec rake'

if [ -f ~/.bash_prompt ]; then
  . ~/.bash_prompt
fi

if [ -f ~/.bash_local ]; then
  . ~/.bash_local
fi

if [ -d ~/.bin ]; then
  PATH="$HOME/bin:$PATH"
fi

# Just to make sure everything is loaded.
cowfaces=("" " -d" " -b" "" " -g" " -t" " -w" " -y" " -s" " -p" "")
cowface=${cowfaces[$RANDOM % ${#cowfaces[@]} ]}
_COLUMNS=$(tput cols)
y=$((($_COLUMNS - 40)/ 2))
add=$(printf '%*s' "$y" | tr ' ' ' ')
fortune | cowsay$cowface | sed "s/^/$add/g"
echo ""
