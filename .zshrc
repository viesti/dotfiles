# sh style word splitting
setopt SH_WORD_SPLIT INC_APPEND_HISTORY

SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/.zsh/.history

# make nicer prompt
export PROMPT='%n@%m %~$(git_super_status) $AWS_PROFILE $AWS_DEFAULT_REGION
%j%# '
RPROMPT=''

# set xterm title to pwd on each propmt
precmd() {print -Pn "\e]0;%n@%m: %~\a"}

# enable completions
fpath=(/usr/local/share/zsh/site-functions $fpath)
#autoload -Uz compinit
#compinit

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

export BREAK_CHARS="\"#'(),;\`\\|"
alias sbcl="rlwrap -b \$BREAK_CHARS sbcl"

export SVN_EDITOR=emacs

export LC_CTYPE="en_US.UTF-8"
#export LEIN_FAST_TRAMPOLINE=y
alias cljsbuild="lein trampoline cljsbuild $@"

#export ANDROID_HOME=/usr/local/opt/android-sdk
#ANDROID_NDK=/usr/local/Cellar/android-ndk/r10e
#export ANDROID_HOME=/usr/local/opt/android-sdk

export EDITOR=emacsclient

export NVM_DIR="/Users/kimmoko/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#source ~/programming/git-subrepo/.rc

export LEIN_USE_BOOTCLASSPATH=y

export ZSH_THEME_GIT_PROMPT_PREFIX='%{%}(%{%}'

alias jdk8='export JAVA_HOME=`/usr/libexec/java_home -v 1.8`'

if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kimmoko/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kimmoko/google-cloud-sdk/completion.zsh.inc'; fi

# Git blaming utility
ggb() {
    git grep -E -n $1 | while IFS=: read i j k; do git blame -L $j,$j $i | cat; done
}

# AWS CLI completion
autoload bashcompinit
bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# Groovy
export GROOVY_HOME=/usr/local/opt/groovy/libexec
