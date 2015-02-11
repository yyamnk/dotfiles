#dotfiles Setup

個人用設定記録

##Auto settings

以下をコピペして基本環境を整える.

```
# if proxy
export HTTPS_PROXY=http://proxy.nagaokaut.ac.jp:8080/
# 
curl -sL https://raw.githubusercontent.com/yyamnk/dotfiles/master/bin/setup.sh | bash
```

実行されること:

1. `~/.dotfiles/`へクローンして, 各設定ファイル`~/.hoge`のシンボリックリンクを貼る
[Ref.](http://orgachem.hatenablog.com/entry/2014/05/13/001100)
1. brew 導入
1. brew cask install git, zsh, vim
1. ログインシェルを`/usr/local/bin/zsh`へ変更
1. proxy環境用 newtwork location を作成
1. いつもの`default write`を実行
1. brew, brew caskでアプリをインストール
1. karabiner設定
1. Rictyフォント インストール 
[Ref.](http://blog.sotm.jp/2014/01/10/Installing-SublimeText3-iTerm2-Ricty-on-MacOSX-109/)


##Manual settings

必要に応じてセットアップする

###Change remote repository using https to using ssh

```
cat ~/.ssh/id_rsa.pub | pbcopy
# add public key at
open -a Safari https://github.com/settings/ssh
```

```
git remote remove origin
git remote add origin ssh://git@github.com/yyamnk/dotfiles.git
```

###change host name
```
sudo scutil --set HostName fuga
```

```
# /etc/hosts
127.0.0.1   localhost fuga
```

###Tex

```
curl -sL https://raw.githubusercontent.com/yyamnk/dotfiles/master/bin/setup_basictex.sh | zsh
```


###Ruby

ruby 2.2.0, gollum

```
curl -sL https://raw.githubusercontent.com/yyamnk/dotfiles/master/bin/setup_ruby.sh | zsh
```

