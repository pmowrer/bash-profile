# Allow users to specify their own ~/.profile
if [ -f ~/.profile.`whoami` ]; then
    source ~/.profile.`whoami`
fi

# Path
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Aliases
alias ls='ls -la'

# Terminal colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Use vi editing mode
set -o vi

# git 

## Command completion & PS1
git_completion='/usr/local/opt/git/etc/bash_completion.d/git-completion.bash'
git_prompt='/usr/local/opt/git/etc/bash_completion.d/git-prompt.sh'

source $git_completion
source $git_prompt

PS1='\u@\h \W$(__git_ps1 " [\[\e[34;1m\]%s\[\e[0m\]]")\$ '

export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

## Colors
if [ -f /usr/bin/git ]; then
    git config --global color.diff True
    git config --global color.branch True
fi

# cd into whatever is the forefront Finder window.
# from: https://github.com/paulirish/dotfiles/commit/e67d1bc03
cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

