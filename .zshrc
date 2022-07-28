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
PS1='%F{green}:: %B%F{yello}%1d%F{red} %%%F{cyan}${vcs_info_msg_0_} '

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

#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias ----------------
alias ll="ls -lh"
alias la="ls -a"
alias h="cd"
alias rf="rm -rf"
alias rm="rm -i"
alias e="vim"
alias c="clear"
alias py="python3"
alias grep="grep --color=auto"
alias relo="source ~/.zshrc"
