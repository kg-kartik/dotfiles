# [ -f ~/bin/win-sudo/s/path.sh ] && source ~/bin/win-sudo/s/path.sh

# PS1="$(tput setaf 2)\u$(tput setaf 5)@\h \W -> $(tput sgr0)";
# export PS1;
# # export FGRED=$(tput setaf 1);

#Cd into common folders
alias cdp="cd /D/projects/"

# Aliases
alias gs="git status"
alias gaa="git add ."
alias ga="git add"
alias gd="git diff"
alias gc="git commit -m"
alias gl="git log"
alias gps="git push origin"
alias gpl="git pull origin"
alias gprb="git pull --rebase origin"

function gg() {
    ga "$1" || gaa
    gc "$2"
    gps
}

# Colors
red=$(tput setaf 1);
green=$(tput setaf 2);
yellow=$(tput setaf 3);
blue=$(tput setaf 4);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${bold}\]\n";
PS1+="\[${green}\]\u";
PS1+="\[${yellow}\] at ";
PS1+="\[${blue}\]\h";
PS1+="\[${red}\] in ";
PS1+="\[${blue}\]\W";
PS1+="\n";
PS1+="\[${reset}\]\$ \[${reset}\]";
export PS1;