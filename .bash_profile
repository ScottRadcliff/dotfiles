if [[ -s /Users/scott/.rvm/scripts/rvm ]] ; then source /Users/scott/.rvm/scripts/rvm ; fi
##
# Your previous /Users/scott/.bash_profile file was backed up as /Users/scott/.bash_profile.macports-saved_2010-06-30_at_22:06:31
##

# MacPorts Installer addition on 2010-06-30_at_22:06:31: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export NODE_PATH="/usr/local/lib/node"
# Finished adapting your PATH environment variable for use with MacPorts.

# Aliases
alias nginx='sudo /opt/nginx/sbin/nginx'
alias ss='script/server'
alias sc='script/console'
alias ge='git commit -am "Quick commit, nothing to see here."' # Git commit - needs to be refactored to allow a message to be passed
alias gs='git status'
alias gc='git commit -am "Fixing conflicts"'
alias gb='git branch'
alias cs='cap staging deploy'
alias ps='git push github staging'

# Watch the Rails development log
alias dl='tail -f log/development.log'
# Cd into Rev sire directory, set up ruby, rails, and start mysql 
alias rev='cd ~/FormFx/rev;rvm use 1.8.7;rvm gemset use rev;mysql.server start'

