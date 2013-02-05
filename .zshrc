autoload -U promptinit
promptinit
autoload -U compinit promptinit
compinit
promptinit

setopt prompt_subst
setopt auto_cd
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


#Editor

export EDITOR=vim

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" 

# Aliases
source ~/.aliases
source ~/.project_aliases

# MySQL
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
export DYLD_LIBRARY_PATH="/usr/local/mysql/lib:$DYLD_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/usr/local/lib/libtiff.3.dylib:$DYLD_LIBRARY_PATH"

# Vim crashing fix. Source: https://github.com/robgleeson/hammer.vim/issues/22
mvim()
{
    (unset GEM_PATH GEM_HOME; command mvim "$@")
}

source /Users/Scott/src/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
