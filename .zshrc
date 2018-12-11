# sh style word splitting
setopt SH_WORD_SPLIT INC_APPEND_HISTORY

SAVEHIST=1000
HISTSIZE=1000
HISTFILE=~/.zsh/.history

# make nicer prompt
source ~/.zsh/git-prompt/zshrc.sh
export PROMPT='%n@%m %~$(git_super_status)
%j%# '

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

# AWS CLI completion
#source /usr/local/share/zsh/site-functions/_aws

# Edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^f' edit-command-line

alias ls='ls -v'
alias l='ls -hGlrt'
alias les='less'
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

export GOPATH=~/go

# ** PATH **
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/opt/gettext/bin:$PATH # homebrew
export PATH=$HOME/bin:$PATH
export PATH=$PATH:/usr/local/share/npm/bin
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:$GOPATH/bin
# ** PATH **

export SVN_EDITOR=emacs
export CLOJURESCRIPT_HOME=/Users/viesti/programming/clojure/clojurescript

export LC_CTYPE="en_US.UTF-8"
#export LEIN_FAST_TRAMPOLINE=y
alias cljsbuild="lein trampoline cljsbuild $@"

export ANDROID_HOME=/usr/local/opt/android-sdk
export EDITOR=emacsclient

export NVM_DIR="/Users/kimmoko/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

ANDROID_NDK=/usr/local/Cellar/android-ndk/r10e
export ANDROID_HOME=/usr/local/opt/android-sdk
export PATH=$PATH:/Users/kimmoko/.local/bin

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
