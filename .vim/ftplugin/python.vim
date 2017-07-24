python3 << EOF
# insert pyenv-anaconda path to vim-python path
# http://yamitzky.hatenablog.com/entry/2014/05/05/124155
import os
import sys

home = os.path.expanduser("~")
path = home + "/.pyenv/versions/anaconda3-4.3.1/lib/python3.6/site-packages"
if not path in sys.path:
  sys.path.insert(0, path)
EOF
