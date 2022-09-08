# Command history tweaks:
shopt -s histappend
shopt -s histverify
export HISTCONTROL=ignoreboth

# Bash colors
noColor="\e[0m"
green="\e[32m"
yello="\e[33m"
blue="\e[34m"

# Default command line prompt.
PROMPT_DIRTRIM=2
PS1="${green}┌──${noColor}(${blue}\W${noColor}) ${yello}\t${noColor}\n${green}└─${noColor}$ "

# Handles nonexistent commands.
 utility, command-not-found will give a package suggestions.
if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi

# Aliases
alias l="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -lh --color=auto"
alias wd="w3m duckduckgo.com"
alias relo="source ~/.bashrc"
alias rf="rm -rf"
alias rm="rm -i"
alias tree="tree -C"
alias :q="exit"
alias ls="ls --color=auto"
alias nv="nvim"
alias grep="grep --color=auto"
alias vimnorc="vim -u NONE"
alias py="python"
alias c="cd"

# Set vi mod
set -o vi

# Personal path 
PATH=$PATH:$HOME/programs/bin
PATH=$PATH:$HOME../usr/opt/go/bin
PATH=$PATH:$HOME/.cargo/bin

# Go paths
export GOPATH="/data/data/com.termux/files/usr/opt/go"
export GOMODCACHE="/data/data/com.termux/files/usr/opt/go/pkg/mod"
