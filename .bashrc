# [ -f ~/bin/win-sudo/s/path.sh ] && source ~/bin/win-sudo/s/path.sh

# PS1="$(tput setaf 2)\u$(tput setaf 5)@\h \W -> $(tput sgr0)";
# export PS1;
# # export FGRED=$(tput setaf 1);
#No systemd config as wsl too can provide you linux utilities only smh :/

#cd into most used projects folder
alias cdp="cd /D/projects/"

# Aliases
alias gs="git status"
alias gaa="git add ."
alias ga="git add"
alias gd="git diff"
alias gc="git clone $1"
alias gcm="git commit -m $1"
alias gl="git log"
alias gps="git push origin"
alias gpl="git pull origin"
alias gsu="git --set-upstream origin master"
alias gprb="git pull --rebase origin"

#Overwriting local changes
function pull_force() {
  git reset --hard HEAD
  git pull --rebase origin $1
}

#Keeping local changes
function pull_stash() {
  git fetch --all
  git stash 
  git merge @{u}
  git stash pop
}

#Adding,committing and pushing files
function gg() {
    ga "$1" || gaa
    gcm "$2"
    gps
}

#Hosting local files
function filehost() {
  curl -T "$1" -Lv station307.com 2>&1 | grep located-at
}

#Knowing current branch and showing it on PS1
function git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Colors
red=$(tput setaf 1);
green=$(tput setaf 2);
yellow=$(tput setaf 3);
blue=$(tput setaf 4);
magenta=$(tput setaf 5);
cyan=$(tput setf 6);
bold=$(tput bold);
reset=$(tput sgr0);


PS1="\[${bold}\]\n";
PS1+="\[${green}\]\u";
PS1+="\[${magenta}\] at ";
PS1+="\[${cyan}\]\h";
PS1+="\[${blue}\] in ";
PS1+="\[${green}\]\w";
PS1+="\[${green}\]${git_branch}";
PS1+="\n";
PS1+="\[${reset}\]\$ \[${reset}\]";
export PS1;
