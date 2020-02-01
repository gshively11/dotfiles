uptime

# Path

export PATH=/usr/local/homebrew/bin:$PATH

# PS1

GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# Misc Vars
export EDITOR='vi'
export LSCOLORS=exfxfeaeBxxehehbadacea

# Functions

codesearch() {
  phrase="$1"; search_path="$2";
  grep -r "$phrase" "$search_path" --exclude-dir node_modules --exclude-dir .git --exclude-dir coverage --exclude-dir jspm_packages --exclude-dir dist --exclude package-lock.json --exclude yarn.lock --exclude *.log --exclude junit.xml --exclude *.map --exclude __snapshots_ --exclude .docker_
}

perf() {
  open http://www.brendangregg.com/linuxperf.html
}

gp() {
  commit_message=$*
  git add --a
  git commit -m "$commit_message"
  git push
}

clear_swp() {
  find . -type f -name "*.sw[klmnop]" -delete
}


# Aliases

alias ls="ls -AlGh"
alias vi="vim"

# Plugins

if [ -r $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

if [ -r "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi

[ -e ~/.iterm2_shell_integration.bash ] && source ~/.iterm2_shell_integration.bash 

[ -r ~/.fzf.bash ] && source ~/.fzf.bash
