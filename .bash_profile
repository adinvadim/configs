export PATH=/usr/local/bin:$PATH
export PATH=$PATH:~/bin
export LANG=en_US.UTF-8
export EDITOR=vim

export PS1="\e[0;32\$ \e[0;34m\W \e[0;37m"
export CLICOLOR=1
#export LSCOLORS=ExFxGxDxCxegedabagacad
export LSCOLORS=exfxgxdxcxegedabagacad
export kostin="/Users/adinvadim/Desktop/Уроки/Информатика/1курс/kostin"

alias ls='ls -Gh'
alias la="ls -a"
alias ll="ls -la"
alias ..="cd ../"
alias back='cd $OLDPWD'
alias s="cd ~/sandbox"
alias kostin="cd $kostin"
alias settings="vim ~/.bash_profile"
alias o="open ."
alias lessons="cd ~/Desktop/Уроки"
alias pip="pip3"

alias vim="/Applications/MacVim.app/Contents/MacOS/Vim "

function gccf {
    gcc $1 -o $1.out && ./$1.out
}

alias cs="cd"
alias xs="cd"

