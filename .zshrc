autoload -U promptinit
promptinit
autoload -U compinit promptinit
compinit
promptinit

# Command autocomplete
autoload -U compinit
compinit

autoload -U colors && colors



# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

#
# On My Zsh
# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
alias nginx='sudo /opt/nginx/sbin/nginx'
alias ss='script/server'
alias sc='script/console'
alias gco='git checkout'
alias ge='git commit -am "Quick commit, nothing to see here."' # Git commit - needs to be refactored to allow a message to be passed
alias gs='git status'
alias gc='git commit -am'
alias gb='git branch'
alias gl='git log'
alias cs='cap staging deploy'
alias gps='git push github staging'
alias gp='git pull'
alias gc='git checkout'
alias rs='rails server'
alias be='bundle exec'


# Watch the Rails development log
alias dl='tail -f log/development.log'

# Cd into Rev site directory, set up ruby, rails, and start mysql 
alias rev='cd ~/FormFx/rev;rvm use 1.8.7;rvm gemset use rev;mysql.server start'

