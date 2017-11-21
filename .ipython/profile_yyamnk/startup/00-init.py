#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ****************** 00-init.py *******************
# Created	 : 2015-Sep-02
# Last Change: 2017-Nov-21.
# -----------------------------------
# ipython 起動時に自動実行
# ************************************************************

from imp import reload
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
import seaborn as sns

from pandas import Series, DataFrame
import pandas as pd
from pprint import pprint as pp
import sys
import pickle
import math

# default figure settings
sns.set_context('poster',
                font_scale=1.3,
                rc={'figure.figsize': [8.0, 6.0],
                    "lines.linewidth": 2.0})
plt.style.use('seaborn-ticks')
# デフォルトsans-serifはubuntuにない
mpl.rcParams['font.family'] = ["DejaVu Sans"]
mpl.rcParams['mathtext.fontset'] = 'stix' # デフォルトsansはubuntuにない．
# legend style
mpl.rcParams['legend.frameon'] = True
mpl.rcParams['legend.shadow'] = True
mpl.use('Qt5Agg')  # savefigと表示を一致させる．ipythonのバックエンドに合わせる
