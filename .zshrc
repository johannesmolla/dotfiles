# command not found
. /data/data/com.termux/files/usr/etc/profile
command_not_found_handler() {
	/data/data/com.termux/files/usr/libexec/termux/command-not-found $1
}

#set nomatch so *.sh would not error if no file is available
setopt +o nomatch
. /data/data/com.termux/files/usr/etc/profile

# git status
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
precmd() {
    vcs_info
}

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b '

# Promt
setopt prompt_subst
PS1='%B%F{yello}%1~%F{red} >%F{cyan}${vcs_info_msg_0_} '

# source files
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto suggest
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# menu
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# zsh zstyle autocomplete
zstyle ':completion:*' completer _extensions _complete _approximate

zstyle ':completion:*' group-name ''

# alias ----------------
alias ll="~/go/bin/./logo-ls -lh"
alias la="~/go/bin/./logo-ls -a"
alias h="cd"
alias rf="rm -rf"
alias rm="rm -i"
alias e="vim"
alias py="python3"
alias grep="grep --color=auto"
alias relo="source ~/.zshrc"
alias :q="exit"
alias ls="~/go/bin/./logo-ls"
alias cat="bat"
alias vimnrc="vim -u NONE -N"
alias server="py -m http.server"
