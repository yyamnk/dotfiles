#dotfiles Setup

##Clone dotfiles and alias

```
# if proxy
export HTTPS_PROXY=http://proxy.nagaokaut.ac.jp:8080/
# 
curl -sL https://raw.githubusercontent.com/yyamnk/dotfiles/master/bin/setup.sh | bash
```

[Reference](http://orgachem.hatenablog.com/entry/2014/05/13/001100)

##Change remote repository https to ssh

```
cat ~/.ssh/id_rsa.pub | pbcopy
# add public key at
open -a Safari https://github.com/settings/ssh
```

```
git remote remove origin
git remote add origin ssh://git@github.com/yyamnk/dotfiles.git
```
