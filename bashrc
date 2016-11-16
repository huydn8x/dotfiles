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
export EDITOR=vim
source /usr/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh 
export GOPATH=/home/phucngo/Desktop/workspace/go
export PATH=$PATH:/home/phucngo/Desktop/workspace/go/bin
alias w="cd ~/Desktop/workspace/web"
alias g="cd /home/phucngo/Desktop/workspace/go/src/github.com/phuc-ngo"
alias gl="git log --graph"
alias gs="git status"
alias gf="git diff"
alias vim="nvim"
export PATH=$PATH:/usr/local/go/bin
