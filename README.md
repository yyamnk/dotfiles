#dotfiles Setup

個人用設定記録

##Auto settings

```
# if proxy
export HTTPS_PROXY=http://proxy.nagaokaut.ac.jp:8080/
# 
curl -sL https://raw.githubusercontent.com/yyamnk/dotfiles/master/bin/setup.sh | bash
```

実行されること:

1. `~/.dotfiles/`へクローンして, 各設定ファイル`~/.hoge`のシンボリックリンクを貼る
[Ref.](http://orgachem.hatenablog.com/entry/2014/05/13/001100)
2. brew 導入
3. brew cask install git, zsh, vim
4. ログインシェルを`/usr/local/bin/zsh`へ変更
5. proxy環境用 newtwork location を作成
6. brew, brew caskでアプリをインストール
7. karabiner設定
8. Rictyフォント インストール 
[Ref.](http://blog.sotm.jp/2014/01/10/Installing-SublimeText3-iTerm2-Ricty-on-MacOSX-109/)


##Manual settings

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
