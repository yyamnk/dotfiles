#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# ****************** 00-init.py *******************
# Created	 : 2015-Sep-02
# Last Change: 2018-Feb-01.
# -----------------------------------
# ipython 起動時に自動実行
# ************************************************************

from imp import reload
import numpy as np
import matplotlib as mpl
import matplotlib.pyplot as plt
from matplotlib import cm
import seaborn as sns

from pandas import Series, DataFrame
import pandas as pd
from pprint import pprint as pp
import sys
import pickle
import math
import os

# default figure settings
sns.set_context('poster',
                font_scale=1.3,
                rc={'figure.figsize': [8.0, 6.0],
                    "lines.linewidth": 2.0})
plt.style.use('seaborn-ticks')
# --- font settings
# デフォルトsans-serifはubuntuにない
# mpl.rcParams['font.family'] = ["DejaVu Sans"]
mpl.rcParams['font.family'] = 'STIXGeneral'
# mpl.rcParams['mathtext.fontset'] = 'stix' # デフォルトsansはubuntuにない．
# Changing font to stix; and set bf to italic bold
mpl.rcParams['mathtext.fontset'] = 'custom'
mpl.rcParams['mathtext.it'] = 'STIXGeneral:italic'  # STIXは印刷時遅い?
mpl.rcParams['mathtext.bf'] = 'STIXGeneral:italic:bold'
mpl.rcParams['mathtext.cal'] = 'STIXGeneral:italic'
mpl.rcParams['mathtext.rm'] = 'STIXGeneral:regular'
# legend style
mpl.rcParams['legend.frameon'] = True
mpl.rcParams['legend.shadow'] = True
mpl.use('Qt5Agg')  # savefigと表示を一致させる．ipythonのバックエンドに合わせる
