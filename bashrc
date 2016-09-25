# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
stty -ixon
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export TERM=xterm-256color 
source /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
export EDITOR=vim
export PATH=/usr/local/go/bin:$PATH
export GOPATH=/home/phucngo/workspace/go
export PATH=$GOPATH/bin:$PATH
export PATH=~/.config/yarn/global/node_modules/.bin:$PATH
alias w="cd /home/phucngo/workspace/web"
alias g="cd /home/phucngo/workspace/go/src/github.com/ngovanphuc"
alias gl="git log --graph"
alias gs="git status"
alias gf="git diff"

