autoload -U promptinit
promptinit
autoload -U compinit promptinit
compinit
promptinit

setopt prompt_subst
autoload -U colors && colors
promptinit

autoload -Uz vcs_info
 
zstyle ':vcs_info:*' stagedstr '%F{28}●'
zstyle ':vcs_info:*' unstagedstr '%F{11}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

precmd () {
  if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
    zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{blue}]'
  } else {
      zstyle ':vcs_info:*' formats ' [%F{green}%b%c%u%F{red}●%F{blue}]'
    }
  vcs_info
 }
  
setopt prompt_subst
#RPROMPT='%F{blue}$PWD%{$reset_color%}'
PROMPT=' %F{blue}%1d%{$reset_color%}${vcs_info_msg_0_}%F{blue}%(?/%F{blue}/%F{red})%{$reset_color%} %% '




# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

#
# On My Zsh
# Path to your oh-my-zsh configuration.
#export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completionCK RIGHT POINTING INDEX
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git)

#source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias nginx='sudo /opt/nginx/sbin/nginx'
alias ss='script/server'
alias sc='script/console'
alias cs='cap staging deploy'
alias gps='git push github staging'
alias rs='rails server'
alias be='bundle exec'


# GIT
alias gp='git pull'
alias push-gh='git push github master'
alias gc='git commit'
alias gco='git checkout'
alias ge='git commit -am "Quick commit, nothing to see here."' # Git commit - needs to be refactored to allow a message to be passed
alias gs='git status'
alias gb='git branch'
alias gd='git diff --color'
alias ga='git add .'
alias gl='git log -n 20 --oneline --color'

# RVM
alias rvm187='rvm use 1.8.7-p334'

# Mongo
alias mongo='~/data/mongo/bin/mongod '
alias mongo_shell="~/data/mongo/bin/mongo"


# Nginx
alias nginxconf='sudo vim /opt/nginx/conf/nginx.conf'


# Postgresql
alias pgstart='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'

# Watch the Rails development log
alias dl='tail -f log/development.log'

# Cd into Rev site directory, set up ruby, rails, and start mysql 
alias rev='cd ~/FormFx/rev;rvm use 1.8.7-p334;rvm gemset use rev;mysql.server start'
alias rvm-rev='cd ~/FormFx/rev;rvm use 1.8.7-p334@rev'

# Vim crashing fix. Source: https://github.com/robgleeson/hammer.vim/issues/22
mvim()
{
    (unset GEM_PATH GEM_HOME; command mvim "$@")
}
