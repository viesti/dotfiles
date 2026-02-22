# sh style word splitting
setopt SH_WORD_SPLIT

# make nicer prompt
# export PROMPT='%n@%m %~$(git_super_status) $AWSUME_PROFILE $AWS_DEFAULT_REGION
export PROMPT='%F{green}%n@%m %~%f$(git_super_status)
%j%# '
RPROMPT=''

# set xterm title to pwd on each propmt
precmd() {print -Pn "\e]0;%n@%m: %~\a"}

# enable completions
fpath=(/usr/local/share/zsh/site-functions $fpath)
autoload -Uz compinit
compinit

# ssh known_hosts to host completion
local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts

# Edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

alias ls='ls -v'
alias l='ls -hGlrt'
alias les='less'
alias gut='git'
alias la='ls -la'
alias pstree='pstree -g 2 -w'
alias ncal='ncal -w'
alias grep='grep --color'
alias egrep='egrep -color'
alias st='tail -f /var/log/system.log'
alias vless='vim -u /usr/share/vim/vim72/macros/less.vim'
alias logcat='adb logcat'
alias ldir='find . -type d -maxdepth 1 -mindepth 1 -exec basename {} \;'
alias grep='grep --color'
alias tigu='tig HEAD@{u}..'
alias tiga='tig ..@{u}'
alias lein-debug='JVM_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=${debug_port:-5005} lein'
alias top='top -F -R -o cpu'
alias awsume=". awsume"

export BREAK_CHARS="\"#'(),;\`\\|"
alias sbcl="rlwrap -b \$BREAK_CHARS sbcl"

export SVN_EDITOR=emacs

export LC_CTYPE="en_US.UTF-8"

export EDITOR=emacsclient

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export ZSH_THEME_GIT_PROMPT_PREFIX='%{%}(%{%}'

# Git blaming utility
ggb() {
    git grep -E -n $1 | while IFS=: read i j k; do git blame -L $j,$j $i | cat; done
}

# AWS CLI completion
autoload bashcompinit
bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

