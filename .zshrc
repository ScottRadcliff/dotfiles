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


# Customize to your needs...
alias nginx='sudo /opt/nginx/sbin/nginx'
alias ss='script/server'
alias sc='script/console'
alias cpd='cap production deploy'
alias gps='git push github staging'
alias rs='rails server'
alias be='bundle exec'
alias restart='touch tmp/restart.txt'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -lpGhaF'
alias s='subl'
alias c='clear'

# Projects
alias ct='cd ~/sfc/ctsamples'
alias rev='cd ~/sfc/rev'
alias epc='cd ~/sfc/epc-dreamdesigner'
alias vps='cd ~/sfc/vps'
alias ext='cd ~/sfc/exteriasamples'

# GIT
alias gp='git pull'
alias pgh='git push github master'
alias gc='git commit'
alias gco='git checkout'
alias ge='git commit -am "Quick commit, nothing to see here."' # Git commit - needs to be refactored to allow a message to be passed
alias gits='git status'
alias gb='git branch'
alias gd='git diff --color'
alias ga='git add .'
alias gl='git log -n 20 --oneline --color'
alias gm='git merge'
alias gbm='git branch --merged'
alias grr='git remote rename origin github'
alias gcv='git commit -av'

# RVM
alias rvm187='rvm use 1.8.7@rev'

# Mongo
alias mongo='sudo /usr/local/Cellar/mongodb/2.0.2-x86_64/bin/mongod'
alias mongo_shell='sudo /usr/local/Cellar/mongodb/2.0.2-x86_64/bin/mongo'

# Heroku
alias ph='git push heroku master'

# Nginx
alias nginxconf='sudo vim /opt/nginx/conf/nginx.conf'


# Postgresql
alias pgstart='pg_ctl -D /usr/local/var/postgres -l logfile start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop'

# Watch the Rails development log
alias dl='tail -f log/development.log'

# Cd into Rev site directory, set up ruby, rails, and start mysql 
# alias rev='cd ~/SFC/rev;rvm use 1.8.7-p334;rvm gemset use rev;mysql.server start'
alias rvm-rev='cd ~/SFC/rev;rvm use 1.8.7@rev'


# MySQL
export PATH=/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"

# Vim crashing fix. Source: https://github.com/robgleeson/hammer.vim/issues/22
mvim()
{
    (unset GEM_PATH GEM_HOME; command mvim "$@")
}
