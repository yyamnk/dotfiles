#****************** .aliases.zsh *******************
# created: 2015-Mar-11
# Last Change:2015-Mar-11.
#-----------------------------------------------------------
# aliases for zsh
#************************************************************

# with peco
# pecoでブランチ選択
alias -g B='`git branch -a | peco --prompt "GIT BRANCH>" | head -n 1 | sed -e "s/^\*\s*//g"`'
